module hello_triangle;

import std::io;
import std::os::win32;
import directx;

alias fail_if = directx::fail_if;
alias succeeded = directx::succeeded;

// Window dimensions for our application
const CLIENT_WIDTH = 640;
const CLIENT_HEIGHT = 480;

// Double buffering
const NUM_RENDERTARGETS = 2;

// Standard color format for the render target
const BACK_BUFFER_FORMAT = dxgi::Format.R8G8B8A8_UNORM;

fn int main()
{
    Win32_WNDCLASSEXW wc = {
        .cbSize        = Win32_WNDCLASSEXW.sizeof,
        .style         = win32::CS_VREDRAW | win32::CS_HREDRAW,
        .lpfnWndProc   = &wndProc,
        .cbClsExtra    = 0,
        .cbWndExtra    = 0,
        .hInstance     = win32::getModuleHandleW(null),
        .hIcon         = win32::loadIconW({}, win32::IDI_APPLICATION),
        .hCursor       = win32::loadCursorW({}, win32::IDC_ARROW),
        .hbrBackground = null,
        .lpszMenuName  = null,
        .lpszClassName = string::@wstring("D3D12 Example"),
        .hIconSm       = null
    };
    if (!win32::registerClassExW(&wc))
    {
        abort("registerClassExW failed");
    }

    // Compute window rectangle dimensions based on requested client area dimensions.
	Win32_RECT wnd_rect = { 0, 0, CLIENT_WIDTH, CLIENT_HEIGHT };
    win32::adjustWindowRect(&wnd_rect, win32::WS_OVERLAPPEDWINDOW, 0);

    // Create the window with the adjusted rectangle
    Win32_HWND hwnd = win32::createWindowExW(
        0,
        wc.lpszClassName, string::@wstring("D3D12 Triangle"),
        win32::WS_OVERLAPPEDWINDOW,
        win32::CW_USEDEFAULT, win32::CW_USEDEFAULT,
        wnd_rect.right - wnd_rect.left, wnd_rect.bottom - wnd_rect.top,
        null, null, wc.hInstance, null
    );
    if (!hwnd)
    {
        abort("createWindowExW failed");
    }

     // Show the window
    win32::showWindow(hwnd, win32::SW_SHOW);
    win32::updateWindow(hwnd);

    // Enable the DirectX debug layer if in debug mode - helps catch and report errors
    $if (env::DEBUG_SYMBOLS):
        d3d12::IDebug* debug_controller = null;
        bool debug_controller_available;
        if (Win32_HRESULT hr =
            d3d12::getDebugInterface(&d3d12::IDEBUG_UUID, (void**)&debug_controller), hr >= 0)
        {
            debug_controller_available = true;
            debug_controller.enableDebugLayer();
        }
        else
        {
            io::eprintfn("D3D12 debug interface not available (HRESULT: 0x%08X)\n", (uint)hr);
        }
        defer if (debug_controller_available) {
            debug_controller.release();
        }
    $endif

    // Initialize DXGI factory - this manages adapter enumeration and swap chain creation
    dxgi::IFactory4* factory;
    {
        dxgi::CreateFactoryFlags flags;

        // Enable debug mode for DXGI if debug symbols are available
        $if (env::DEBUG_SYMBOLS):
            flags.debug = true;
        $endif

        fail_if(dxgi::createDXGIFactory2(flags, &dxgi::IFACTORY4_UUID, (void**)&factory),
            "Failed to create DXGI factory");
    }
    defer factory.release();

    // Find a suitable hardware adapter (GPU) to use
    dxgi::IAdapter1* adapter = null;
    {
        uint curr_adapter;
        while (true)
        {
            defer curr_adapter++;
            // Try to enumerate the next adapter
            if (factory.enumAdapters1(curr_adapter, &adapter) == dxgi::ERROR_NOT_FOUND)
            {
                break;
            }

            dxgi::AdapterDesc1 desc;
            fail_if(adapter.getDesc1(&desc), "Failed to get adapter description");

            // Skip software adapters like Microsoft Basic Render Driver
            if (desc.flags.software) continue;

            // Display the name of the selected adapter
            @pool()
            {
                String description = string::from_utf16(allocator::temp(), &desc.description)!!;
                io::printfn("Selected adapter: %s", description);
            };

            // Try to create a D3D12 device with this adapter - if successful, use this adapter
            if (succeeded(d3d12::createDevice(
                (dxgi::IUnknown*)(adapter), d3d12::FEATURE_LEVEL_12_0, &dxgi::IDEVICE_UUID, null)))
            {
                break;
            }
            else
            {
                io::eprintn("Failed to create device");
            }
        }

        if (!adapter)
        {
            abort("Could not find hardware adapter");
        }
    }
    defer adapter.release();

    // Create the D3D12 device - the logical representation of the GPU
    d3d12::IDevice* device = null;
    fail_if(d3d12::createDevice(
        (dxgi::IUnknown*)(adapter),
        d3d12::FEATURE_LEVEL_12_0,
        &d3d12::IDEVICE_UUID,
        (void**)&device), "Failed to create device");
    defer device.release();

     $if (env::DEBUG_SYMBOLS):
        d3d12::IInfoQueue* info_queue;
        bool info_queue_available;
        if (Win32_HRESULT hr =
            device.queryInterface(&d3d12::IINFO_QUEUE_UUID, (void**)&info_queue), hr >= 0)
        {
            info_queue_available = true;

            info_queue.setMuteDebugOutput(FALSE);

            d3d12::MessageSeverity[] severities = {
                INFO,
            };

            d3d12::MessageId[] deny_ids = {
                /*  */
            };

            d3d12::InfoQueueFilter info_queue_filter = {
                .denyList.numSeverities = severities.len,
                .denyList.pSeverityList = severities,
                .denyList.numIDs = deny_ids.len,
                .denyList.pIDList = deny_ids,
            };

            info_queue.pushStorageFilter(&info_queue_filter);

            // Set break on specific severities
            info_queue.setBreakOnSeverity(CORRUPTION, TRUE);
            info_queue.setBreakOnSeverity(ERROR, TRUE);
            // info_queue.setBreakOnSeverity(WARNING, TRUE);

            // Register the callback
            Win32_DWORD callback_cookie;
            fail_if(info_queue.registerMessageCallback(
                    (d3d12::MessageFunc)&debugCallback,
                    {},
                    null,
                    &callback_cookie),
                "Failed to register message callback");
        }
        else
        {
            io::eprintfn("IInfoQueue interface is not available (HRESULT: 0x%08X)\n", (uint)hr);
        }
        defer if (info_queue_available) {
            info_queue.release();
        }
    $endif

    // Create the command queue - used to submit command lists to the GPU
    d3d12::ICommandQueue* queue = null;
    {
        d3d12::CommandQueueDesc desc = {
            .type = DIRECT,  // Direct command queue type for graphics commands
        };

        fail_if(
            device.createCommandQueue(&desc, &d3d12::ICOMMAND_QUEUE_UUID, (void**)(&queue)),
            "Failed creating command queue");
    }
    defer queue.release();

    // Create the swap chain - manages the back buffers that we render to before presenting to
    // the screen. Double buffering allows one buffer to be displayed while the other is being
    // drawn to
    dxgi::ISwapChain3* swapchain = null;

    {
        dxgi::SwapChainDesc1 desc = {
            .width  = CLIENT_WIDTH,
            .height = CLIENT_HEIGHT,
            .format = BACK_BUFFER_FORMAT,  // Color format for the back buffers
            .sampleDesc = {
                .count   = 1,  // No MSAA (Multi-Sample Anti-Aliasing)
                .quality = 0,
            },
            .bufferUsage = { .renderTargetOutput },  // Use the buffers as render targets
            .bufferCount = NUM_RENDERTARGETS,        // Double buffering (2 buffers)
            .scaling     = NONE,                     // No scaling
            .swapEffect  = FLIP_DISCARD,             // Modern and efficient swap effect
            .alphaMode   = UNSPECIFIED,              // No special alpha handling
        };

        fail_if(factory.createSwapChainForHwnd(
                (dxgi::IUnknown*)(queue),
                hwnd,
                &desc,
                null,
                null,
                (dxgi::ISwapChain1**)(&swapchain)),
            "Failed to create swap chain");
    }
    defer swapchain.release();

    // Get the index of the current back buffer
    uint frame_index = swapchain.getCurrentBackBufferIndex();

    // Create a descriptor heap for render target views (RTVs)
    // Descriptor heaps store descriptors, which are like GPU pointers to resources
    d3d12::IDescriptorHeap* rtv_descriptor_heap = null;
    {
        d3d12::DescriptorHeapDesc desc = {
            .numDescriptors = NUM_RENDERTARGETS,  // One descriptor per back buffer
            .type           = RTV,                // Render Target View type
            .flags          = {},                 // No flags needed for RTV heaps
        };

        fail_if(device.createDescriptorHeap(
            &desc, &d3d12::IDESCRIPTOR_HEAP_UUID, (void**)&rtv_descriptor_heap),
            "Failed creating descriptor heap");
    }
    defer rtv_descriptor_heap.release();

    // Get the swap chain's back buffers and create render target views for them
    d3d12::IResource*[NUM_RENDERTARGETS] targets;
    {
        // Get the size of each descriptor in this heap type
        uint rtv_descriptor_size =
            device.getDescriptorHandleIncrementSize(RTV);

        // Get the start of the heap
        d3d12::CpuDescriptorHandle rtv_descriptor_handle;
        rtv_descriptor_heap.getCPUDescriptorHandleForHeapStart(&rtv_descriptor_handle);

        // For each back buffer, get the resource and create a render target view
        for (uint i = 0; i < NUM_RENDERTARGETS; i++)
        {
            fail_if(swapchain.getBuffer(i, &d3d12::IRESOURCE_UUID, (void**)&targets[i]),
                "Failed getting render target");
            // Create a render target view for this buffer
            device.createRenderTargetView(targets[i], null, rtv_descriptor_handle);
            // Move to the next descriptor slot
            rtv_descriptor_handle.ptr += rtv_descriptor_size;
        }
    }
    defer {
        foreach (target : targets) target.release();
    }

    // Create a command allocator - provides memory for command lists
    d3d12::ICommandAllocator* command_allocator = null;
    {
        fail_if(device.createCommandAllocator(
                DIRECT,  // Direct command allocator type for graphics commands
                &d3d12::ICOMMAND_ALLOCATOR_UUID,
                (void**)&command_allocator),
            "Failed creating command allocator");
    }
    defer command_allocator.release();

    // Create a root signature - defines what resources (textures, constant buffers, etc.) are
    // accessible to the shaders. In this simple case, we don't need any resources, just pass
    // vertex data via the input assembler
    d3d12::IRootSignature* root_signature = null;
    {
        d3d12::VersionedRootSignatureDesc desc = {
            .version = VERSION_1_0,
        };

        desc.desc_1_0.flags = { .allowInputAssemblerInputLayout };  // Allow vertex input
        d3d12::IBlob* serialized_desc;
        defer serialized_desc.release();
        fail_if(d3d12::serializeVersionedRootSignature(&desc, &serialized_desc, null),
            "Failed serializing root signature");

        fail_if(device.createRootSignature(
                0,
                serialized_desc.getBufferPointer(),
                serialized_desc.getBufferSize(),
                &d3d12::IROOT_SIGNATURE_UUID,
                (void**)&root_signature),
            "Failed creating root signature");
    }
    defer root_signature.release();

    // Create the graphics pipeline state - defines how vertices and pixels are processed
    d3d12::IPipelineState* pipeline = null;
    {
        // Define the shader code - both vertex shader (VSMain) and pixel shader (PSMain)
        // The vertex shader transforms vertices and passes color to the pixel shader
        // The pixel shader determines the final color of each pixel
        ZString data =
`struct PSInput {
    float4 position : SV_POSITION;
    float4 color : COLOR;
};
PSInput VSMain(float4 position : POSITION0, float4 color : COLOR0) {
    PSInput result;
    result.position = position;
    result.color = color;
    return result;
}
float4 PSMain(PSInput input) : SV_TARGET {
    return input.color;
};`;

        usz data_size = data.len();

        // Set compilation flags based on debug status
        d3dc::CompileFlags compile_flags;
        $if (env::DEBUG_SYMBOLS):
            compile_flags.debug = true;
            compile_flags.skipOptimization = true;  // Skip optimization in debug mode
        $endif

        d3d12::IBlob* vs = null;  // Will hold the compiled vertex shader
        d3d12::IBlob* ps = null;  // Will hold the compiled pixel shader

        // Compile the vertex shader (vs_4_0 profile)
        fail_if(d3dc::compile(
                pSrcData: data,
                srcDataSize: data_size,
                pSourceName: null,
                pDefines: null,
                pInclude: null,
                pEntrypoint: "VSMain",
                pTarget: "vs_4_0",
                flags1: compile_flags,
                flags2: {},
                ppCode: &vs,
                ppErrorMsgs: null),
            "Failed to compile vertex shader");
        defer vs.release();

        // Compile the pixel shader (ps_4_0 profile)
        fail_if(d3dc::compile(
                pSrcData: data,
                srcDataSize: data_size,
                pSourceName: null,
                pDefines: null,
                pInclude: null,
                pEntrypoint: "PSMain",
                pTarget: "ps_4_0",
                flags1: compile_flags,
                flags2: {},
                ppCode: &ps,
                ppErrorMsgs: null),
            "Failed to compile pixel shader");
        defer ps.release();

        // Define the vertex input layout - how vertex data is structured
        d3d12::InputElementDesc[] vertex_format = {
            {
                .semanticName   = "POSITION",        // Position data (defined in shader as POSITION0)
                .format         = R32G32B32_FLOAT,   // 3x 32-bit floats (X, Y, Z)
                .inputSlotClass = PER_VERTEX_DATA,   // Data is per-vertex
            },
            {
                .semanticName      = "COLOR",              // Color data (defined in shader as COLOR0)
                .format            = R32G32B32A32_FLOAT,   // 4x 8-bit unsigned normalized (R, G, B, A)
                .alignedByteOffset = float.sizeof * 3,     // Color starts after position (3 floats)
                .inputSlotClass    = PER_VERTEX_DATA,      // Data is per-vertex
            },
        };

        // Define the default blend state - how pixels being drawn blend with pixels already in
        // the render target. In this case, no blending occurs (source replaces destination)
        d3d12::RenderTargetBlendDesc default_blend_state = {
            .blendEnable           = FALSE,
            .logicOpEnable         = FALSE,
            .srcBlend              = ONE,
            .destBlend             = ZERO,
            .blendOp               = ADD,
            .srcBlendAlpha         = ONE,
            .destBlendAlpha        = ZERO,
            .blendOpAlpha          = ADD,
            .logicOp               = NOOP,
            .renderTargetWriteMask = d3d12::COLOR_WRITE_ENABLE_ALL,
        };

        // Define the complete graphics pipeline state
        d3d12::GraphicsPipelineStateDesc pipeline_state_desc = {
            .pRootSignature = root_signature,
            // Vertex shader configuration
            .vs = {
                .pShaderBytecode = vs.getBufferPointer(),
                .bytecodeLength  = vs.getBufferSize(),
            },
            // Pixel shader configuration
            .ps = {
                .pShaderBytecode = ps.getBufferPointer(),
                .bytecodeLength  = ps.getBufferSize(),
            },
            .streamOutput = {},  // No stream output
            // Blend state configuration (controls how colors are blended)
            .blendState = {
                .alphaToCoverageEnable  = FALSE,  // Don't use alpha-to-coverage
                .independentBlendEnable = FALSE,  // Use the same blend state for all render targets
                .renderTarget           = { [0] = default_blend_state },
            },
            .sampleMask = 0xFFFFFFFF,  // Sample mask for MSAA (all bits set = use all samples)
            // Rasterizer state configuration (controls how 3D primitives are converted to pixels)
            .rasterizerState = {
                .fillMode              = SOLID,  // Fill triangles (not wireframe)
                .cullMode              = BACK,   // Cull back-facing triangles
                .frontCounterClockwise = FALSE,  // Front faces are clockwise (not counter-clockwise)
                .depthBias             = 0,      // No depth bias
                .depthBiasClamp        = 0,      // No depth bias clamp
                .slopeScaledDepthBias  = 0,      // No slope-scaled depth bias
                .depthClipEnable       = TRUE,   // Enable depth clipping
                .multisampleEnable     = FALSE,  // No multisample antialiasing
                .antialiasedLineEnable = FALSE,  // No antialiased lines
                .forcedSampleCount     = 0,      // No forced sample count
                .conservativeRaster    = OFF,    // No conservative rasterization
            },
            // Depth-stencil state configuration (controls depth and stencil testing)
            .depthStencilState = {
                .depthEnable   = FALSE,  // No depth testing
                .stencilEnable = FALSE,  // No stencil testing
            },
            // Input layout configuration (vertex data format)
            .inputLayout = {
                .pInputElementDescs = &vertex_format[0],
                .numElements = vertex_format.len,
            },
            .primitiveTopologyType = TRIANGLE,                  // Drawing triangles
            .numRenderTargets      = 1,                         // Using one render target
            .rTVFormats            = { [0] = R8G8B8A8_UNORM },  // Format of the render target
            .dSVFormat             = UNKNOWN,                   // No depth-stencil view
            .sampleDesc = {
                .count   = 1,   // No MSAA
                .quality = 0,
            },
        };

        // Create the pipeline state object using the configuration above
        fail_if(device.createGraphicsPipelineState(
                &pipeline_state_desc,
                &d3d12::IPIPELINE_STATE_UUID,
                (void**)(&pipeline)),
            "Failed creating pipeline state");
    }
    defer pipeline.release();

    // Create the command list - used to record rendering commands before submitting to the GPU
    d3d12::IGraphicsCommandList* cmdlist = null;
    fail_if(device.createCommandList(0,
            DIRECT,
            command_allocator,
            pipeline,
            &d3d12::ICOMMAND_LIST_UUID,
            (void**)(&cmdlist)),
        "Failed to create command list");
    defer cmdlist.release();
    // Initially close the command list - it will be reset and recorded later
    fail_if(cmdlist.close(), "Failed to close command list");

    // Create and initialize the vertex buffer - holds the triangle's vertex data
    d3d12::IResource* vertex_buffer;
    d3d12::VertexBufferView vertex_buffer_view;

    {
        // Define the triangle vertices - each vertex has a position (3 floats) and color (4
        // bytes)
        float[]vertices = {
            // pos            color (RGBA as bytes packed into a float)
             0.0 , 0.5, 0.0,  1,0,0,0,  // Top vertex - red
             0.5, -0.5, 0.0,  0,1,0,0,  // Bottom right vertex - green
            -0.5, -0.5, 0.0,  0,0,1,0,  // Bottom left vertex - blue
        };

        // Define the heap type for the vertex buffer - UPLOAD type allows CPU write and GPU
        // read access
        d3d12::HeapProperties heap_props = {
            .type = UPLOAD,
        };

        usz vertex_buffer_size = vertices.len * float.sizeof;

        // Define the vertex buffer resource
        d3d12::ResourceDesc resource_desc = {
            .dimension        = BUFFER,                        // Resource is a buffer
            .alignment        = 0,                             // Default alignment
            .width            = vertex_buffer_size,            // Size of the buffer in bytes
            .height           = 1,                             // Buffer is 1D
            .depthOrArraySize = 1,                             // Not a texture array
            .mipLevels        = 1,                             // No mipmaps
            .format           = UNKNOWN,                       // No specific format for raw buffers
            .sampleDesc       = { .count = 1, .quality = 0 },  // No multisampling
            .layout           = ROW_MAJOR,                     // Standard row-major layout
            .flags            = {},                            // No special flags
        };

        // Create the vertex buffer resource on the GPU
        fail_if(device.createCommittedResource(
                &heap_props,
                {},
                &resource_desc,
                d3d12::RESOURCE_STATE_GENERIC_READ,
                null,
                &d3d12::IRESOURCE_UUID,
                (void**)(&vertex_buffer)),
            "Failed creating vertex buffer");

        // Map the GPU memory so we can write the vertex data to it
        void* gpu_data;
        d3d12::Range read_range;  // Empty range because we don't need to read back

        fail_if(vertex_buffer.map(0, &read_range, &gpu_data),
            "Failed creating vertex buffer resource");

        // Copy the vertex data to the GPU memory
        mem::copy(gpu_data, &vertices[0], vertex_buffer_size);
        // Unmap the memory when done
        vertex_buffer.unmap(0, null);

        // Create a vertex buffer view - tells the GPU how to interpret the vertex buffer
        vertex_buffer_view = {
            .bufferLocation = vertex_buffer.getGPUVirtualAddress(),  // GPU address of the buffer
            .strideInBytes  = (uint)vertex_buffer_size / 3,          // Size of each vertex
            .sizeInBytes    = (uint)vertex_buffer_size,              // Total size of the buffer
        };
    }
    defer vertex_buffer.release();

    // Create synchronization objects for GPU-CPU coordination
    ulong fence_value;
    d3d12::IFence* fence;
    Win32_HANDLE fence_event;

    {
        // Create a fence for GPU-CPU synchronization
        fail_if(device.createFence(fence_value, {}, &d3d12::IFENCE_UUID, (void**)(&fence)),
            "Failed to create fence");
        fence_value += 1;

        // Create an event handle for CPU to wait on GPU
        fence_event = win32::createEventA(null, 0, 0, null);
        if (fence_event == null)
        {
            abort("Failed to create fence event");
        }
    }
    defer fence.release();

    bool running = true;
    // Main application loop - runs until the window is closed
    while MAIN_LOOP: (running)
    {
        Win32_MSG msg;
        while (win32::peekMessageW(&msg, null, 0, 0, win32::PM_REMOVE))
        {
            win32::translateMessage(&msg);
            win32::dispatchMessage(&msg);
            if (msg.message == win32::WM_QUIT) running = false;
        }
        if (!running) break MAIN_LOOP;

        fail_if(command_allocator.reset(), "Failed resetting command allocator");

        fail_if(
            cmdlist.reset(command_allocator, pipeline), "Failed to reset command list");

        d3d12::Viewport viewport = {
            .width = CLIENT_WIDTH,
            .height = CLIENT_HEIGHT,
        };

        Win32_RECT scissor_rect = {
            .left = 0, .right = CLIENT_WIDTH,
            .top = 0, .bottom = CLIENT_HEIGHT,
        };

        // This state is reset everytime the cmd list is reset, so we need to rebind it
        cmdlist.setGraphicsRootSignature(root_signature);
        cmdlist.rSSetViewports(1, &viewport);
        cmdlist.rSSetScissorRects(1, &scissor_rect);

        d3d12::ResourceBarrier to_render_target_barrier = {
            .type = TRANSITION,
            .flags = {},
        };

        to_render_target_barrier.transition = {
            .pResource = targets[frame_index],
            .stateBefore = d3d12::RESOURCE_STATES_PRESENT,
            .stateAfter = {.renderTarget},
            .subresource = d3d12::RESOURCE_BARRIER_ALL_SUBRESOURCES,
        };

        cmdlist.resourceBarrier(1, &to_render_target_barrier);

        d3d12::CpuDescriptorHandle rtv_handle;
        rtv_descriptor_heap.getCPUDescriptorHandleForHeapStart(&rtv_handle);

        if (frame_index > 0)
        {
            uint s = device.getDescriptorHandleIncrementSize(RTV);
            rtv_handle.ptr += (usz)frame_index * s;
        }

        cmdlist.oMSetRenderTargets(1, &rtv_handle, FALSE, null);

        // clear backbuffer
        float[4] clearcolor = { 0.05, 0.05, 0.05, 1.0 };
        cmdlist.clearRenderTargetView(rtv_handle, clearcolor, 0, null);

        // draw call
        cmdlist.iASetPrimitiveTopology(TRIANGLELIST);
        cmdlist.iASetVertexBuffers(0, 1, &vertex_buffer_view);
        cmdlist.drawInstanced(3, 1, 0, 0);

        d3d12::ResourceBarrier to_present_barrier = to_render_target_barrier;
        to_present_barrier.transition.stateBefore = {.renderTarget};
        to_present_barrier.transition.stateAfter = d3d12::RESOURCE_STATES_PRESENT;

        cmdlist.resourceBarrier(1, &to_present_barrier);

        fail_if(cmdlist.close(), "Failed to close command list");

        // execute
        d3d12::IGraphicsCommandList*[] cmdlists = { cmdlist };
        queue.executeCommandLists(cmdlists.len, (d3d12::ICommandList**)(&cmdlists[0]));

        // present
        {
            dxgi::PresentFlags flags;
            dxgi::PresentParameters params;
            fail_if(swapchain.present1(1, flags, &params), "Present failed");
        }

        // wait for frame to finish
        {
            ulong current_fence_value = fence_value;

            fail_if(queue.signal(fence, current_fence_value), "Failed to signal fence");

            fence_value += 1;
            ulong completed = fence.getCompletedValue();

            if (completed < current_fence_value)
            {
                fail_if(fence.setEventOnCompletion(current_fence_value, fence_event),
                    "Failed to set event on completion flag");
                win32::waitForSingleObject(fence_event, win32::INFINITE);
            }

            frame_index = swapchain.getCurrentBackBufferIndex();
        }
    }

    return 0;
}

fn void debugCallback(
    d3d12::MessageCategory category,
    d3d12::MessageSeverity severity,
    d3d12::MessageId id,
    Win32_LPCSTR description,
    void* context)
{
    io::eprintfn("[D3D12 %s %s] %s", category, severity, (ZString)description);

    if (severity == ERROR || severity == CORRUPTION)
    {
        $$trap();
    }
}

fn Win32_LRESULT wndProc(Win32_HWND hWnd, Win32_UINT msg, Win32_WPARAM wParam, Win32_LPARAM lParam)
{
    switch (msg)
    {
        case win32::WM_DESTROY:
            win32::postQuitMessage(0);
            return 0;
    }

    return win32::defWindowProcW(hWnd, msg, wParam, lParam);
}

// Missing win32 api
module std::os::win32;

const CS_CLASSDC @if(!$defined(CS_CLASSDC)) = 0x0040;
const SW_SHOWDEFAULT @if(!$defined(SW_SHOWDEFAULT)) = 10;
const SW_SHOW @if(!$defined(SW_SHOW)) = 5;
const PM_REMOVE @if(!$defined(PM_REMOVE)) = 0x0001;
const WM_QUIT @if(!$defined(WM_QUIT)) = 0x0012;
const WM_DESTROY @if(!$defined(WM_DESTROY)) = 0x0002;
const CS_VREDRAW @if(!$defined(CS_VREDRAW)) = 0x0001;
const CS_HREDRAW @if(!$defined(CS_HREDRAW)) = 0x0002;
const CW_USEDEFAULT @if(!$defined(CW_USEDEFAULT)) = ((int)0x80000000);

macro makeIntResourceW($i) @if(!$defined(makeIntResourceW)) =>
    ((Win32_LPWSTR)((Win32_ULONG_PTR)((Win32_WORD)($i))));

const IDI_APPLICATION @if(!$defined(IDI_APPLICATION)) = makeIntResourceW(32512);
const IDC_ARROW @if(!$defined(IDC_ARROW)) = makeIntResourceW(32512);

extern fn Win32_BOOL peekMessageW (
    Win32_LPMSG lpMsg,
    Win32_HWND hWnd,
    uint wMsgFilterMin,
    uint wMsgFilterMax,
    uint wRemoveMsg
) @extern("PeekMessageW") @if(!$defined(peekMessageW));

extern fn Win32_BOOL adjustWindowRect (
    Win32_LPRECT lpRect,
    Win32_DWORD dwStyle,
    Win32_BOOL bMenu
) @extern("AdjustWindowRect") @if(!$defined(adjustWindowRect));
