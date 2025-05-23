module directx::dxgi;

import std::os::win32;

struct Win32_LUID
{
    Win32_DWORD lowPart;
    Win32_LONG highPart;
}

alias Win32_PLUID = Win32_LUID*;

// =============================================================================
// IUnknown
// =============================================================================

struct IUnknown
{
    IUnknownVTable* vtbl;
}

alias QueryInterfaceFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* riid,
    void** ppvObject);

alias AddRefFn = fn Win32_ULONG (void* self);

alias ReleaseFn = fn Win32_ULONG (void* self);

struct IUnknownVTable
{
    QueryInterfaceFn queryInterface;
    AddRefFn addRef;
    ReleaseFn release;
}

fn Win32_HRESULT IUnknown.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IUnknown.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IUnknown.release(&self) @inline => self.vtbl.release(self);

// ---

enum CpuAccess : int
{
    NONE,
    DYNAMIC,
    READ_WRITE,
    SCRATCH,
    __UNUSED0,
    __UNUSED1,
    __UNUSED2,
    __UNUSED3,
    __UNUSED4,
    __UNUSED5,
    __UNUSED6,
    __UNUSED7,
    __UNUSED8,
    __UNUSED9,
    __UNUSED10,
    FIELD
}

struct Rgb
{
    float red;
    float green;
    float blue;
}

struct ColorValue
{
	float r;
	float g;
	float b;
	float a;
}

alias Rgba = ColorValue;

struct GammaControl
{
    Rgb scale;
    Rgb offset;
    Rgb[1025] gammaCurve;
}

struct GammaControlCapabilities
{
    Bool scaleAndOffsetSupported;
    float maxConvertedValue;
    float minConvertedValue;
    uint numGammaControlPoints;
    float[1025] controlPointPositions;
}

enum ModeScanlineOrder : int
{
    UNSPECIFIED,
    PROGRESSIVE,
    UPPER_FIELD_FIRST,
    LOWER_FIELD_FIRST,
}

enum ModeScaling : int
{
    UNSPECIFIED,
    CENTERED,
    STRETCHED,
}

enum ModeRotation : int
{
    UNSPECIFIED,
    IDENTITY,
    ROTATE90,
    ROTATE180,
    ROTATE270,
}

struct ModeDesc
{
    uint width;
    uint height;
    Rational refreshRate;
    Format format;
    ModeScanlineOrder scanlineOrdering;
    ModeScaling scaling;
}

bitstruct UsageFlags : uint
{
    uint __unused0          : 0..3;
    bool shaderInput        : 4;
    bool renderTargetOutput : 5;
    bool backBuffer         : 6;
    bool shared             : 7;
    bool readOnly           : 8;
    bool discardOnPresent   : 9;
    bool unorderedAccess    : 10;
    uint __unused1          : 11..31;
}

alias Usage = UsageFlags;

struct FrameStatistics
{
    uint presentCount;
    uint presentRefreshCount;
    uint syncRefreshCount;
    Win32_LARGE_INTEGER syncQPCTime;
    Win32_LARGE_INTEGER syncGPUTime;
}

struct MappedRect
{
    int pitch;
    char* pBits;
}

struct AdapterDesc
{
    Win32_WCHAR[128] description;
    uint vendorId;
    uint deviceId;
    uint subSysId;
    uint revision;
    Win32_SIZE_T dedicatedVideoMemory;
    Win32_SIZE_T dedicatedSystemMemory;
    Win32_SIZE_T sharedSystemMemory;
    Win32_LUID adapterLuid;
}

struct OutputDesc
{
    Win32_WCHAR[32] deviceName;
    Win32_RECT desktopCoordinates;
    Bool attachedToDesktop;
    ModeRotation rotation;
    Win32_HMONITOR monitor;
}

struct SharedResource
{
    Win32_HANDLE handle;
}

typedef ResourcePriority = uint;
const ResourcePriority RESOURCE_PRIORITY_MINIMUM = 0x28000000;
const ResourcePriority RESOURCE_PRIORITY_LOW     = 0x50000000;
const ResourcePriority RESOURCE_PRIORITY_NORMAL  = 0x78000000;
const ResourcePriority RESOURCE_PRIORITY_HIGH    = 0xa0000000;
const ResourcePriority RESOURCE_PRIORITY_MAXIMUM = 0xc8000000;

enum Residency :  int
{
    FULLY_RESIDENT,
    RESIDENT_IN_SHARED_MEMORY,
    EVICTED_TO_DISK,
}

struct SurfaceDesc
{
    uint width;
    uint height;
    Format format;
    SampleDesc sampleDesc;
}

enum SwapEffect : int
{
    DISCARD,
    SEQUENTIAL,
    __UNUSED0,
    FLIP_SEQUENTIAL,
    FLIP_DISCARD,
}

bitstruct SwapChainFlags : uint
{
    bool nonprerotated                      : 0;
    bool allowModeSwitch                    : 1;
    bool gdiCompatible                      : 2;
    bool restrictedContent                  : 3;
    bool restrictSharedResourceDriver       : 4;
    bool displayOnly                        : 5;
    bool frameLatencyWaitableObject         : 6;
    bool foregroundLayer                    : 7;
    bool fullscreenVideo                    : 8;
    bool yuvVideo                           : 9;
    bool hwProtected                        : 10;
    bool allowTearing                       : 11;
    bool restrictedToAllHolographicDisplays : 12;
    uint __unused0                          : 13..31;
}

alias SwapChain = SwapChainFlags;

struct SwapChainDesc
{
    ModeDesc bufferDesc;
    SampleDesc sampleDesc;
    UsageFlags bufferUsage;
    uint bufferCount;
    Win32_HWND outputWindow;
    Bool windowed;
    SwapEffect swapEffect;
    SwapChainFlags flags;
}

// =============================================================================
// IObject
// =============================================================================

const IOBJECT_UUID_STRING = "aec22fb8-76f3-4639-9be0-28eb43a67a2e";
const Win32_GUID IOBJECT_UUID = {
    .data1 = 0xaec22fb8, .data2 = 0x76f3, .data3 = 0x4639,
    .data4 = { 0x9b, 0xe0, 0x28, 0xeb, 0x43, 0xa6, 0x7a, 0x2e }
};

struct IObject
{
    IObjectVTable* vtbl;
}

// Function pointers of IObject

alias IObject_SetPrivateDataFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* name,
    uint dataSize,
    void* pData);

alias IObject_SetPrivateDataInterfaceFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* name,
    IUnknown* pUnknown);

alias IObject_GetPrivateDataFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* name,
    uint* pDataSize,
    void* pData);

alias IObject_GetParentFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* riid,
    void** ppParent);

struct IObjectVTable
{
    inline IUnknownVTable _base;
    IObject_SetPrivateDataFn setPrivateData;
    IObject_SetPrivateDataInterfaceFn setPrivateDataInterface;
    IObject_GetPrivateDataFn getPrivateData;
    IObject_GetParentFn getParent;
}

// Functions from IUnknown

fn Win32_HRESULT IObject.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IObject.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IObject.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IObject.setPrivateData(
    &self,
    Win32_GUID* name,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, name, dataSize, pData);

fn Win32_HRESULT IObject.setPrivateDataInterface(
    &self,
    Win32_GUID* name,
    IUnknown* pUnknown
) @inline =>
    self.vtbl.setPrivateDataInterface(self, name, pUnknown);

fn Win32_HRESULT IObject.getPrivateData(
    &self,
    Win32_GUID* name,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, name, pDataSize, pData);

fn Win32_HRESULT IObject.getParent(
    &self,
    Win32_GUID* riid,
    void** ppParent
) @inline =>
    self.vtbl.getParent(self, riid, ppParent);

// =============================================================================
// IDeviceSubObject
// =============================================================================

const IDEVICE_SUB_OBJECT_UUID_STRING = "3d3e0379-f9de-4d58-bb6c-18d62992f1a6";
const Win32_GUID IDEVICE_SUB_OBJECT_UUID = {
    .data1 = 0x3d3e0379, .data2 = 0xf9de, .data3 = 0x4d58,
    .data4 = { 0xbb, 0x6c, 0x18, 0xd6, 0x29, 0x92, 0xf1, 0xa6 }
};

struct IDeviceSubObject
{
    IDeviceSubObjectVTable* vtbl;
}

// Function pointers of IDeviceSubObject

alias IDeviceSubObject_GetDeviceFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* riid,
    void** ppDevice);

struct IDeviceSubObjectVTable
{
    inline IObjectVTable _base;
    IDeviceSubObject_GetDeviceFn getDevice;
}

// Functions from IUnknown

fn Win32_HRESULT IDeviceSubObject.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDeviceSubObject.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDeviceSubObject.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IDeviceSubObject.setPrivateData(
    &self,
    Win32_GUID* name,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, name, dataSize, pData);

fn Win32_HRESULT IDeviceSubObject.setPrivateDataInterface(
    &self,
    Win32_GUID* name,
    IUnknown* pUnknown
) @inline =>
    self.vtbl.setPrivateDataInterface(self, name, pUnknown);

fn Win32_HRESULT IDeviceSubObject.getPrivateData(
    &self,
    Win32_GUID* name,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, name, pDataSize, pData);

fn Win32_HRESULT IDeviceSubObject.getParent(
    &self,
    Win32_GUID* riid,
    void** ppParent
) @inline =>
    self.vtbl.getParent(self, riid, ppParent);

// Functions of IDeviceSubObject

fn Win32_HRESULT IDeviceSubObject.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppDevice);

// =============================================================================
// IResource
// =============================================================================

const IRESOURCE_UUID_STRING = "035f3ab4-482e-4e50-b41f-8a7f8bd8960b";
const Win32_GUID IRESOURCE_UUID = {
    0x035f3ab4, 0x482e, 0x4e50, { 0xb4, 0x1f, 0x8a, 0x7f, 0x8b, 0xd8, 0x96, 0x0b } };

const IRESOURCE1_UUID_STRING = "30961379-4609-4a41-998e-54fe567ee0c1";
const Win32_GUID IRESOURCE1_UUID = {
    0x30961379, 0x4609, 0x4a41,  { 0x99, 0x8e, 0x54, 0xfe, 0x56, 0x7e, 0xe0, 0xc1 } };

struct IResource
{
    IResourceVTable* vtbl;
}

typedef IResource1 = inline IResource;

// Function pointers of IResource

alias IResource_GetSharedHandleFn = fn Win32_HRESULT (
    void* self,
    Win32_HANDLE *pSharedHandle);

alias IResource_GetUsageFn = fn Win32_HRESULT (
    void* self,
    UsageFlags* pUsage);

alias IResource_SetEvictionPriorityFn = fn Win32_HRESULT (
    void* self,
    uint evictionPriority);

alias IResource_GetEvictionPriorityFn = fn Win32_HRESULT (
    void* self,
    uint* pEvictionPriority);

// Function pointers of IResource1

alias IResource1_CreateSubresourceSurfaceFn = fn Win32_HRESULT (
    void* self,
    uint index,
    ISurface2** ppSurface);

alias IResource1_CreateSharedHandleFn = fn Win32_HRESULT (
    void* self,
    Win32_SECURITY_ATTRIBUTES* pAttributes,
    Win32_DWORD dwAccess,
    Win32_LPCWSTR lpName,
    Win32_HANDLE* pHandle);

struct IResourceVTable
{
    inline IDeviceSubObjectVTable _base;

    // IResource
    IResource_GetSharedHandleFn getSharedHandle;
    IResource_GetUsageFn getUsage;
    IResource_SetEvictionPriorityFn setEvictionPriority;
    IResource_GetEvictionPriorityFn getEvictionPriority;

    // IResource1
    IResource1_CreateSubresourceSurfaceFn createSubresourceSurface;
    IResource1_CreateSharedHandleFn createSharedHandle;
}

// Functions from IUnknown

fn Win32_HRESULT IResource.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IResource.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IResource.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IResource.setPrivateData(
    &self,
    Win32_GUID* name,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, name, dataSize, pData);

fn Win32_HRESULT IResource.setPrivateDataInterface(
    &self,
    Win32_GUID* name,
    IUnknown* pUnknown
) @inline =>
    self.vtbl.setPrivateDataInterface(self, name, pUnknown);

fn Win32_HRESULT IResource.getPrivateData(
    &self,
    Win32_GUID* name,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, name, pDataSize, pData);

fn Win32_HRESULT IResource.getParent(
    &self,
    Win32_GUID* riid,
    void** ppParent
) @inline =>
    self.vtbl.getParent(self, riid, ppParent);

// Functions of IDeviceSubObject

fn Win32_HRESULT IResource.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppDevice);

// Functions of IResource

fn Win32_HRESULT IResource.getSharedHandle(
    &self, Win32_HANDLE *pSharedHandle
) @inline =>
    self.vtbl.getSharedHandle(self, pSharedHandle);

fn Win32_HRESULT IResource.getUsage(
    &self, UsageFlags* pUsage
) @inline =>
    self.vtbl.getUsage(self, pUsage);

fn Win32_HRESULT IResource.setEvictionPriority(
    &self, uint evictionPriority
) @inline =>
    self.vtbl.setEvictionPriority(self, evictionPriority);

fn Win32_HRESULT IResource.getEvictionPriority(
    &self, uint* pEvictionPriority
) @inline =>
    self.vtbl.getEvictionPriority(self, pEvictionPriority);

// Functions of IResource1

fn Win32_HRESULT IResource.createSubresourceSurface(
    &self,
    uint index,
    ISurface2** ppSurface
) @inline =>
    self.vtbl.createSubresourceSurface(self, index, ppSurface);

fn Win32_HRESULT IResource.createSharedHandle(
    &self,
    Win32_SECURITY_ATTRIBUTES* pAttributes,
    Win32_DWORD dwAccess,
    Win32_LPCWSTR lpName,
    Win32_HANDLE* pHandle
) @inline =>
    self.vtbl.createSharedHandle(self, pAttributes, dwAccess, lpName, pHandle);

// =============================================================================
// IKeyedMutex
// =============================================================================

const IKEYED_MUTEX_UUID_STRING = "9d8e1289-d7b3-465f-8126-250e349af85d";
const Win32_GUID IKEYED_MUTEX_UUID = {
    .data1 = 0x9d8e1289, .data2 = 0xd7b3, .data3 = 0x465f,
    .data4 = { 0x81, 0x26, 0x25, 0x0e, 0x34, 0x9a, 0xf8, 0x5d }
};

struct IKeyedMutex
{
    IKeyedMutexVTable* vtbl;
}

// Function pointers of IKeyedMutex

alias IKeyedMutex_AcquireSyncFn = fn Win32_HRESULT (
    void* self,
    ulong key,
    Win32_DWORD dwMilliseconds);

alias IKeyedMutex_ReleaseSyncFn = fn Win32_HRESULT (
    void* self,
    ulong key);

struct IKeyedMutexVTable
{
    inline IDeviceSubObjectVTable _base;
    IKeyedMutex_AcquireSyncFn acquireSync;
    IKeyedMutex_ReleaseSyncFn releaseSync;
}

// Functions from IUnknown

fn Win32_HRESULT IKeyedMutex.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IKeyedMutex.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IKeyedMutex.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IKeyedMutex.setPrivateData(
    &self,
    Win32_GUID* name,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, name, dataSize, pData);

fn Win32_HRESULT IKeyedMutex.setPrivateDataInterface(
    &self,
    Win32_GUID* name,
    IUnknown* pUnknown
) @inline =>
    self.vtbl.setPrivateDataInterface(self, name, pUnknown);

fn Win32_HRESULT IKeyedMutex.getPrivateData(
    &self,
    Win32_GUID* name,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, name, pDataSize, pData);

fn Win32_HRESULT IKeyedMutex.getParent(
    &self,
    Win32_GUID* riid,
    void** ppParent
) @inline =>
    self.vtbl.getParent(self, riid, ppParent);

// Functions of IDeviceSubObject

fn Win32_HRESULT IKeyedMutex.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppDevice);

// Functions of IKeyedMutex

fn Win32_HRESULT IKeyedMutex.acquireSync(
    &self,
    ulong key,
    Win32_DWORD dwMilliseconds
) @inline =>
    self.vtbl.acquireSync(self, key, dwMilliseconds);

fn Win32_HRESULT IKeyedMutex.releaseSync(&self, ulong key) @inline =>
    self.vtbl.releaseSync(self, key);

bitstruct MapFlags : uint
{
    bool read      : 0;
    bool write     : 1;
    bool discard   : 2;
    uint __unused0 : 3..31;
}

alias Map = MapFlags;

// =============================================================================
// ISurface
// =============================================================================

const ISURFACE_UUID_STRING = "cafcb56c-6ac3-4889-bf47-9e23bbd260ec";
const Win32_GUID ISURFACE_UUID = {
    0xcafcb56c, 0x6ac3, 0x4889, { 0xbf, 0x47, 0x9e, 0x23, 0xbb, 0xd2, 0x60, 0xec } };

const ISURFACE1_UUID_STRING = "4AE63092-6327-4c1b-80AE-BFE12EA32B86";
const Win32_GUID ISURFACE1_UUID = {
    0x4AE63092, 0x6327, 0x4c1b, { 0x80, 0xAE, 0xBF, 0xE1, 0x2E, 0xA3, 0x2B, 0x86 } };

const ISURFACE2_UUID_STRING = "aba496dd-b617-4cb8-a866-bc44d7eb1fa2";
const Win32_GUID ISURFACE2_UUID = {
    0xaba496dd, 0xb617, 0x4cb8,  { 0xa8, 0x66, 0xbc, 0x44, 0xd7, 0xeb, 0x1f, 0xa2 } };

struct ISurface
{
    ISurfaceVTable* vtbl;
}

typedef ISurface1 = inline ISurface;
typedef ISurface2 = inline ISurface;

// Function pointers of ISurface

alias ISurface_GetDescFn = fn Win32_HRESULT (
    void* self,
    SurfaceDesc* pDesc);

alias ISurface_MapFn = fn Win32_HRESULT (
    void* self,
    MappedRect* pLockedRect,
    MapFlags mapFlags);

alias ISurface_UnmapFn = fn Win32_HRESULT (void* self);

// Function pointers of ISurface1

alias ISurface1_GetDCFn = fn Win32_HRESULT(
    void* self,
    Bool discard,
    Win32_HDC* phdc);

alias ISurface1_ReleaseDCFn = fn Win32_HRESULT(
    void* self,
    Win32_RECT* pDirtyRect);

// Function pointers of ISurface2

alias ISurface2_GetResourceFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* riid,
    void** ppParentResource,
    uint* pSubresourceIndex);

struct ISurfaceVTable
{
    inline IDeviceSubObjectVTable _base;

    // ISurface
    ISurface_GetDescFn getDesc;
    ISurface_MapFn map;
    ISurface_UnmapFn unmap;

    // ISurface1
    ISurface1_GetDCFn getDC;
    ISurface1_ReleaseDCFn releaseDC;

    // ISurface2
    ISurface2_GetResourceFn getResource;
}

// Functions from IUnknown

fn Win32_HRESULT ISurface.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ISurface.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ISurface.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT ISurface.setPrivateData(
    &self,
    Win32_GUID* name,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, name, dataSize, pData);

fn Win32_HRESULT ISurface.setPrivateDataInterface(
    &self,
    Win32_GUID* name,
    IUnknown* pUnknown
) @inline =>
    self.vtbl.setPrivateDataInterface(self, name, pUnknown);

fn Win32_HRESULT ISurface.getPrivateData(
    &self,
    Win32_GUID* name,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, name, pDataSize, pData);

fn Win32_HRESULT ISurface.getParent(
    &self,
    Win32_GUID* riid,
    void** ppParent
) @inline =>
    self.vtbl.getParent(self, riid, ppParent);

// Functions of IDeviceSubObject

fn Win32_HRESULT ISurface.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppDevice);

// Functions of ISurface

fn Win32_HRESULT ISurface.getDesc(
    &self,
    SurfaceDesc* pDesc
) @inline =>
    self.vtbl.getDesc(self, pDesc);

fn Win32_HRESULT ISurface.map(
    &self,
    MappedRect* pLockedRect,
    MapFlags mapFlags
) @inline =>
    self.vtbl.map(self, pLockedRect, mapFlags);

fn Win32_HRESULT ISurface.unmap(&self) @inline => self.vtbl.unmap(self);

// Functions of ISurface1

fn Win32_HRESULT ISurface.getDC(
    &self,
    Bool discard,
    Win32_HDC* phdc
) @inline =>
    self.vtbl.getDC(self, discard, phdc);

fn Win32_HRESULT ISurface.releaseDC(
    &self,
    Win32_RECT* pDirtyRect
) @inline =>
    self.vtbl.releaseDC(self, pDirtyRect);

// Functions of ISurface2

fn Win32_HRESULT ISurface.getResource(
    &self,
    Win32_GUID* riid,
    void** ppParentResource,
    uint* pSubresourceIndex
) @inline =>
    self.vtbl.getResource(self, riid, ppParentResource, pSubresourceIndex);

// =============================================================================
// IAdapter
// =============================================================================

const IADAPTER_UUID_STRING = "2411e7e1-12ac-4ccf-bd14-9798e8534dc0";
const Win32_GUID IADAPTER_UUID = {
    .data1 = 0x2411e7e1, .data2 = 0x12ac, .data3 = 0x4ccf,
    .data4 = { 0xbd, 0x14, 0x97, 0x98, 0xe8, 0x53, 0x4d, 0xc0 }
};

struct IAdapter
{
    IAdapterVTable* vtbl;
}

typedef IAdapter1 = inline IAdapter;
typedef IAdapter2 = inline IAdapter;
typedef IAdapter3 = inline IAdapter;
typedef IAdapter4 = inline IAdapter;

// Function pointers of IAdapter

alias IAdapter_EnumOutputsFn = fn Win32_HRESULT (
    void* self,
    uint output,
    IOutput** ppOutput);

alias IAdapter_GetDescFn = fn Win32_HRESULT (
    void* self,
    AdapterDesc* pDesc);

alias IAdapter_CheckInterfaceSupportFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID interfaceName,
    Win32_LARGE_INTEGER *pUMDVersion);

// Function pointers of IAdapter1

alias IAdapter1_GetDes12Fn = fn Win32_HRESULT (
    void* self,
    AdapterDesc1* pDesc);

// Function pointers of IAdapter2

alias IAdapter2_GetDesc2Fn = fn Win32_HRESULT (
    void* self,
    AdapterDesc2* pDesc);

// Function pointers of IAdapter3

alias IAdapter3_RegisterHardwareContentProtectionTeardownStatusEventFn = fn Win32_HRESULT (
    void* self,
    Win32_HANDLE hEvent,
    Win32_DWORD* pdwCookie);

alias IAdapter3_UnregisterHardwareContentProtectionTeardownStatusFn = fn void (
    void* self,
    Win32_DWORD dwCookie);

alias IAdapter3_QueryVideoMemoryInfoFn = fn Win32_HRESULT (
    void* self,
    uint nodeIndex,
    MemorySegmentGroup memorySegmentGroup,
    QueryVideoMemoryInfo* pVideoMemoryInfo);

alias IAdapter3_SetVideoMemoryReservationFn = fn Win32_HRESULT (
    void* self,
    uint nodeIndex,
    MemorySegmentGroup memorySegmentGroup,
    ulong reservation);

alias IAdapter3_RegisterVideoMemoryBudgetChangeNotificationEventFn = fn Win32_HRESULT (
    void* self,
    Win32_HANDLE hEvent,
    Win32_DWORD* pdwCookie);

alias IAdapter3_UnregisterVideoMemoryBudgetChangeNotificationFn = fn void (
    void* self,
    Win32_DWORD dwCookie);

// Function pointers of IAdapter4

alias IAdapter4_GetDesc3Fn = fn Win32_HRESULT (
    void* self,
    AdapterDesc3* pDesc);

struct IAdapterVTable
{
    inline IObjectVTable _base;
    IAdapter_EnumOutputsFn enumOutputs;
    IAdapter_GetDescFn getDesc;
    IAdapter_CheckInterfaceSupportFn checkInterfaceSupport;
    IAdapter1_GetDes12Fn getDesc1;
    IAdapter2_GetDesc2Fn getDesc2;
    IAdapter3_RegisterHardwareContentProtectionTeardownStatusEventFn
        registerHardwareContentProtectionTeardownStatusEvent;
    IAdapter3_UnregisterHardwareContentProtectionTeardownStatusFn
        unregisterHardwareContentProtectionTeardownStatus;
    IAdapter3_QueryVideoMemoryInfoFn queryVideoMemoryInfo;
    IAdapter3_SetVideoMemoryReservationFn setVideoMemoryReservation;
    IAdapter3_RegisterVideoMemoryBudgetChangeNotificationEventFn
        registerVideoMemoryBudgetChangeNotificationEvent;
    IAdapter3_UnregisterVideoMemoryBudgetChangeNotificationFn
        unregisterVideoMemoryBudgetChangeNotification;
    IAdapter4_GetDesc3Fn getDesc3;
}

// Functions from IUnknown

fn Win32_HRESULT IAdapter.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IAdapter.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IAdapter.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IAdapter.setPrivateData(
    &self,
    Win32_GUID* name,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, name, dataSize, pData);

fn Win32_HRESULT IAdapter.setPrivateDataInterface(
    &self,
    Win32_GUID* name,
    IUnknown* pUnknown
) @inline =>
    self.vtbl.setPrivateDataInterface(self, name, pUnknown);

fn Win32_HRESULT IAdapter.getPrivateData(
    &self,
    Win32_GUID* name,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, name, pDataSize, pData);

fn Win32_HRESULT IAdapter.getParent(
    &self,
    Win32_GUID* riid,
    void** ppParent
) @inline =>
    self.vtbl.getParent(self, riid, ppParent);

// Functions of IAdapter

fn Win32_HRESULT IAdapter.enumOutputs(
    &self,
    uint output,
    IOutput** ppOutput
) @inline =>
    self.vtbl.enumOutputs(self, output, ppOutput);

fn Win32_HRESULT IAdapter.getDesc(
    &self,
    AdapterDesc* pDesc
) @inline =>
    self.vtbl.getDesc(self, pDesc);

fn Win32_HRESULT IAdapter.checkInterfaceSupport(
    &self,
    Win32_GUID interfaceName,
    Win32_LARGE_INTEGER *pUMDVersion
) @inline =>
    self.vtbl.checkInterfaceSupport(self, interfaceName, pUMDVersion);

// Functions of IAdapter1

fn Win32_HRESULT IAdapter.getDesc1(
    &self,
    AdapterDesc1* pDesc
) @inline =>
    self.vtbl.getDesc1(self, pDesc);

// Functions of IAdapter2

fn Win32_HRESULT IAdapter.getDesc2(
    &self,
    AdapterDesc2* pDesc
) @inline =>
    self.vtbl.getDesc2(self, pDesc);

// Functions of IAdapter3

fn Win32_HRESULT IAdapter.registerHardwareContentProtectionTeardownStatusEvent(
    &self,
    Win32_HANDLE hEvent,
    Win32_DWORD* pdwCookie
) @inline =>
    self.vtbl.registerHardwareContentProtectionTeardownStatusEvent(
        self,
        hEvent,
        pdwCookie);

fn void IAdapter.unregisterHardwareContentProtectionTeardownStatus(
    &self,
    Win32_DWORD dwCookie
) @inline =>
    self.vtbl.unregisterHardwareContentProtectionTeardownStatus(self, dwCookie);

fn Win32_HRESULT IAdapter.queryVideoMemoryInfo(
    &self,
    uint nodeIndex,
    MemorySegmentGroup memorySegmentGroup,
    QueryVideoMemoryInfo* pVideoMemoryInfo
) @inline =>
    self.vtbl.queryVideoMemoryInfo(
        self,
        nodeIndex,
        memorySegmentGroup,
        pVideoMemoryInfo);

fn Win32_HRESULT IAdapter.setVideoMemoryReservation(
    &self,
    uint nodeIndex,
    MemorySegmentGroup memorySegmentGroup,
    ulong reservation
) @inline =>
    self.vtbl.setVideoMemoryReservation(
        self,
        nodeIndex,
        memorySegmentGroup,
        reservation);

fn Win32_HRESULT IAdapter.registerVideoMemoryBudgetChangeNotificationEvent(
    &self,
    Win32_HANDLE hEvent,
    Win32_DWORD* pdwCookie
) @inline =>
    self.vtbl.registerVideoMemoryBudgetChangeNotificationEvent(
        self,
        hEvent,
        pdwCookie);

fn void IAdapter.unregisterVideoMemoryBudgetChangeNotification(
    &self,
    Win32_DWORD dwCookie
) @inline =>
    self.vtbl.unregisterVideoMemoryBudgetChangeNotification(self, dwCookie);

// Functions of IAdapter4

fn Win32_HRESULT IAdapter.getDesc3(
    &self,
    AdapterDesc3* pDesc
) @inline =>
    self.vtbl.getDesc3(self, pDesc);

bitstruct EnumModesFlags : uint
{
    bool interlaced     : 0;
    bool scaling        : 1;
    bool stereo         : 2;
    bool disabledStereo : 3;
    uint __unused0      : 4..31;
}

alias EnumModes = EnumModesFlags;

// =============================================================================
// IOutput
// =============================================================================

const IOUTPUT_UUID_STRING = "ae02eedb-c735-4690-8d52-5a8dc20213aa";
const Win32_GUID IOUTPUT_UUID = {
    0xae02eedb, 0xc735, 0x4690, { 0x8d, 0x52, 0x5a, 0x8d, 0xc2, 0x02, 0x13, 0xaa } };

const IOUTPUT1_UUID_STRING = "00cddea8-939b-4b83-a340-a685226666cc";
const Win32_GUID IOUTPUT1_UUID = {
    0x00cddea8, 0x939b, 0x4b83,  { 0xa3, 0x40, 0xa6, 0x85, 0x22, 0x66, 0x66, 0xcc } };

const IOUTPUT2_UUID_STRING = "595e39d1-2724-4663-99b1-da969de28364";
const Win32_GUID IOUTPUT2_UUID = {
    0x595e39d1, 0x2724, 0x4663, { 0x99, 0xb1, 0xda, 0x96, 0x9d, 0xe2, 0x83, 0x64 } };

const IOUTPUT3_UUID_STRING = "8a6bb301-7e7e-41F4-a8e0-5b32f7f99b18";
const Win32_GUID IOUTPUT3_UUID = {
    0x8a6bb301, 0x7e7e, 0x41F4, { 0xa8, 0xe0, 0x5b, 0x32, 0xf7, 0xf9, 0x9b, 0x18 } };

const IOUTPUT4_UUID_STRING = "dc7dca35-2196-414d-9F53-617884032a60";
const Win32_GUID IOUTPUT4_UUID = {
    0xdc7dca35, 0x2196, 0x414d, { 0x9F, 0x53, 0x61, 0x78, 0x84, 0x03, 0x2a, 0x60 } };

const IOUTPUT5_UUID_STRING = "80A07424-AB52-42EB-833C-0C42FD282D98";
const Win32_GUID IOUTPUT5_UUID = {
    0x80A07424, 0xAB52, 0x42EB, { 0x83, 0x3C, 0x0C, 0x42, 0xFD, 0x28, 0x2D, 0x98 } };

const IOUTPUT6_UUID_STRING = "068346e8-aaec-4b84-add7-137f513f77a1";
const Win32_GUID IOUTPUT6_UUID = {
    0x068346e8, 0xaaec, 0x4b84, { 0xad, 0xd7, 0x13, 0x7f, 0x51, 0x3f, 0x77, 0xa1 } };

struct IOutput
{
    IOutputVTable* vtbl;
}

typedef IOutput1 = inline IOutput;
typedef IOutput2 = inline IOutput;
typedef IOutput3 = inline IOutput;
typedef IOutput4 = inline IOutput;
typedef IOutput5 = inline IOutput;
typedef IOutput6 = inline IOutput;

// Function pointers of IOutput

alias IOutput_GetDescFn = fn Win32_HRESULT (
    void* self,
    OutputDesc* pDesc);

alias IOutput_GetDisplayModeListFn = fn Win32_HRESULT (
    void* self,
    Format enumFormat,
    EnumModesFlags flags,
    uint* pNumModes,
    ModeDesc* pDesc);

alias IOutput_FindClosestMatchingModeFn = fn Win32_HRESULT (
    void* self,
    ModeDesc* pModeToMatch,
    ModeDesc* pClosestMatch,
    IUnknown* pConcernedDevice);

alias IOutput_WaitForVBlankFn = fn Win32_HRESULT (
    void* self);

alias IOutput_TakeOwnershipFn = fn Win32_HRESULT (
    void* self,
    IUnknown* pDevice,
    Bool exclusive);

alias IOutput_ReleaseOwnershipFn = fn void (
    void* self);

alias IOutput_GetGammaControlCapabilitiesFn = fn Win32_HRESULT (
    void* self,
    GammaControlCapabilities* pGammaCaps);

alias IOutput_SetGammaControlFn = fn Win32_HRESULT (
    void* self,
    GammaControl* pArray);

alias IOutput_GetGammaControlFn = fn Win32_HRESULT (
    void* self,
    GammaControl* pArray);

alias IOutput_SetDisplaySurfaceFn = fn Win32_HRESULT (
    void* self,
    ISurface* pScanoutSurface);

alias IOutput_GetDisplaySurfaceDataFn = fn Win32_HRESULT (
    void* self,
    ISurface* pDestination);

alias IOutput_GetFrameStatisticsFn = fn Win32_HRESULT (
    void* self,
    FrameStatistics* pStats);

// Function pointers of IOutput1

alias IOutput1_GetDisplayModeList1Fn = fn Win32_HRESULT (
    void* self,
    Format enumFormat,
    EnumModesFlags flags,
    uint* pNumModes,
    ModeDesc1* pDesc);

alias IOutput1_FindClosestMatchingMode1Fn = fn Win32_HRESULT (
    void* self,
    ModeDesc1* pModeToMatch,
    ModeDesc1* pClosestMatch,
    IUnknown* pConcernedDevice);

alias IOutput1_GetDisplaySurfaceData1Fn = fn Win32_HRESULT (
    void* self,
    IResource* pDestination);

alias IOutput1_DuplicateOutputFn = fn Win32_HRESULT (
    void* self,
    IUnknown* pDevice,
    IOutputDuplication** ppOutputDuplication);

// Function pointers of IOutput2

alias IOutput2_SupportsOverlaysFn = fn Bool (void* self);

// Function pointers of IOutput3

alias IOutput3_CheckOverlaySupportFn = fn Win32_HRESULT (
    void* self,
    Format enumFormat,
    IUnknown* pConcernedDevice,
    OverlaySupportFlags* pFlags);

// Function pointers of IOutput4

alias IOutput4_CheckOverlayColorSpaceSupportFn = fn Win32_HRESULT (
    void* self,
    Format format,
    ColorSpaceType colorSpace,
    IUnknown* pConcernedDevice,
    OverlayColorSpaceSupportFlags* pFlags);

// Function pointers of IOutput5
alias IOutput4_DuplicateOutput1Fn = fn Win32_HRESULT (
    void* self,
    IUnknown* pDevice,
    uint flags,
    uint supportedFormatsCount,
    Format* pSupportedFormats,
    IOutputDuplication** ppOutputDuplication);

// Function pointers of IOutput6

alias IOutput6_GetDesc1Fn = fn Win32_HRESULT (
    void* self,
    OutputDesc1* pDesc);

alias IOutput6_CheckHardwareCompositionSupportFn = fn Win32_HRESULT (
    void* self,
    HardwareCompositionSupportFlags* pFlags);

struct IOutputVTable
{
    inline IObjectVTable _base;

    // IOutput
    IOutput_GetDescFn getDesc;
    IOutput_GetDisplayModeListFn getDisplayModeList;
    IOutput_FindClosestMatchingModeFn findClosestMatchingMode;
    IOutput_WaitForVBlankFn waitForVBlank;
    IOutput_TakeOwnershipFn takeOwnership;
    IOutput_ReleaseOwnershipFn releaseOwnership;
    IOutput_GetGammaControlCapabilitiesFn getGammaControlCapabilities;
    IOutput_SetGammaControlFn setGammaControl;
    IOutput_GetGammaControlFn getGammaControl;
    IOutput_SetDisplaySurfaceFn setDisplaySurface;
    IOutput_GetDisplaySurfaceDataFn getDisplaySurfaceData;
    IOutput_GetFrameStatisticsFn getFrameStatistics;

    // IOutput1
    IOutput1_GetDisplayModeList1Fn getDisplayModeList1;
    IOutput1_FindClosestMatchingMode1Fn findClosestMatchingMode1;
    IOutput1_GetDisplaySurfaceData1Fn getDisplaySurfaceData1;
    IOutput1_DuplicateOutputFn duplicateOutput;

    // IOutput2
    IOutput2_SupportsOverlaysFn supportsOverlays;

    // IOutput3
    IOutput3_CheckOverlaySupportFn checkOverlaySupport;

    // IOutput4
    IOutput4_CheckOverlayColorSpaceSupportFn checkOverlayColorSpaceSupport;

    // IOutput5
    IOutput4_DuplicateOutput1Fn duplicateOutput1;

    // IOutput6
    IOutput6_GetDesc1Fn getDesc1;
    IOutput6_CheckHardwareCompositionSupportFn checkHardwareCompositionSupport;
}

// Functions from IUnknown

fn Win32_HRESULT IOutput.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IOutput.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IOutput.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IOutput.setPrivateData(
    &self,
    Win32_GUID* name,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, name, dataSize, pData);

fn Win32_HRESULT IOutput.setPrivateDataInterface(
    &self,
    Win32_GUID* name,
    IUnknown* pUnknown
) @inline =>
    self.vtbl.setPrivateDataInterface(self, name, pUnknown);

fn Win32_HRESULT IOutput.getPrivateData(
    &self,
    Win32_GUID* name,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, name, pDataSize, pData);

fn Win32_HRESULT IOutput.getParent(
    &self,
    Win32_GUID* riid,
    void** ppParent
) @inline =>
    self.vtbl.getParent(self, riid, ppParent);

// Functions of IOutput

fn Win32_HRESULT IOutput.getDesc(
    &self,
    OutputDesc* pDesc
) @inline =>
    self.vtbl.getDesc(self, pDesc);

fn Win32_HRESULT IOutput.getDisplayModeList(
    &self,
    Format enumFormat,
    EnumModesFlags flags,
    uint* pNumModes,
    ModeDesc* pDesc
) @inline =>
    self.vtbl.getDisplayModeList(self, enumFormat, flags, pNumModes, pDesc);

fn Win32_HRESULT IOutput.findClosestMatchingMode(
    &self,
    ModeDesc* pModeToMatch,
    ModeDesc* pClosestMatch,
    IUnknown* pConcernedDevice
) @inline =>
    self.vtbl.findClosestMatchingMode(
        self,
        pModeToMatch,
        pClosestMatch,
        pConcernedDevice);

fn Win32_HRESULT IOutput.waitForVBlank(&self) @inline =>
    self.vtbl.waitForVBlank(self);

fn Win32_HRESULT IOutput.takeOwnership(
    &self,
    IUnknown* pDevice,
    Bool exclusive
) @inline =>
    self.vtbl.takeOwnership(self, pDevice, exclusive);

fn void IOutput.releaseOwnership(&self) @inline => self.vtbl.releaseOwnership(self);

fn Win32_HRESULT IOutput.getGammaControlCapabilities(
    &self,
    GammaControlCapabilities* pGammaCaps
) @inline =>
    self.vtbl.getGammaControlCapabilities(self, pGammaCaps);

fn Win32_HRESULT IOutput.setGammaControl(
    &self,
    GammaControl* pArray
) @inline =>
    self.vtbl.setGammaControl(self, pArray);

fn Win32_HRESULT IOutput.getGammaControl(
    &self,
    GammaControl* pArray
) @inline =>
    self.vtbl.getGammaControl(self, pArray);

fn Win32_HRESULT IOutput.setDisplaySurface(
    &self,
    ISurface* pScanoutSurface
) @inline =>
    self.vtbl.setDisplaySurface(self, pScanoutSurface);

fn Win32_HRESULT IOutput.getDisplaySurfaceData(
    &self,
    ISurface* pDestination
) @inline =>
    self.vtbl.getDisplaySurfaceData(self, pDestination);

fn Win32_HRESULT IOutput.getFrameStatistics(
    &self,
    FrameStatistics* pStats
) @inline =>
    self.vtbl.getFrameStatistics(self, pStats);

// Functions from IOutput1

fn Win32_HRESULT IOutput.getDisplayModeList1(
    &self,
    Format enumFormat,
    EnumModesFlags flags,
    uint* pNumModes,
    ModeDesc1* pDesc
) @inline =>
    self.vtbl.getDisplayModeList1(self, enumFormat, flags, pNumModes, pDesc);

fn Win32_HRESULT IOutput.findClosestMatchingMode1(
    &self,
    ModeDesc1* pModeToMatch,
    ModeDesc1* pClosestMatch,
    IUnknown* pConcernedDevice
) @inline =>
    self.vtbl.findClosestMatchingMode1(
        self,
        pModeToMatch,
        pClosestMatch,
        pConcernedDevice);

fn Win32_HRESULT IOutput.getDisplaySurfaceData1(
    &self,
    IResource* pDestination
) @inline =>
    self.vtbl.getDisplaySurfaceData1(self, pDestination);

fn Win32_HRESULT IOutput.duplicateOutput(
    &self,
    IUnknown* pDevice,
    IOutputDuplication** ppOutputDuplication
) @inline =>
    self.vtbl.duplicateOutput(self, pDevice, ppOutputDuplication);

// Functions of IOutput2

fn Bool IOutput.supportsOverlays(&self) @inline => self.vtbl.supportsOverlays(self);

// Functions from IOutput3

fn Win32_HRESULT IOutput.checkOverlaySupport(
    &self,
    Format enumFormat,
    IUnknown* pConcernedDevice,
    OverlaySupportFlags* pFlags
) @inline =>
    self.vtbl.checkOverlaySupport(self, enumFormat, pConcernedDevice, pFlags);

// Functions from IOutput4

fn Win32_HRESULT IOutput.checkOverlayColorSpaceSupport(
    &self,
    Format format,
    ColorSpaceType colorSpace,
    IUnknown* pConcernedDevice,
    OverlayColorSpaceSupportFlags* pFlags
) @inline =>
    self.vtbl.checkOverlayColorSpaceSupport(
        self,
        format,
        colorSpace,
        pConcernedDevice,
        pFlags);

// Functions from IOutput5

fn Win32_HRESULT IOutput.duplicateOutput1(
    &self,
    IUnknown* pDevice,
    uint flags,
    uint supportedFormatsCount,
    Format* pSupportedFormats,
    IOutputDuplication** ppOutputDuplication
) @inline =>
    self.vtbl.duplicateOutput1(
        self,
        pDevice,
        flags,
        supportedFormatsCount,
        pSupportedFormats,
        ppOutputDuplication);

// Functions from IOutput6

fn Win32_HRESULT IOutput.getDesc1(
    &self, OutputDesc1* pDesc
) @inline =>
    self.vtbl.getDesc1(self, pDesc);

fn Win32_HRESULT IOutput.checkHardwareCompositionSupport(
    &self, HardwareCompositionSupportFlags* pFlags
) @inline =>
    self.vtbl.checkHardwareCompositionSupport(self, pFlags);

const MAX_SWAP_CHAIN_BUFFERS = 16;

bitstruct PresentFlags : uint
{
    bool test                : 0;
    bool doNotSequence       : 1;
    bool restart             : 2;
    bool doNotWait           : 3;
    bool stereoPreferRight   : 4;
    bool stereoTemporaryMono : 5;
    bool restrictToOutput    : 6;
    bool useDuration         : 8;
    bool allowTearing        : 9;
    uint __unused0           : 10..31;
}

alias Present = PresentFlags;

// =============================================================================
// ISwapChain
// =============================================================================

const ISWAP_CHAIN_UUID_STRING = "310d36a0-d2e7-4c0a-aa04-6a9d23b8886a";
const Win32_GUID ISWAP_CHAIN_UUID = {
    0x310d36a0, 0xd2e7, 0x4c0a, { 0xaa, 0x04, 0x6a, 0x9d, 0x23, 0xb8, 0x88, 0x6a } };

const ISWAP_CHAIN1_UUID_STRING = "790a45f7-0d42-4876-983a-0a55cfe6f4aa";
const Win32_GUID ISWAP_CHAIN1_UUID = {
    0x790a45f7, 0x0d42, 0x4876,  { 0x98, 0x3a, 0x0a, 0x55, 0xcf, 0xe6, 0xf4, 0xaa } };

const ISWAP_CHAIN2_UUID_STRING = "a8be2ac4-199f-4946-b331-79599fb98de7";
const Win32_GUID ISWAP_CHAIN2_UUID = {
    0xa8be2ac4, 0x199f, 0x4946, { 0xb3, 0x31, 0x79, 0x59, 0x9f, 0xb9, 0x8d, 0xe7 } };

const ISWAP_CHAIN3_UUID_STRING = "94d99bdb-f1f8-4ab0-b236-7da0170edab1";
const Win32_GUID ISWAP_CHAIN3_UUID = {
    0x94d99bdb, 0xf1f8, 0x4ab0, { 0xb2, 0x36, 0x7d, 0xa0, 0x17, 0x0e, 0xda, 0xb1 } };

const ISWAP_CHAIN4_UUID_STRING = "3D585D5A-BD4A-489E-B1F4-3DBCB6452FFB";
const Win32_GUID ISWAP_CHAIN4_UUID = {
    0x3D585D5A, 0xBD4A, 0x489E, { 0xB1, 0xF4, 0x3D, 0xBC, 0xB6, 0x45, 0x2F, 0xFB } };

struct ISwapChain
{
    inline ISwapChainVTable* vtbl;
}

typedef ISwapChain1 = inline ISwapChain;
typedef ISwapChain2 = inline ISwapChain;
typedef ISwapChain3 = inline ISwapChain;
typedef ISwapChain4 = inline ISwapChain;

// Function pointers of ISwapChain

alias ISwapChain_PresentFn = fn Win32_HRESULT(
    void* self,
    uint syncInterval,
    PresentFlags flags);

alias ISwapChain_GetBufferFn = fn Win32_HRESULT(
    void* self,
    uint buffer,
    Win32_GUID* riid,
    void** ppSurface);

alias ISwapChain_SetFullscreenStateFn = fn Win32_HRESULT(
    void* self,
    Bool fullscreen,
    IOutput* pTarget);

alias ISwapChain_GetFullscreenStateFn = fn Win32_HRESULT(
    void* self,
    Bool* pFullscreen,
    IOutput** ppTarget);

alias ISwapChain_GetDescFn = fn Win32_HRESULT(
    void* self,
    SwapChainDesc* pDesc);

alias ISwapChain_ResizeBuffersFn = fn Win32_HRESULT(
    void* self,
    uint bufferCount,
    uint width,
    uint height,
    Format newFormat,
    SwapChainFlags swapChainFlags);

alias ISwapChain_ResizeTargetFn = fn Win32_HRESULT(
    void* self,
    ModeDesc* pNewTargetParameters);

alias ISwapChain_GetContainingOutputFn = fn Win32_HRESULT(
    void* self,
    IOutput** ppOutput);

alias ISwapChain_GetFrameStatisticsFn = fn Win32_HRESULT(
    void* self,
    FrameStatistics* pStats);

alias ISwapChain_GetLastPresentCountFn = fn Win32_HRESULT(
    void* self,
    uint* pLastPresentCount);

// Function pointers of ISwapChain1

alias ISwapChain1_GetDesc1Fn = fn Win32_HRESULT (
    void* self,
    SwapChainDesc1* pDesc);

alias ISwapChain1_GetFullscreenDescFn = fn Win32_HRESULT (
    void* self,
    SwapChainFullscreenDesc* pDesc);

alias ISwapChain1_GetHwndFn = fn Win32_HRESULT (
    void* self,
    Win32_HWND* pHwnd);

alias ISwapChain1_GetCoreWindowFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID refiid,
    void** ppUnk);

alias ISwapChain1_Present1Fn = fn Win32_HRESULT (
    void* self,
    uint syncInterval,
    PresentFlags presentFlags,
    PresentParameters* pPresentParameters);

alias ISwapChain1_IsTemporaryMonoSupportedFn = fn Bool (void* self);

alias ISwapChain1_GetRestrictToOutputFn = fn Win32_HRESULT (
    void* self,
    IOutput** ppRestrictToOutput);

alias ISwapChain1_SetBackgroundColorFn = fn Win32_HRESULT (
    void* self,
    Rgba* pColor);

alias ISwapChain1_GetBackgroundColorFn = fn Win32_HRESULT (
    void* self,
    Rgba* pColor);

alias ISwapChain1_SetRotationFn = fn Win32_HRESULT (
    void* self,
    ModeRotation rotation);

alias ISwapChain1_GetRotationFn = fn Win32_HRESULT (
    void* self,
    ModeRotation* pRotation);

// Function pointers of ISwapChain2

alias ISwapChain2_SetSourceSizeFn = fn Win32_HRESULT (
    void* self,
    uint width,
    uint height);

alias ISwapChain2_GetSourceSizeFn = fn Win32_HRESULT (
    void* self,
    uint* pWidth,
    uint* pHeight);

alias ISwapChain2_SetMaximumFrameLatencyFn = fn Win32_HRESULT (
    void* self,
    uint maxLatency);

alias ISwapChain2_GetMaximumFrameLatencyFn = fn Win32_HRESULT (
    void* self,
    uint* pMaxLatency);

alias ISwapChain2_GetFrameLatencyWaitableObjectFn = fn Win32_HANDLE (void* self);

alias ISwapChain2_SetMatrixTransformFn = fn Win32_HRESULT (
    void* self,
    Matrix3X2F* pMatrix);

alias ISwapChain2_GetMatrixTransformFn = fn Win32_HRESULT (
    void* self,
    Matrix3X2F* pMatrix);

// Function pointers of ISwapChain3

alias ISwapChain3_GetCurrentBackBufferIndexFn = fn uint (void* self);

alias ISwapChain3_CheckColorSpaceSupportFn = fn Win32_HRESULT (
    void* self,
    ColorSpaceType colorSpace,
    SwapChainColorSpaceSupportFlags* pColorSpaceSupport);

alias ISwapChain3_SetColorSpace1Fn = fn Win32_HRESULT (
    void* self,
    ColorSpaceType colorSpace);

alias ISwapChain3_ResizeBuffers1Fn = fn Win32_HRESULT (
    void* self,
    uint bufferCount,
    uint width,
    uint height,
    Format format,
    SwapChainFlags swapChainFlags,
    uint* pCreationNodeMask,
    IUnknown** ppPresentQueue);

// Function pointers of ISwapChain4

alias ISwapChain4_SetHDRMetaDataFn = fn Win32_HRESULT (
    void* self,
    HdrMetadataType type,
    uint size,
    void* pMetaData);

struct ISwapChainVTable
{
    inline IDeviceSubObjectVTable _base;

    // ISwapChain
    ISwapChain_PresentFn present;
    ISwapChain_GetBufferFn getBuffer;
    ISwapChain_SetFullscreenStateFn setFullscreenState;
    ISwapChain_GetFullscreenStateFn getFullscreenState;
    ISwapChain_GetDescFn getDesc;
    ISwapChain_ResizeBuffersFn resizeBuffers;
    ISwapChain_ResizeTargetFn resizeTarget;
    ISwapChain_GetContainingOutputFn getContainingOutput;
    ISwapChain_GetFrameStatisticsFn getFrameStatistics;
    ISwapChain_GetLastPresentCountFn getLastPresentCount;

    // ISwapChain1
    ISwapChain1_GetDesc1Fn getDesc1;
    ISwapChain1_GetFullscreenDescFn getFullscreenDesc;
    ISwapChain1_GetHwndFn getHwnd;
    ISwapChain1_GetCoreWindowFn getCoreWindow;
    ISwapChain1_Present1Fn present1;
    ISwapChain1_IsTemporaryMonoSupportedFn isTemporaryMonoSupported;
    ISwapChain1_GetRestrictToOutputFn getRestrictToOutput;
    ISwapChain1_SetBackgroundColorFn setBackgroundColor;
    ISwapChain1_GetBackgroundColorFn getBackgroundColor;
    ISwapChain1_SetRotationFn setRotation;
    ISwapChain1_GetRotationFn getRotation;

    // ISwapChain2
    ISwapChain2_SetSourceSizeFn setSourceSize;
    ISwapChain2_GetSourceSizeFn getSourceSize;
    ISwapChain2_SetMaximumFrameLatencyFn setMaximumFrameLatency;
    ISwapChain2_GetMaximumFrameLatencyFn getMaximumFrameLatency;
    ISwapChain2_GetFrameLatencyWaitableObjectFn getFrameLatencyWaitableObject;
    ISwapChain2_SetMatrixTransformFn setMatrixTransform;
    ISwapChain2_GetMatrixTransformFn getMatrixTransform;

    // ISwapChain3
    ISwapChain3_GetCurrentBackBufferIndexFn getCurrentBackBufferIndex;
    ISwapChain3_CheckColorSpaceSupportFn checkColorSpaceSupport;
    ISwapChain3_SetColorSpace1Fn setColorSpace1;
    ISwapChain3_ResizeBuffers1Fn resizeBuffers1;

    // ISwapChain4
    ISwapChain4_SetHDRMetaDataFn setHDRMetaData;
}

// Functions from IUnknown

fn Win32_HRESULT ISwapChain.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ISwapChain.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ISwapChain.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT ISwapChain.setPrivateData(
    &self,
    Win32_GUID* name,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, name, dataSize, pData);

fn Win32_HRESULT ISwapChain.setPrivateDataInterface(
    &self,
    Win32_GUID* name,
    IUnknown* pUnknown
) @inline =>
    self.vtbl.setPrivateDataInterface(self, name, pUnknown);

fn Win32_HRESULT ISwapChain.getPrivateData(
    &self,
    Win32_GUID* name,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, name, pDataSize, pData);

fn Win32_HRESULT ISwapChain.getParent(
    &self,
    Win32_GUID* riid,
    void** ppParent
) @inline =>
    self.vtbl.getParent(self, riid, ppParent);

// Functions of IDeviceSubObject

fn Win32_HRESULT ISwapChain.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppDevice);

// Functions of ISwapChain

fn Win32_HRESULT ISwapChain.present(
    &self,
    uint syncInterval,
    PresentFlags flags
) @inline =>
    self.vtbl.present(self, syncInterval, flags);

fn Win32_HRESULT ISwapChain.getBuffer(
    &self,
    uint buffer,
    Win32_GUID* riid,
    void** ppSurface
) @inline =>
    self.vtbl.getBuffer(self, buffer, riid, ppSurface);

fn Win32_HRESULT ISwapChain.setFullscreenState(
    &self,
    Bool fullscreen,
    IOutput* pTarget
) @inline =>
    self.vtbl.setFullscreenState(self, fullscreen, pTarget);

fn Win32_HRESULT ISwapChain.getFullscreenState(
    &self,
    Bool* pFullscreen,
    IOutput** ppTarget
) @inline =>
    self.vtbl.getFullscreenState(self, pFullscreen, ppTarget);

fn Win32_HRESULT ISwapChain.getDesc(
    &self,
    SwapChainDesc* pDesc
) @inline =>
    self.vtbl.getDesc(self, pDesc);

fn Win32_HRESULT ISwapChain.resizeBuffers(
    &self,
    uint bufferCount,
    uint width,
    uint height,
    Format newFormat,
    SwapChainFlags swapChainFlags
) @inline =>
    self.vtbl.resizeBuffers(
        self,
        bufferCount,
        width,
        height,
        newFormat,
        swapChainFlags);

fn Win32_HRESULT ISwapChain.resizeTarget(
    &self,
    ModeDesc* pNewTargetParameters
) @inline =>
    self.vtbl.resizeTarget(self, pNewTargetParameters);

fn Win32_HRESULT ISwapChain.getContainingOutput(
    &self,
    IOutput** ppOutput
) @inline =>
    self.vtbl.getContainingOutput(self, ppOutput);

fn Win32_HRESULT ISwapChain.getFrameStatistics(
    &self,
    FrameStatistics* pStats
) @inline =>
    self.vtbl.getFrameStatistics(self, pStats);

fn Win32_HRESULT ISwapChain.getLastPresentCount(
    &self,
    uint* pLastPresentCount
) @inline =>
    self.vtbl.getLastPresentCount(self, pLastPresentCount);

// Functions from ISwapChain1

fn Win32_HRESULT ISwapChain.getDesc1(
    &self,
    SwapChainDesc1* pDesc
) @inline =>
    self.vtbl.getDesc1(self, pDesc);

fn Win32_HRESULT ISwapChain.getFullscreenDesc(
    &self,
    SwapChainFullscreenDesc* pDesc
) @inline =>
    self.vtbl.getFullscreenDesc(self, pDesc);

fn Win32_HRESULT ISwapChain.getHwnd(
    &self,
    Win32_HWND* pHwnd
) @inline =>
    self.vtbl.getHwnd(self, pHwnd);

fn Win32_HRESULT ISwapChain.getCoreWindow(
    &self,
    Win32_GUID refiid,
    void** ppUnk
) @inline =>
    self.vtbl.getCoreWindow(self, refiid, ppUnk);

fn Win32_HRESULT ISwapChain.present1(
    &self,
    uint syncInterval,
    PresentFlags presentFlags,
    PresentParameters* pPresentParameters
) @inline =>
    self.vtbl.present1(self, syncInterval, presentFlags, pPresentParameters);

fn Bool ISwapChain.isTemporaryMonoSupported(&self) @inline =>
    self.vtbl.isTemporaryMonoSupported(self);

fn Win32_HRESULT ISwapChain.getRestrictToOutput(
    &self,
    IOutput** ppRestrictToOutput
) @inline =>
    self.vtbl.getRestrictToOutput(self, ppRestrictToOutput);

fn Win32_HRESULT ISwapChain.setBackgroundColor(
    &self,
    Rgba* pColor
) @inline =>
    self.vtbl.setBackgroundColor(self, pColor);

fn Win32_HRESULT ISwapChain.getBackgroundColor(
    &self,
    Rgba* pColor
) @inline =>
    self.vtbl.getBackgroundColor(self, pColor);

fn Win32_HRESULT ISwapChain.setRotation(
    &self,
    ModeRotation rotation
) @inline =>
    self.vtbl.setRotation(self, rotation);

fn Win32_HRESULT ISwapChain.getRotation(
    &self,
    ModeRotation* pRotation
) @inline =>
    self.vtbl.getRotation(self, pRotation);

// Functions of ISwapChain2

fn Win32_HRESULT ISwapChain.setSourceSize(
    &self,
    uint width,
    uint height
) @inline =>
    self.vtbl.setSourceSize(self, width, height);

fn Win32_HRESULT ISwapChain.getSourceSize(
    &self,
    uint* pWidth,
    uint* pHeight
) @inline =>
    self.vtbl.getSourceSize(self, pWidth, pHeight);

fn Win32_HRESULT ISwapChain.setMaximumFrameLatency(
    &self,
    uint maxLatency
) @inline =>
    self.vtbl.setMaximumFrameLatency(self, maxLatency);

fn Win32_HRESULT ISwapChain.getMaximumFrameLatency(
    &self,
    uint* pMaxLatency
) @inline =>
    self.vtbl.getMaximumFrameLatency(self, pMaxLatency);

fn Win32_HANDLE ISwapChain.getFrameLatencyWaitableObject(&self) @inline =>
    self.vtbl.getFrameLatencyWaitableObject(self);

fn Win32_HRESULT ISwapChain.setMatrixTransform(
    &self,
    Matrix3X2F* pMatrix
) @inline =>
    self.vtbl.setMatrixTransform(self, pMatrix);

fn Win32_HRESULT ISwapChain.getMatrixTransform(
    &self,
    Matrix3X2F* pMatrix
) @inline =>
    self.vtbl.getMatrixTransform(self, pMatrix);

// Functions of ISwapChain3

fn uint ISwapChain.getCurrentBackBufferIndex(&self) @inline =>
    self.vtbl.getCurrentBackBufferIndex(self);

fn Win32_HRESULT ISwapChain.checkColorSpaceSupport(
    &self,
    ColorSpaceType colorSpace,
    SwapChainColorSpaceSupportFlags* pColorSpaceSupport
) @inline =>
    self.vtbl.checkColorSpaceSupport(self, colorSpace, pColorSpaceSupport);

fn Win32_HRESULT ISwapChain.setColorSpace1(
    &self,
    ColorSpaceType colorSpace
) @inline =>
    self.vtbl.setColorSpace1(self, colorSpace);

fn Win32_HRESULT ISwapChain.resizeBuffers1(
    &self,
    uint bufferCount,
    uint width,
    uint height,
    Format format,
    SwapChainFlags swapChainFlags,
    uint* pCreationNodeMask,
    IUnknown** ppPresentQueue
) @inline =>
    self.vtbl.resizeBuffers1(
        self,
        bufferCount,
        width,
        height,
        format,
        swapChainFlags,
        pCreationNodeMask,
        ppPresentQueue);

// Functions of ISwapChain4

fn Win32_HRESULT ISwapChain.setHDRMetaData(
    &self,
    HdrMetadataType type,
    uint size,
    void* pMetaData
) @inline =>
    self.vtbl.setHDRMetaData(self, type, size, pMetaData);

bitstruct MwaFlags : uint
{
    bool noWindowChanges : 0;
    bool noAltEnter      : 1;
    bool noPrintScreen   : 2;
    uint __unused0       : 3..31;
}

alias Mwa = MwaFlags;

const MwaFlags MWA_VALID = { .noWindowChanges, .noAltEnter, .noPrintScreen };

// =============================================================================
// IFactory
// =============================================================================

const IFACTORY_UUID_STRING = "7b7166ec-21c7-44ae-b21a-c9ae321ae369";
const Win32_GUID IFACTORY_UUID = {
    .data1 = 0x7b7166ec, .data2 = 0x21c7, .data3 = 0x44ae,
    .data4 = { 0xb2, 0x1a, 0xc9, 0xae, 0x32, 0x1a, 0xe3, 0x69 }
};

const IFACTORY1_UUID_STRING = "770aae78-f26f-4dba-a829-253c83d1b387";
const Win32_GUID IFACTORY1_UUID = {
    .data1 = 0x770aae78, .data2 = 0xf26f, .data3 = 0x4dba,
    .data4 = { 0xa8, 0x29, 0x25, 0x3c, 0x83, 0xd1, 0xb3, 0x87 }
};

const IFACTORY2_UUID_STRING = "50c83a1c-e072-4c48-87b0-3630fa36a6d0";
const Win32_GUID IFACTORY2_UUID = {
    0x50c83a1c, 0xe072, 0x4c48,  { 0x87, 0xb0, 0x36, 0x30, 0xfa, 0x36, 0xa6, 0xd0 } };

const IFACTORY3_UUID_STRING = "25483823-cd46-4c7d-86ca-47aa95b837bd";
const Win32_GUID IFACTORY3_UUID = {
    0x25483823, 0xcd46, 0x4c7d, { 0x86, 0xca, 0x47, 0xaa, 0x95, 0xb8, 0x37, 0xbd } };

const IFACTORY4_UUID_STRING = "1bc6ea02-ef36-464f-bf0c-21ca39e5168a";
const Win32_GUID IFACTORY4_UUID = {
    0x1bc6ea02, 0xef36, 0x464f, { 0xbf, 0x0c, 0x21, 0xca, 0x39, 0xe5, 0x16, 0x8a } };

const IFACTORY5_UUID_STRING = "7632e1f5-ee65-4dca-87fd-84cd75f8838d";
const Win32_GUID IFACTORY5_UUID = {
    0x7632e1f5, 0xee65, 0x4dca, { 0x87, 0xfd, 0x84, 0xcd, 0x75, 0xf8, 0x83, 0x8d } };

const IFACTORY6_UUID_STRING = "c1b6694f-ff09-44a9-b03c-77900a0a1d17";
const Win32_GUID IFACTORY6_UUID = {
    0xc1b6694f, 0xff09, 0x44a9, { 0xb0, 0x3c, 0x77, 0x90, 0x0a, 0x0a, 0x1d, 0x17 } };

const IFACTORY7_UUID_STRING = "a4966eed-76db-44da-84c1-ee9a7afb20a8";
const Win32_GUID IFACTORY7_UUID = {
    0xa4966eed, 0x76db, 0x44da, { 0x84, 0xc1, 0xee, 0x9a, 0x7a, 0xfb, 0x20, 0xa8 } };

struct IFactory
{
    inline IFactoryVTable* vtbl;
}

typedef IFactory1 = inline IFactory;
typedef IFactory2 = inline IFactory;
typedef IFactory3 = inline IFactory;
typedef IFactory4 = inline IFactory;
typedef IFactory5 = inline IFactory;
typedef IFactory6 = inline IFactory;
typedef IFactory7 = inline IFactory;

// Function pointers of IFactory

alias IFactory_EnumAdaptersFn = fn Win32_HRESULT (
    void* self,
    uint adapter,
    IAdapter** ppAdapter);

alias IFactory_MakeWindowAssociationFn = fn Win32_HRESULT (
    void* self,
    Win32_HWND windowHandle,
    MwaFlags flags);

alias IFactory_GetWindowAssociationFn = fn Win32_HRESULT (
    void* self,
    Win32_HWND* pWindowHandle);

alias IFactory_CreateSwapChainFn = fn Win32_HRESULT (
    void* self,
    IUnknown* pDevice,
    SwapChainDesc* pDesc,
    ISwapChain** ppSwapChain);

alias IFactory_CreateSoftwareAdapterFn = fn Win32_HRESULT (
    void* self,
    Win32_HMODULE mod,
    IAdapter** ppAdapter);

// Function pointers of IFactory1

alias IFactory1_EnumAdapters1Fn = fn Win32_HRESULT (
    void* self,
    uint adapter,
    IAdapter1** ppAdapter);

// Function pointers of IFactory2

alias IFactory2_IsWindowedStereoEnabledFn = fn Bool (void* self);

alias IFactory2_CreateSwapChainForHwndFn = fn Win32_HRESULT (
    void* self,
    IUnknown* pDevice,
    Win32_HWND hWnd,
    SwapChainDesc1* pDesc, SwapChainFullscreenDesc* pFullscreenDesc,
    IOutput* pRestrictToOutput,
    ISwapChain1** ppSwapChain);

alias IFactory2_CreateSwapChainForCoreWindowFn = fn Win32_HRESULT (
    void* self,
    IUnknown* pDevice,
    IUnknown* pWindow,
    SwapChainDesc1* pDesc,
    IOutput* pRestrictToOutput,
    ISwapChain1** ppSwapChain);

alias IFactory2_GetSharedResourceAdapterLuidFn = fn Win32_HRESULT (
    void* self,
    Win32_HANDLE hResource,
    Win32_LUID* pLuid);

alias IFactory2_RegisterStereoStatusWindowFn = fn Win32_HRESULT (
    void* self,
    Win32_HWND windowHandle,
    uint wMsg,
    Win32_DWORD* pdwCookie);

alias IFactory2_RegisterStereoStatusEventFn = fn Win32_HRESULT (
    void* self,
    Win32_HANDLE hEvent,
    Win32_DWORD* pdwCookie);

alias IFactory2_UnregisterStereoStatusFn = fn void (
    void* self,
    Win32_DWORD dwCookie);

alias IFactory2_RegisterOcclusionStatusWindowFn = fn Win32_HRESULT (
    void* self,
    Win32_HWND windowHandle,
    uint wMsg,
    Win32_DWORD* pdwCookie);

alias IFactory2_RegisterOcclusionStatusEventFn = fn Win32_HRESULT (
    void* self,
    Win32_HANDLE hEvent,
    Win32_DWORD* pdwCookie);

alias IFactory2_UnregisterOcclusionStatusFn = fn void (
    void* self,
    Win32_DWORD dwCookie);

alias IFactory2_CreateSwapChainForCompositionFn = fn Win32_HRESULT (
    void* self,
    IUnknown* pDevice,
    SwapChainDesc1* pDesc,
    IOutput* pRestrictToOutput,
    ISwapChain1** ppSwapChain);

alias IFactory1_IsCurrentFn = fn Bool (void* self);

// Function pointers of IFactory3

alias IFactory3_GetCreationFlagsFn = fn CreateFactoryFlags (void* self);

// Function pointers of IFactory4

alias IFactory4_EnumAdapterByLuidFn = fn Win32_HRESULT (
    void* self,
    Win32_LUID ddapterLuid,
    Win32_GUID* riid, void** ppvAdapter);

alias IFactory4_EnumWarpAdapterFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* riid,
    void** ppvAdapter);

// Function pointers of IFactory5

alias IFactory5_CheckFeatureSupportFn = fn Win32_HRESULT (
    void* self,
    Feature feature,
    void* pFeatureSupportData,
    uint featureSupportDataSize);

// Function pointers of IFactory6

alias IFactory6_EnumAdapterByGpuPreferenceFn = fn Win32_HRESULT (
    void* self,
    uint adapter,
    GpuPreference gpuPreference,
    Win32_GUID* riid,
    void** ppvAdapter);

// Function pointers of IFactory7

alias IFactory7_RegisterAdaptersChangedEventFn = fn Win32_HRESULT (
    void* self,
    Win32_HANDLE hEvent,
    Win32_DWORD* pdwCookie);

alias IFactory7_UnregisterAdaptersChangedEventFn = fn Win32_HRESULT (
    void* self,
    Win32_DWORD dwCookie);

struct IFactoryVTable
{
    inline IObjectVTable _base;

    // IFactory
    IFactory_EnumAdaptersFn enumAdapters;
    IFactory_MakeWindowAssociationFn makeWindowAssociation;
    IFactory_GetWindowAssociationFn getWindowAssociation;
    IFactory_CreateSwapChainFn createSwapChain;
    IFactory_CreateSoftwareAdapterFn createSoftwareAdapter;

    // IFactory1
    IFactory1_EnumAdapters1Fn enumAdapters1;
    IFactory1_IsCurrentFn isCurrent;

    // IFactory2
    IFactory2_IsWindowedStereoEnabledFn isWindowedStereoEnabled;
    IFactory2_CreateSwapChainForHwndFn createSwapChainForHwnd;
    IFactory2_CreateSwapChainForCoreWindowFn createSwapChainForCoreWindow;
    IFactory2_GetSharedResourceAdapterLuidFn getSharedResourceAdapterLuid;
    IFactory2_RegisterStereoStatusWindowFn registerStereoStatusWindow;
    IFactory2_RegisterStereoStatusEventFn registerStereoStatusEvent;
    IFactory2_UnregisterStereoStatusFn unregisterStereoStatus;
    IFactory2_RegisterOcclusionStatusWindowFn registerOcclusionStatusWindow;
    IFactory2_RegisterOcclusionStatusEventFn registerOcclusionStatusEvent;
    IFactory2_UnregisterOcclusionStatusFn unregisterOcclusionStatus;
    IFactory2_CreateSwapChainForCompositionFn createSwapChainForComposition;

    // IFactory3
    IFactory3_GetCreationFlagsFn getCreationFlags;

    // IFactory4
    IFactory4_EnumAdapterByLuidFn enumAdapterByLuid;
    IFactory4_EnumWarpAdapterFn enumWarpAdapter;

    // IFactory5
    IFactory5_CheckFeatureSupportFn checkFeatureSupport;

    // IFactory6
    IFactory6_EnumAdapterByGpuPreferenceFn enumAdapterByGpuPreference;

    // IFactory7
    IFactory7_RegisterAdaptersChangedEventFn registerAdaptersChangedEvent;
    IFactory7_UnregisterAdaptersChangedEventFn unregisterAdaptersChangedEvent;
}

// Functions from IUnknown

fn Win32_HRESULT IFactory.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IFactory.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IFactory.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IFactory.setPrivateData(
    &self,
    Win32_GUID* name,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, name, dataSize, pData);

fn Win32_HRESULT IFactory.setPrivateDataInterface(
    &self,
    Win32_GUID* name,
    IUnknown* pUnknown
) @inline =>
    self.vtbl.setPrivateDataInterface(self, name, pUnknown);

fn Win32_HRESULT IFactory.getPrivateData(
    &self,
    Win32_GUID* name,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, name, pDataSize, pData);

fn Win32_HRESULT IFactory.getParent(
    &self,
    Win32_GUID* riid,
    void** ppParent
) @inline =>
    self.vtbl.getParent(self, riid, ppParent);

// Functions of IFactory

fn Win32_HRESULT IFactory.enumAdapters(
    &self,
    uint adapter,
    IAdapter** ppAdapter
) @inline =>
    self.vtbl.enumAdapters(self, adapter, ppAdapter);

fn Win32_HRESULT IFactory.makeWindowAssociation(
    &self,
    Win32_HWND windowHandle,
    MwaFlags flags
) @inline =>
    self.vtbl.makeWindowAssociation(self, windowHandle, flags);

fn Win32_HRESULT IFactory.getWindowAssociation(
    &self,
    Win32_HWND* pWindowHandle
) @inline =>
    self.vtbl.getWindowAssociation(self, pWindowHandle);

fn Win32_HRESULT IFactory.createSwapChain(
    &self,
    IUnknown* pDevice,
    SwapChainDesc* pDesc,
    ISwapChain** ppSwapChain
) @inline =>
    self.vtbl.createSwapChain(self, pDevice, pDesc, ppSwapChain);

fn Win32_HRESULT IFactory.createSoftwareAdapter(
    &self,
    Win32_HMODULE mod,
    IAdapter** ppAdapter
) @inline =>
    self.vtbl.createSoftwareAdapter(self, mod, ppAdapter);

// Functions of IFactory1

fn Win32_HRESULT IFactory.enumAdapters1(
    &self,
    uint adapter,
    IAdapter1** ppAdapter
) @inline =>
    self.vtbl.enumAdapters1(self, adapter, ppAdapter);

fn Bool IFactory.isCurrent(&self) @inline =>
    self.vtbl.isCurrent(self);

// Functions of IFactory2

fn Bool IFactory.isWindowedStereoEnabled(
    &self
) @inline =>
    self.vtbl.isWindowedStereoEnabled(self);

fn Win32_HRESULT IFactory.createSwapChainForHwnd(
    &self,
    IUnknown* pDevice,
    Win32_HWND hWnd,
    SwapChainDesc1* pDesc,
    SwapChainFullscreenDesc* pFullscreenDesc,
    IOutput* pRestrictToOutput,
    ISwapChain1** ppSwapChain
) @inline =>
    self.vtbl.createSwapChainForHwnd(
        self,
        pDevice,
        hWnd,
        pDesc,
        pFullscreenDesc,
        pRestrictToOutput,
        ppSwapChain);

fn Win32_HRESULT IFactory.createSwapChainForCoreWindow(
    &self,
    IUnknown* pDevice,
    IUnknown* pWindow,
    SwapChainDesc1* pDesc,
    IOutput* pRestrictToOutput,
    ISwapChain1** ppSwapChain
) @inline =>
    self.vtbl.createSwapChainForCoreWindow(
        self,
        pDevice,
        pWindow,
        pDesc,
        pRestrictToOutput, ppSwapChain);

fn Win32_HRESULT IFactory.getSharedResourceAdapterLuid(
    &self,
    Win32_HANDLE hResource,
    Win32_LUID* pLuid
) @inline =>
    self.vtbl.getSharedResourceAdapterLuid(self, hResource, pLuid);

fn Win32_HRESULT IFactory.registerStereoStatusWindow(
    &self,
    Win32_HWND windowHandle,
    uint wMsg,
    Win32_DWORD* pdwCookie
) @inline =>
    self.vtbl.registerStereoStatusWindow(self, windowHandle, wMsg, pdwCookie);

fn Win32_HRESULT IFactory.registerStereoStatusEvent(
    &self,
    Win32_HANDLE hEvent,
    Win32_DWORD* pdwCookie
) @inline =>
    self.vtbl.registerStereoStatusEvent(self, hEvent, pdwCookie);

fn void IFactory.unregisterStereoStatus(
    &self,
    Win32_DWORD dwCookie
) @inline =>
    self.vtbl.unregisterStereoStatus(self, dwCookie);

fn Win32_HRESULT IFactory.registerOcclusionStatusWindow(
    &self,
    Win32_HWND windowHandle,
    uint wMsg,
    Win32_DWORD* pdwCookie
) @inline =>
    self.vtbl.registerOcclusionStatusWindow(self, windowHandle, wMsg, pdwCookie);

fn Win32_HRESULT IFactory.registerOcclusionStatusEvent(
    &self,
    Win32_HANDLE hEvent,
    Win32_DWORD* pdwCookie
) @inline =>
    self.vtbl.registerOcclusionStatusEvent(self, hEvent, pdwCookie);

fn void IFactory.unregisterOcclusionStatus(
    &self,
    Win32_DWORD dwCookie
) @inline =>
    self.vtbl.unregisterOcclusionStatus(self, dwCookie);

fn Win32_HRESULT IFactory.createSwapChainForComposition(
    &self,
    IUnknown* pDevice,
    SwapChainDesc1* pDesc,
    IOutput* pRestrictToOutput,
    ISwapChain1** ppSwapChain
) @inline =>
    self.vtbl.createSwapChainForComposition(
        self,
        pDevice,
        pDesc,
        pRestrictToOutput, ppSwapChain);

// Functions of IFactory3

fn CreateFactoryFlags IFactory.getCreationFlags(&self) @inline =>
    self.vtbl.getCreationFlags(self);

// Functions of IFactory4

fn Win32_HRESULT IFactory.enumAdapterByLuid(
    &self,
    Win32_LUID ddapterLuid,
    Win32_GUID* riid,
    void** ppvAdapter
) @inline =>
    self.vtbl.enumAdapterByLuid(self, ddapterLuid, riid, ppvAdapter);

fn Win32_HRESULT IFactory.enumWarpAdapter(
    &self,
    Win32_GUID* riid,
    void** ppvAdapter
) @inline =>
    self.vtbl.enumWarpAdapter(self, riid, ppvAdapter);

// Functions of IFactory5

fn Win32_HRESULT IFactory.checkFeatureSupport(
    &self,
    Feature feature,
    void* pFeatureSupportData,
    uint featureSupportDataSize
) @inline =>
    self.vtbl.checkFeatureSupport(
        self,
        feature,
        pFeatureSupportData,
        featureSupportDataSize);

// Functions of IFactory6

fn Win32_HRESULT IFactory.enumAdapterByGpuPreference(
    &self,
    uint adapter,
    GpuPreference gpuPreference,
    Win32_GUID* riid,
    void** ppvAdapter
) @inline =>
    self.vtbl.enumAdapterByGpuPreference(
        self,
        adapter,
        gpuPreference,
        riid,
        ppvAdapter);

// Functions of IFactory7

fn Win32_HRESULT IFactory.registerAdaptersChangedEvent(
    &self,
    Win32_HANDLE hEvent,
    Win32_DWORD* pdwCookie
) @inline =>
    self.vtbl.registerAdaptersChangedEvent(self, hEvent, pdwCookie);

fn Win32_HRESULT IFactory.unregisterAdaptersChangedEvent(
    &self,
    Win32_DWORD dwCookie
) @inline =>
    self.vtbl.unregisterAdaptersChangedEvent(self, dwCookie);

extern fn Win32_HRESULT createDXGIFactory(
    Win32_GUID* riid,
    void** ppFactory
) @extern("CreateDXGIFactory");

extern fn Win32_HRESULT createDXGIFactory1(
    Win32_GUID* riid,
    void** ppFactory
) @extern("CreateDXGIFactory1");

// =============================================================================
// IDevice
// =============================================================================

const IDEVICE_UUID_STRING = "54ec77fa-1377-44e6-8c32-88fd5f44c84c";
const Win32_GUID IDEVICE_UUID = {
    0x54ec77fa, 0x1377, 0x44e6, { 0x8c, 0x32, 0x88, 0xfd, 0x5f, 0x44, 0xc8, 0x4c } };

const IDEVICE1_UUID_STRING = "77db970f-6276-48ba-ba28-070143b4392c";
const Win32_GUID IDEVICE1_UUID = {
    0x77db970f, 0x6276, 0x48ba, { 0xba, 0x28, 0x07, 0x01, 0x43, 0xb4, 0x39, 0x2c } };

const IDEVICE2_UUID_STRING = "05008617-fbfd-4051-a790-144884b4f6a9";
const Win32_GUID IDEVICE2_UUID = {
    0x05008617, 0xfbfd, 0x4051,  { 0xa7, 0x90, 0x14, 0x48, 0x84, 0xb4, 0xf6, 0xa9 } };

const IDEVICE3_UUID_STRING = "6007896c-3244-4afd-bf18-a6d3beda5023";
const Win32_GUID IDEVICE3_UUID = {
    0x6007896c, 0x3244, 0x4afd, { 0xbf, 0x18, 0xa6, 0xd3, 0xbe, 0xda, 0x50, 0x23 } };

const IDEVICE4_UUID_STRING = "95B4F95F-D8DA-4CA4-9EE6-3B76D5968A10";
const Win32_GUID IDEVICE4_UUID = {
    0x95B4F95F, 0xD8DA, 0x4CA4, { 0x9E, 0xE6, 0x3B, 0x76, 0xD5, 0x96, 0x8A, 0x10 } };

struct IDevice
{
    IDeviceVTable* vtbl;
}

typedef IDevice1 = inline IDevice;
typedef IDevice2 = inline IDevice;
typedef IDevice3 = inline IDevice;
typedef IDevice4 = inline IDevice;

// Function pointers of IDevice

alias IDevice_GetAdapterFn = fn Win32_HRESULT (
    void* self,
    IAdapter** pAdapter);

alias IDevice_CreateSurfaceFn = fn Win32_HRESULT (
    void* self,
    SurfaceDesc* pDesc,
    uint numSurfaces,
    UsageFlags usage,
    SharedResource* pSharedResource,
    ISurface** ppSurface);

alias IDevice_QueryResourceResidencyFn = fn Win32_HRESULT (
    void* self,
    IUnknown** ppResources,
    Residency* pResidencyStatus,
    uint numResources);

alias IDevice_SetGPUThreadPriorityFn = fn Win32_HRESULT (
    void* self,
    int priority);

alias IDevice_GetGPUThreadPriorityFn = fn Win32_HRESULT (
    void* self,
    int* pPriority);

// Function pointers of IDevice1

alias IDevice1_SetMaximumFrameLatencyFn = fn Win32_HRESULT (
    void* self,
    uint maxLatency);

alias IDevice1_GetMaximumFrameLatencyFn = fn Win32_HRESULT (
    void* self,
    uint* pMaxLatency);

// Function pointers of IDevice2

alias IDevice2_OfferResourcesFn = fn Win32_HRESULT (
    void* self,
    uint numResources,
    IResource** ppResources,
    OfferResourcePriority priority);

alias IDevice2_ReclaimResourcesFn = fn Win32_HRESULT (
    void* self,
    uint numResources,
    IResource** ppResources,
    Bool* pDiscarded);

alias IDevice2_EnqueueSetEventFn = fn Win32_HRESULT (
    void* self,
    Win32_HANDLE hEvent);

// Function pointers of IDevice3

alias IDevice3_TrimFn = fn void (void* self);

// Function pointers of IDevice4

alias IDevice4_OfferResources1Fn = fn Win32_HRESULT (
    void* self,
    uint numResources,
    IResource** ppResources,
    OfferResourcePriority priority,
    OfferResourceFlags flags);

alias IDevice4_ReclaimResources1Fn = fn Win32_HRESULT (
    void* self,
    uint numResources,
    IResource** ppResources,
    ReclaimResourceResults* pResults);

struct IDeviceVTable
{
    inline IObjectVTable _base;
    // IDevice
    IDevice_GetAdapterFn getAdapter;
    IDevice_CreateSurfaceFn createSurface;
    IDevice_QueryResourceResidencyFn queryResourceResidency;
    IDevice_SetGPUThreadPriorityFn setGPUThreadPriority;
    IDevice_GetGPUThreadPriorityFn getGPUThreadPriority;
    // IDevice1
    IDevice1_SetMaximumFrameLatencyFn setMaximumFrameLatency;
    IDevice1_GetMaximumFrameLatencyFn getMaximumFrameLatency;
    // IDevice2
    IDevice2_OfferResourcesFn offerResources;
    IDevice2_ReclaimResourcesFn reclaimResources;
    IDevice2_EnqueueSetEventFn enqueueSetEvent;
    // IDevice3
    IDevice3_TrimFn trim;
    // IDevice4
    IDevice4_OfferResources1Fn offerResources1;
    IDevice4_ReclaimResources1Fn reclaimResources1;
}

// Functions from IUnknown

fn Win32_HRESULT IDevice.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDevice.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDevice.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IDevice.setPrivateData(
    &self,
    Win32_GUID* name,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, name, dataSize, pData);

fn Win32_HRESULT IDevice.setPrivateDataInterface(
    &self,
    Win32_GUID* name,
    IUnknown* pUnknown
) @inline =>
    self.vtbl.setPrivateDataInterface(self, name, pUnknown);

fn Win32_HRESULT IDevice.getPrivateData(
    &self,
    Win32_GUID* name,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, name, pDataSize, pData);

fn Win32_HRESULT IDevice.getParent(
    &self,
    Win32_GUID* riid,
    void** ppParent
) @inline =>
    self.vtbl.getParent(self, riid, ppParent);

// Functions of IDevice

fn Win32_HRESULT IDevice.getAdapter(
    &self,
    IAdapter** pAdapter
) @inline =>
    self.vtbl.getAdapter(self, pAdapter);

fn Win32_HRESULT IDevice.createSurface(
    &self,
    SurfaceDesc* pDesc,
    uint numSurfaces,
    UsageFlags usage,
    SharedResource* pSharedResource,
    ISurface** ppSurface
) @inline =>
    self.vtbl.createSurface(
        self,
        pDesc,
        numSurfaces,
        usage,
        pSharedResource,
        ppSurface);

fn Win32_HRESULT IDevice.queryResourceResidency(
    &self,
    IUnknown** ppResources,
    Residency* pResidencyStatus,
    uint numResources
) @inline =>
    self.vtbl.queryResourceResidency(
        self,
        ppResources,
        pResidencyStatus,
        numResources);

fn Win32_HRESULT IDevice.setGPUThreadPriority(
    &self,
    int priority
) @inline =>
    self.vtbl.setGPUThreadPriority(self, priority);

fn Win32_HRESULT IDevice.getGPUThreadPriority(
    &self,
    int* pPriority
) @inline =>
    self.vtbl.getGPUThreadPriority(self, pPriority);

// Functions of IDevice1

fn Win32_HRESULT IDevice.setMaximumFrameLatency(
    &self,
    uint maxLatency
) @inline =>
    self.vtbl.setMaximumFrameLatency(self, maxLatency);

fn Win32_HRESULT IDevice.getMaximumFrameLatency(
    &self,
    uint* pMaxLatency
) @inline =>
    self.vtbl.getMaximumFrameLatency(self, pMaxLatency);

// Functions of IDevice2

fn Win32_HRESULT IDevice.offerResources(
    &self,
    uint numResources,
    IResource** ppResources,
    OfferResourcePriority priority
) @inline =>
    self.vtbl.offerResources(self, numResources, ppResources, priority);

fn Win32_HRESULT IDevice.reclaimResources(
    &self,
    uint numResources,
    IResource** ppResources,
    Bool* pDiscarded
) @inline =>
    self.vtbl.reclaimResources(self, numResources, ppResources, pDiscarded);

fn Win32_HRESULT IDevice.enqueueSetEvent(
    &self,
    Win32_HANDLE hEvent
) @inline =>
    self.vtbl.enqueueSetEvent(self, hEvent);

// Functions of IDevice3

fn void IDevice.trim(&self) @inline => self.vtbl.trim(self);

// Functions of IDevice4

fn Win32_HRESULT IDevice.offerResources1(
    &self,
    uint numResources,
    IResource** ppResources,
    OfferResourcePriority priority,
    OfferResourceFlags flags
) @inline =>
    self.vtbl.offerResources1(self, numResources, ppResources, priority, flags);

fn Win32_HRESULT IDevice.reclaimResources1(
    &self,
    uint numResources,
    IResource** ppResources,
    ReclaimResourceResults* pResults
) @inline =>
    self.vtbl.reclaimResources1(self, numResources, ppResources, pResults);

bitstruct AdapterFlags : uint
{
    bool remote    : 0;
    bool software  : 1;
    uint __unused0 : 2..31;
}

const AdapterFlags ADAPTER_FLAGS_NONE = {};

struct AdapterDesc1
{
    Win32_WCHAR[128] description;
    uint vendorId;
    uint deviceId;
    uint subSysId;
    uint revision;
    Win32_SIZE_T dedicatedVideoMemory;
    Win32_SIZE_T dedicatedSystemMemory;
    Win32_SIZE_T sharedSystemMemory;
    Win32_LUID adapterLuid;
    AdapterFlags flags;
}

struct DisplayColorSpace
{
    float[2][8] primaryCoordinates;
    float[2][16] whitePoints;
}

// =============================================================================
// IDisplayControl
// =============================================================================

const IDISPLAY_CONTROL_UUID_STRING = "ea9dbf1a-c88e-4486-854a-98aa0138f30c";
const Win32_GUID IDISPLAY_CONTROL_UUID = {
    0xea9dbf1a, 0xc88e, 0x4486,  { 0x85, 0x4a, 0x98, 0xaa, 0x01, 0x38, 0xf3, 0x0c } };

struct IDisplayControl
{
    IDisplayControlVTable* vtbl;
}

alias IDisplayControl_IsStereoEnabledFn = fn Bool (void* self);

alias IDisplayControl_SetStereoEnabledFn = fn void (
    void* self,
    Bool enabled);

struct IDisplayControlVTable
{
    inline IUnknownVTable _base;
    IDisplayControl_IsStereoEnabledFn isStereoEnabled;
    IDisplayControl_SetStereoEnabledFn setStereoEnabled;
}

// Functions from IUnknown

fn Win32_HRESULT IDisplayControl.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDisplayControl.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDisplayControl.release(&self) @inline => self.vtbl.release(self);

// Functions of IDisplayControl

fn Bool IDisplayControl.isStereoEnabled(&self) @inline =>
    self.vtbl.isStereoEnabled(self);

fn void IDisplayControl.setStereoEnabled(&self, Bool enabled) @inline =>
    self.vtbl.setStereoEnabled(self, enabled);

struct OutduplMoveRect
{
    Win32_POINT sourcePoint;
    Win32_RECT destinationRect;
}

struct OutduplDesc
{
    ModeDesc modeDesc;
    ModeRotation rotation;
    Bool desktopImageInSystemMemory;
}

struct OutduplPointerPosition
{
    Win32_POINT position;
    Bool visible;
}

enum OutduplPointerShapeType : int
{
    __UNUSED0,
    MONOCHROME,
    COLOR,
    __UNUSED1,
    MASKED_COLOR,
}

struct OutduplPointerShapeInfo
{
    OutduplPointerShapeType type;
    uint width;
    uint height;
    uint pitch;
    Win32_POINT hotSpot;
}

struct OutduplFrameInfo
{
    Win32_LARGE_INTEGER lastPresentTime;
    Win32_LARGE_INTEGER lastMouseUpdateTime;
    uint accumulatedFrames;
    Bool rectsCoalesced;
    Bool protectedContentMaskedOut;
    OutduplPointerPosition pointerPosition;
    uint totalMetadataBufferSize;
    uint pointerShapeBufferSize;
}

// =============================================================================
// IOutputDuplication
// =============================================================================

const IOUTPUT_DUPLICATION_UUID_STRING = "191cfac3-a341-470d-b26e-a864f428319c";
const Win32_GUID IOUTPUT_DUPLICATION_UUID = {
    0x191cfac3, 0xa341, 0x470d,  { 0xb2, 0x6e, 0xa8, 0x64, 0xf4, 0x28, 0x31, 0x9c } };

struct IOutputDuplication
{
    IOutputDuplicationVTable* vtbl;
}

alias IOutputDuplication_GetDescFn = fn void (
    void* self,
    OutduplDesc* pDesc);

alias IOutputDuplication_AcquireNextFrameFn = fn Win32_HRESULT (
    void* self,
    uint timeoutInMilliseconds,
    OutduplFrameInfo* pFrameInfo,
    IResource** ppDesktopResource);

alias IOutputDuplication_GetFrameDirtyRectsFn = fn Win32_HRESULT (
    void* self,
    uint dirtyRectsBufferSize,
    Win32_RECT* pDirtyRectsBuffer, uint* pDirtyRectsBufferSizeRequired);

alias IOutputDuplication_GetFrameMoveRectsFn = fn Win32_HRESULT (
    void* self,
    uint moveRectsBufferSize,
    OutduplMoveRect* pMoveRectBuffer,
    uint* pMoveRectsBufferSizeRequired);

alias IOutputDuplication_GetFramePointerShapeFn = fn Win32_HRESULT (
    void* self,
    uint pointerShapeBufferSize,
    void* pPointerShapeBuffer,
    uint* pPointerShapeBufferSizeRequired,
    OutduplPointerShapeInfo* pPointerShapeInfo);

alias IOutputDuplication_MapDesktopSurfaceFn = fn Win32_HRESULT (
    void* self,
    MappedRect* pLockedRect);

alias IOutputDuplication_UnMapDesktopSurfaceFn = fn Win32_HRESULT (void* self);

alias IOutputDuplication_ReleaseFrameFn = fn Win32_HRESULT (void* self);

struct IOutputDuplicationVTable
{
    inline IObjectVTable _base;
    IOutputDuplication_GetDescFn getDesc;
    IOutputDuplication_AcquireNextFrameFn acquireNextFrame;
    IOutputDuplication_GetFrameDirtyRectsFn getFrameDirtyRects;
    IOutputDuplication_GetFrameMoveRectsFn getFrameMoveRects;
    IOutputDuplication_GetFramePointerShapeFn getFramePointerShape;
    IOutputDuplication_MapDesktopSurfaceFn mapDesktopSurface;
    IOutputDuplication_UnMapDesktopSurfaceFn unMapDesktopSurface;
    IOutputDuplication_ReleaseFrameFn releaseFrame;
}

// Functions from IUnknown

fn Win32_HRESULT IOutputDuplication.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IOutputDuplication.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IOutputDuplication.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IOutputDuplication.setPrivateData(
    &self,
    Win32_GUID* name,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, name, dataSize, pData);

fn Win32_HRESULT IOutputDuplication.setPrivateDataInterface(
    &self,
    Win32_GUID* name,
    IUnknown* pUnknown
) @inline =>
    self.vtbl.setPrivateDataInterface(self, name, pUnknown);

fn Win32_HRESULT IOutputDuplication.getPrivateData(
    &self,
    Win32_GUID* name,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, name, pDataSize, pData);

fn Win32_HRESULT IOutputDuplication.getParent(
    &self,
    Win32_GUID* riid,
    void** ppParent
) @inline =>
    self.vtbl.getParent(self, riid, ppParent);

/// Functions of IOutputDuplication

fn void IOutputDuplication.getDesc(
    &self,
    OutduplDesc* pDesc
) @inline =>
    self.vtbl.getDesc(self, pDesc);

fn Win32_HRESULT IOutputDuplication.acquireNextFrame(
    &self,
    uint timeoutInMilliseconds,
    OutduplFrameInfo* pFrameInfo,
    IResource** ppDesktopResource
) @inline =>
    self.vtbl.acquireNextFrame(self, timeoutInMilliseconds, pFrameInfo, ppDesktopResource);

fn Win32_HRESULT IOutputDuplication.getFrameDirtyRects(
    &self,
    uint dirtyRectsBufferSize,
    Win32_RECT* pDirtyRectsBuffer,
    uint* pDirtyRectsBufferSizeRequired
) @inline =>
    self.vtbl.getFrameDirtyRects(self, dirtyRectsBufferSize, pDirtyRectsBuffer, pDirtyRectsBufferSizeRequired);

fn Win32_HRESULT IOutputDuplication.getFrameMoveRects(
    &self,
    uint moveRectsBufferSize,
    OutduplMoveRect* pMoveRectBuffer,
    uint* pMoveRectsBufferSizeRequired
) @inline =>
    self.vtbl.getFrameMoveRects(self, moveRectsBufferSize, pMoveRectBuffer, pMoveRectsBufferSizeRequired);

fn Win32_HRESULT IOutputDuplication.getFramePointerShape(
    &self,
    uint pointerShapeBufferSize,
    void* pPointerShapeBuffer,
    uint* pPointerShapeBufferSizeRequired,
    OutduplPointerShapeInfo* pPointerShapeInfo
) @inline =>
    self.vtbl.getFramePointerShape(
        self,
        pointerShapeBufferSize,
        pPointerShapeBuffer,
        pPointerShapeBufferSizeRequired,
        pPointerShapeInfo);

fn Win32_HRESULT IOutputDuplication.mapDesktopSurface(
    &self,
    MappedRect* pLockedRect
) @inline =>
    self.vtbl.mapDesktopSurface(self, pLockedRect);

fn Win32_HRESULT IOutputDuplication.unMapDesktopSurface(&self) @inline =>
    self.vtbl.unMapDesktopSurface(self);

fn Win32_HRESULT IOutputDuplication.releaseFrame(&self) @inline =>
    self.vtbl.releaseFrame(self);

enum AlphaMode :int
{
    UNSPECIFIED,
    PREMULTIPLIED,
    STRAIGHT,
    IGNORE,
}

enum OfferResourcePriority : int
{
    __UNUSED0,
    LOW,
    NORMAL,
    HIGH,
}

const SHARED_RESOURCE_READ  = 0x80000000L;
const SHARED_RESOURCE_WRITE = 1;

struct ModeDesc1
{
    uint width;
    uint height;
    Rational refreshRate;
    Format format;
    ModeScanlineOrder scanlineOrdering;
    ModeScaling scaling;
    Bool stereo;
}

enum Scaling : int
{
    STRETCH,
    NONE,
    ASPECT_RATIO_STRETCH,
}

struct SwapChainDesc1
{
    uint width;
    uint height;
    Format format;
    Bool stereo;
    SampleDesc sampleDesc;
    UsageFlags bufferUsage;
    uint bufferCount;
    Scaling scaling;
    SwapEffect swapEffect;
    AlphaMode alphaMode;
    SwapChainFlags flags;
}

struct SwapChainFullscreenDesc
{
    Rational refreshRate;
    ModeScanlineOrder scanlineOrdering;
    ModeScaling scaling;
    Bool windowed;
}

struct PresentParameters
{
    uint dirtyRectsCount;
    Win32_RECT* pDirtyRects;
    Win32_RECT* pScrollRect;
    Win32_POINT* pScrollOffset;
}

enum GraphicsPreemptionGranularity : int
{
    DMA_BUFFER_BOUNDARY,
    PRIMITIVE_BOUNDARY,
    TRIANGLE_BOUNDARY,
    PIXEL_BOUNDARY,
    INSTRUCTION_BOUNDARY,
}

enum ComputePreemptionGranularity : int
{
    DMA_BUFFER_BOUNDARY,
    DISPATCH_BOUNDARY,
    THREAD_GROUP_BOUNDARY,
    THREAD_BOUNDARY,
    INSTRUCTION_BOUNDARY,
}

struct AdapterDesc2
{
    Win32_WCHAR[128] description;
    uint vendorId;
    uint deviceId;
    uint subSysId;
    uint revision;
    Win32_SIZE_T dedicatedVideoMemory;
    Win32_SIZE_T dedicatedSystemMemory;
    Win32_SIZE_T sharedSystemMemory;
    Win32_LUID adapterLuid;
    AdapterFlags flags;
    GraphicsPreemptionGranularity graphicsPreemptionGranularity;
    ComputePreemptionGranularity computePreemptionGranularity;
}

bitstruct CreateFactoryFlags : uint
{
    bool debug     : 0;
    uint __unused0 : 1..31;
}

alias CreateFactory = CreateFactoryFlags;

extern fn Win32_HRESULT createDXGIFactory2(
    CreateFactoryFlags flags,
    Win32_GUID* riid,
    void** ppFactory
) @extern("CreateDXGIFactory2");


extern fn Win32_HRESULT getDebugInterface1(
    uint flags,
    Win32_GUID* riid,
    void** pDebug
) @extern("DXGIGetDebugInterface1");

struct Matrix3X2F
{
    float m11;
    float m12;
    float m21;
    float m22;
    float m31;
    float m32;
}

struct DecodeSwapChainDesc
{
    SwapChainFlags flags;
}

bitstruct MultiplaneOverlayYCbCrFlags : uint
{
    bool nominalRange : 0;
    bool bt709        : 1;
    bool xvYcc        : 2;
    uint __unused0    : 3..31;
}

alias MultiplaneOverlayYCbCr = MultiplaneOverlayYCbCrFlags;

// =============================================================================
// IDecodeSwapChain
// =============================================================================

const IDECODE_SWAP_CHAIN_UUID_STRING = "2633066b-4514-4c7a-8fd8-12ea98059d18";
const Win32_GUID IDECODE_SWAP_CHAIN_UUID = {
    0x2633066b, 0x4514, 0x4c7a, { 0x8f, 0xd8, 0x12, 0xea, 0x98, 0x05, 0x9d, 0x18 } };

struct IDecodeSwapChain
{
    IDecodeSwapChainVTable* vtbl;
}

alias IDecodeSwapChain_PresentBufferFn = fn Win32_HRESULT (
    void* self,
    uint bufferToPresent,
    uint syncInterval,
    PresentFlags flags);

alias IDecodeSwapChain_SetSourceRectFn = fn Win32_HRESULT (
    void* self,
    Win32_RECT* pRect);

alias IDecodeSwapChain_SetTargetRectFn = fn Win32_HRESULT (
    void* self,
    Win32_RECT* pRect);

alias IDecodeSwapChain_SetDestSizeFn = fn Win32_HRESULT (
    void* self,
    uint width,
    uint height);

alias IDecodeSwapChain_GetSourceRectFn = fn Win32_HRESULT (
    void* self,
    Win32_RECT* pRect);

alias IDecodeSwapChain_GetTargetRectFn = fn Win32_HRESULT (
    void* self,
    Win32_RECT* pRect);

alias IDecodeSwapChain_GetDestSizeFn = fn Win32_HRESULT (
    void* self,
    uint* pWidth,
    uint* pHeight);

alias IDecodeSwapChain_SetColorSpaceFn = fn Win32_HRESULT (
    void* self,
    MultiplaneOverlayYCbCrFlags colorSpace);

alias IDecodeSwapChain_GetColorSpaceFn = fn MultiplaneOverlayYCbCrFlags (void* self);

struct IDecodeSwapChainVTable
{
    inline IUnknownVTable _base;
    IDecodeSwapChain_PresentBufferFn presentBuffer;
    IDecodeSwapChain_SetSourceRectFn setSourceRect;
    IDecodeSwapChain_SetTargetRectFn setTargetRect;
    IDecodeSwapChain_SetDestSizeFn setDestSize;
    IDecodeSwapChain_GetSourceRectFn getSourceRect;
    IDecodeSwapChain_GetTargetRectFn getTargetRect;
    IDecodeSwapChain_GetDestSizeFn getDestSize;
    IDecodeSwapChain_SetColorSpaceFn setColorSpace;
    IDecodeSwapChain_GetColorSpaceFn getColorSpace;
}

// Functions from IUnknown

fn Win32_HRESULT IDecodeSwapChain.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDecodeSwapChain.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDecodeSwapChain.release(&self) @inline => self.vtbl.release(self);

// Functions of IDecodeSwapChain

fn Win32_HRESULT IDecodeSwapChain.presentBuffer(
    &self,
    uint bufferToPresent,
    uint syncInterval, PresentFlags flags
) @inline =>
    self.vtbl.presentBuffer(self, bufferToPresent, syncInterval, flags);

fn Win32_HRESULT IDecodeSwapChain.setSourceRect(
    &self,
    Win32_RECT* pRect
) @inline =>
    self.vtbl.setSourceRect(self, pRect);

fn Win32_HRESULT IDecodeSwapChain.setTargetRect(
    &self,
    Win32_RECT* pRect
) @inline =>
    self.vtbl.setTargetRect(self, pRect);

fn Win32_HRESULT IDecodeSwapChain.setDestSize(
    &self,
    uint width,
    uint height
) @inline =>
    self.vtbl.setDestSize(self,width, height);

fn Win32_HRESULT IDecodeSwapChain.getSourceRect(
    &self,
    Win32_RECT* pRect
) @inline =>
    self.vtbl.getSourceRect(self, pRect);

fn Win32_HRESULT IDecodeSwapChain.getTargetRect(
    &self,
    Win32_RECT* pRect
) @inline =>
    self.vtbl.getTargetRect(self, pRect);

fn Win32_HRESULT IDecodeSwapChain.getDestSize(
    &self,
    uint* pWidth,
    uint* pHeight
) @inline =>
    self.vtbl.getDestSize(self, pWidth, pHeight);

fn Win32_HRESULT IDecodeSwapChain.setColorSpace(
    &self,
    MultiplaneOverlayYCbCrFlags colorSpace
) @inline =>
    self.vtbl.setColorSpace(self, colorSpace);

fn MultiplaneOverlayYCbCrFlags IDecodeSwapChain.getColorSpace(&self) @inline =>
    self.vtbl.getColorSpace(self);

// =============================================================================
// IFactoryMedia
// =============================================================================

const IFACTORY_MEDIA_UUID_STRING = "41e7d1f2-a591-4f7b-a2e5-fa9c843e1c12";
const Win32_GUID IFACTORY_MEDIA_UUID = {
    0x41e7d1f2, 0xa591, 0x4f7b, { 0xa2, 0xe5, 0xfa, 0x9c, 0x84, 0x3e, 0x1c, 0x12 } };

struct IFactoryMedia
{
    IFactoryMediaVTable* vtbl;
}

alias IFactoryMedia_CreateSwapChainForCompositionSurfaceHandleFn = fn Win32_HRESULT (
    void* self,
    IUnknown* pDevice,
    Win32_HANDLE hSurface,
    SwapChainDesc1* pDesc,
    IOutput* pRestrictToOutput,
    ISwapChain1** ppSwapChain
);

alias IFactoryMedia_CreateDecodeSwapChainForCompositionSurfaceHandleFn = fn Win32_HRESULT (
    void* self,
    IUnknown* pDevice,
    Win32_HANDLE hSurface,
    DecodeSwapChainDesc* pDesc,
    IResource* pYuvDecodeBuffers,
    IOutput* pRestrictToOutput,
    IDecodeSwapChain** ppSwapChain
);

struct IFactoryMediaVTable
{
    inline IUnknownVTable _base;
    IFactoryMedia_CreateSwapChainForCompositionSurfaceHandleFn
        createSwapChainForCompositionSurfaceHandle;
    IFactoryMedia_CreateDecodeSwapChainForCompositionSurfaceHandleFn
        createDecodeSwapChainForCompositionSurfaceHandle;
}

// Functions from IUnknown

fn Win32_HRESULT IFactoryMedia.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IFactoryMedia.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IFactoryMedia.release(&self) @inline => self.vtbl.release(self);

// Functions of IFactoryMedia

fn Win32_HRESULT IFactoryMedia.createSwapChainForCompositionSurfaceHandle(
    &self,
    IUnknown* pDevice,
    Win32_HANDLE hSurface,
    SwapChainDesc1* pDesc,
    IOutput* pRestrictToOutput,
    ISwapChain1** ppSwapChain
) @inline =>
    self.vtbl.createSwapChainForCompositionSurfaceHandle(
        self,
        pDevice,
        hSurface,
        pDesc,
        pRestrictToOutput,
        ppSwapChain);

fn Win32_HRESULT IFactoryMedia.createDecodeSwapChainForCompositionSurfaceHandle(
    &self,
    IUnknown* pDevice,
    Win32_HANDLE hSurface,
    DecodeSwapChainDesc* pDesc,
    IResource* pYuvDecodeBuffers,
    IOutput* pRestrictToOutput,
    IDecodeSwapChain** ppSwapChain
) @inline =>
    self.vtbl.createDecodeSwapChainForCompositionSurfaceHandle(
        self,
        pDevice,
        hSurface,
        pDesc,
        pYuvDecodeBuffers,
        pRestrictToOutput,
        ppSwapChain);

enum FramePresentationMode : int
{
    COMPOSED,
    OVERLAY,
    NONE,
    COMPOSITION_FAILURE,
}

struct FrameStatisticsMedia
{
    uint presentCount;
    uint presentRefreshCount;
    uint syncRefreshCount;
    Win32_LARGE_INTEGER syncQPCTime;
    Win32_LARGE_INTEGER syncGPUTime;
    FramePresentationMode compositionMode;
    uint approvedPresentDuration;
}

// =============================================================================
// ISwapChainMedia
// =============================================================================

const ISWAP_CHAIN_MEDIA_UUID_STRING = "dd95b90b-f05f-4f6a-bd65-25bfb264bd84";
const Win32_GUID ISWAP_CHAIN_MEDIA_UUID = {
    0xdd95b90b, 0xf05f, 0x4f6a, { 0xbd, 0x65, 0x25, 0xbf, 0xb2, 0x64, 0xbd, 0x84 } };

struct ISwapChainMedia
{
    ISwapChainMediaVTable* vtbl;
}

alias ISwapChainMedia_GetFrameStatisticsMediaFn = fn Win32_HRESULT (
    void* self,
    FrameStatisticsMedia* pStats);

alias ISwapChainMedia_SetPresentDurationFn = fn Win32_HRESULT (
    void* self,
    uint duration);

alias ISwapChainMedia_CheckPresentDurationSupportFn = fn Win32_HRESULT (
    void* self,
    uint desiredPresentDuration,
    uint* pClosestSmallerPresentDuration,
    uint* pClosestLargerPresentDuration
);

struct ISwapChainMediaVTable
{
    inline IUnknownVTable _base;
    ISwapChainMedia_GetFrameStatisticsMediaFn getFrameStatisticsMedia;
    ISwapChainMedia_SetPresentDurationFn setPresentDuration;
    ISwapChainMedia_CheckPresentDurationSupportFn checkPresentDurationSupport;
}

// Functions from IUnknown

fn Win32_HRESULT ISwapChainMedia.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ISwapChainMedia.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ISwapChainMedia.release(&self) @inline => self.vtbl.release(self);

// Functions of ISwapChainMedia

fn Win32_HRESULT ISwapChainMedia.getFrameStatisticsMedia(
    &self,
    FrameStatisticsMedia* pStats
) @inline =>
    self.vtbl.getFrameStatisticsMedia(self, pStats);

fn Win32_HRESULT ISwapChainMedia.setPresentDuration(
    &self,
    uint duration
) @inline =>
    self.vtbl.setPresentDuration(self, duration);

fn Win32_HRESULT ISwapChainMedia.checkPresentDurationSupport(
    &self,
    uint desiredPresentDuration,
    uint* pClosestSmallerPresentDuration,
    uint* pClosestLargerPresentDuration
) @inline =>
    self.vtbl.checkPresentDurationSupport(
        self,
        desiredPresentDuration,
        pClosestSmallerPresentDuration,
        pClosestLargerPresentDuration);

bitstruct OverlaySupportFlags : uint
{
    bool direct    : 0;
    bool scaling   : 1;
    uint __unused0 : 2..31;
}

alias OverlaySupport = OverlaySupportFlags;

bitstruct SwapChainColorSpaceSupportFlags : uint
{
    bool present        : 0;
    bool overlayPresent : 1;
    uint __unused0      : 2..31;
}

alias SwapChainColorSpaceSupport = SwapChainColorSpaceSupportFlags;

bitstruct OverlayColorSpaceSupportFlags : uint
{
    bool present   : 0;
    uint __unused0 : 1..31;
}

alias OverlayColorSpaceSupport = OverlayColorSpaceSupportFlags;

enum MemorySegmentGroup : int
{
    LOCAL,
    NON_LOCAL,
}

struct QueryVideoMemoryInfo
{
    ulong budget;
    ulong currentUsage;
    ulong availableForReservation;
    ulong currentReservation;
}

enum OutduplFlag : int
{
    __UNUSED0,
    COMPOSITED_UI_CAPTURE_ONLY,
}

enum HdrMetadataType : int
{
    NONE,
    HDR10,
    HDR10PLUS,
}

struct HdrMetadataHdr10
{
    ushort[2] redPrimary;
    ushort[2] greenPrimary;
    ushort[2] bluePrimary;
    ushort[2] whitePoint;
    uint maxMasteringLuminance;
    uint minMasteringLuminance;
    ushort maxContentLightLevel;
    ushort maxFrameAverageLightLevel;
}

struct HdrMetadataHdr10Plus
{
    char[72] data;
}

bitstruct OfferResourceFlags : uint
{
    bool allowDecommit : 0;
    uint __unused0     : 1..31;
}

enum ReclaimResourceResults : int
{
    OK,
    DISCARDED,
    NOT_COMMITTED,
}

enum Feature : int
{
    PRESENT_ALLOW_TEARING,
}

extern fn Win32_HRESULT declareAdapterRemovalSupport()
    @extern("DXGIDeclareAdapterRemovalSupport");

bitstruct AdapterFlag3 : uint
{
    bool none                      : 0;
    bool remote                    : 1;
    bool software                  : 2;
    bool acgCompatible             : 3;
    bool supportMonitoredFences    : 4;
    bool supportNonMonitoredFences : 5;
    bool keyedMutexConformance     : 6;
    uint __unused0                 : 7..31;
}

struct AdapterDesc3
{
    Win32_WCHAR[128] description;
    uint vendorId;
    uint deviceId;
    uint subSysId;
    uint revision;
    Win32_SIZE_T dedicatedVideoMemory;
    Win32_SIZE_T dedicatedSystemMemory;
    Win32_SIZE_T sharedSystemMemory;
    Win32_LUID adapterLuid;
    AdapterFlag3 flags;
    GraphicsPreemptionGranularity graphicsPreemptionGranularity;
    ComputePreemptionGranularity computePreemptionGranularity;
}

struct OutputDesc1
{
    Win32_WCHAR[128] deviceName;
    Win32_RECT desktopCoordinates;
    Bool attachedToDesktop;
    ModeRotation rotation;
    Win32_HMONITOR monitor;
    uint bitsPerColor;
    ColorSpaceType colorSpace;
    float[2] redPrimary;
    float[2] greenPrimary;
    float[2] bluePrimary;
    float[2] whitePoint;
    float minLuminance;
    float maxLuminance;
    float maxFullFrameLuminance;
}

bitstruct HardwareCompositionSupportFlags : uint
{
    bool fullscreen      : 0;
    bool windowed        : 1;
    bool cursorStretched : 2;
    uint __unused0       : 3..31;
}

enum GpuPreference : int
{
    UNSPECIFIED,
    MINIMUM_POWER,
    HIGH_PERFORMANCE,
}

extern fn Win32_HRESULT disableVBlankVirtualization() @extern("DXGIDisableVBlankVirtualization");

const STATUS_OCCLUDED                     = 0x087A0001L;
const STATUS_CLIPPED                      = 0x087A0002L;
const STATUS_NO_REDIRECTION               = 0x087A0004L;
const STATUS_NO_DESKTOP_ACCESS            = 0x087A0005L;
const STATUS_GRAPHICS_VIDPN_SOURCE_IN_USE = 0x087A0006L;
const STATUS_MODE_CHANGED                 = 0x087A0007L;
const STATUS_MODE_CHANGE_IN_PROGRESS      = 0x087A0008L;
const ERROR_INVALID_CALL                  = 0x887A0001L;
const ERROR_NOT_FOUND                     = 0x887A0002L;
const ERROR_MORE_DATA                     = 0x887A0003L;
const ERROR_UNSUPPORTED                   = 0x887A0004L;
const ERROR_DEVICE_REMOVED                = 0x887A0005L;
const ERROR_DEVICE_HUNG                   = 0x887A0006L;
const ERROR_DEVICE_RESET                  = 0x887A0007L;
const ERROR_WAS_STILL_DRAWING             = 0x887A000AL;
const ERROR_FRAME_STATISTICS_DISJOINT     = 0x887A000BL;
const ERROR_GRAPHICS_VIDPN_SOURCE_IN_USE  = 0x887A000CL;
const ERROR_DRIVER_INTERNAL_ERROR         = 0x887A0020L;
const ERROR_NONEXCLUSIVE                  = 0x887A0021L;
const ERROR_NOT_CURRENTLY_AVAILABLE       = 0x887A0022L;
const ERROR_REMOTE_CLIENT_DISCONNECTED    = 0x887A0023L;
const ERROR_REMOTE_OUTOFMEMORY            = 0x887A0024L;
const ERROR_ACCESS_LOST                   = 0x887A0026L;
const ERROR_WAIT_TIMEOUT                  = 0x887A0027L;
const ERROR_SESSION_DISCONNECTED          = 0x887A0028L;
const ERROR_RESTRICT_TO_OUTPUT_STALE      = 0x887A0029L;
const ERROR_CANNOT_PROTECT_CONTENT        = 0x887A002AL;
const ERROR_ACCESS_DENIED                 = 0x887A002BL;
const ERROR_NAME_ALREADY_EXISTS           = 0x887A002CL;
const ERROR_SDK_COMPONENT_MISSING         = 0x887A002DL;
const ERROR_NOT_CURRENT                   = 0x887A002EL;
const ERROR_HW_PROTECTION_OUTOFMEMORY     = 0x887A0030L;
const ERROR_DYNAMIC_CODE_POLICY_VIOLATION = 0x887A0031L;
const ERROR_NON_COMPOSITED_UI             = 0x887A0032L;
const STATUS_UNOCCLUDED                   = 0x087A0009L;
const STATUS_DDA_WAS_STILL_DRAWING        = 0x087A000AL;
const ERROR_MODE_CHANGE_IN_PROGRESS       = 0x887A0025L;
const STATUS_PRESENT_REQUIRED             = 0x087A002FL;
const ERROR_CACHE_CORRUPT                 = 0x887A0033L;
const ERROR_CACHE_FULL                    = 0x887A0034L;
const ERROR_CACHE_HASH_COLLISION          = 0x887A0035L;
const ERROR_ALREADY_EXISTS                = 0x887A0036L;
const ERROR_MPO_UNPINNED                  = 0x887A0064L;
const ERROR_SETDISPLAYMODE_REQUIRED       = 0x887A0065L;
const DDI_ERR_WASSTILLDRAWING             = 0x887B0001L;
const DDI_ERR_UNSUPPORTED                 = 0x887B0002L;
const DDI_ERR_NONEXCLUSIVE                = 0x887B0003L;
