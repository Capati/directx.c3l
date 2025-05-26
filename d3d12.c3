module directx::d3d12;

import std::os::win32;
import directx::dxgi;
import directx::d3dc;

const INDEX_STRIP_CUT_VALUE_16BIT = ( 0xffff );
const INDEX_STRIP_CUT_VALUE_32BIT = ( 0xffffffff );
const INDEX_STRIP_CUT_VALUE_8BIT = ( 0xff );
const APPEND_ALIGNED_ELEMENT = ( 0xffffffff );
const ARRAY_AXIS_ADDRESS_RANGE_BIT_COUNT = ( 9 );
const CLIP_OR_CULL_DISTANCE_COUNT = ( 8 );
const CLIP_OR_CULL_DISTANCE_ELEMENT_COUNT = ( 2 );
const COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT = ( 14 );
const COMMONSHADER_CONSTANT_BUFFER_COMPONENTS = ( 4 );
const COMMONSHADER_CONSTANT_BUFFER_COMPONENT_BIT_COUNT = ( 32 );
const COMMONSHADER_CONSTANT_BUFFER_HW_SLOT_COUNT = ( 15 );
const COMMONSHADER_CONSTANT_BUFFER_PARTIAL_UPDATE_EXTENTS_BYTE_ALIGNMENT = ( 16 );
const COMMONSHADER_CONSTANT_BUFFER_REGISTER_COMPONENTS = ( 4 );
const COMMONSHADER_CONSTANT_BUFFER_REGISTER_COUNT = ( 15 );
const COMMONSHADER_CONSTANT_BUFFER_REGISTER_READS_PER_INST = ( 1 );
const COMMONSHADER_CONSTANT_BUFFER_REGISTER_READ_PORTS = ( 1 );
const COMMONSHADER_FLOWCONTROL_NESTING_LIMIT = ( 64 );
const COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COMPONENTS = ( 4 );
const COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COUNT = ( 1 );
const COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READS_PER_INST = ( 1 );
const COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READ_PORTS = ( 1 );
const COMMONSHADER_IMMEDIATE_VALUE_COMPONENT_BIT_COUNT = ( 32 );
const COMMONSHADER_INPUT_RESOURCE_REGISTER_COMPONENTS = ( 1 );
const COMMONSHADER_INPUT_RESOURCE_REGISTER_COUNT = ( 128 );
const COMMONSHADER_INPUT_RESOURCE_REGISTER_READS_PER_INST = ( 1 );
const COMMONSHADER_INPUT_RESOURCE_REGISTER_READ_PORTS = ( 1 );
const COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT = ( 128 );
const COMMONSHADER_SAMPLER_REGISTER_COMPONENTS = ( 1 );
const COMMONSHADER_SAMPLER_REGISTER_COUNT = ( 16 );
const COMMONSHADER_SAMPLER_REGISTER_READS_PER_INST = ( 1 );
const COMMONSHADER_SAMPLER_REGISTER_READ_PORTS = ( 1 );
const COMMONSHADER_SAMPLER_SLOT_COUNT = ( 16 );
const COMMONSHADER_SUBROUTINE_NESTING_LIMIT = ( 32 );
const COMMONSHADER_TEMP_REGISTER_COMPONENTS = ( 4 );
const COMMONSHADER_TEMP_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const COMMONSHADER_TEMP_REGISTER_COUNT = ( 4096 );
const COMMONSHADER_TEMP_REGISTER_READS_PER_INST = ( 3 );
const COMMONSHADER_TEMP_REGISTER_READ_PORTS = ( 3 );
const COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MAX = ( 10 );
const COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MIN = ( -10 );
const COMMONSHADER_TEXEL_OFFSET_MAX_NEGATIVE = ( -8 );
const COMMONSHADER_TEXEL_OFFSET_MAX_POSITIVE = ( 7 );
const CONSTANT_BUFFER_DATA_PLACEMENT_ALIGNMENT = ( 256 );
const CS_4_X_BUCKET00_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 256 );
const CS_4_X_BUCKET00_MAX_NUM_THREADS_PER_GROUP = ( 64 );
const CS_4_X_BUCKET01_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 240 );
const CS_4_X_BUCKET01_MAX_NUM_THREADS_PER_GROUP = ( 68 );
const CS_4_X_BUCKET02_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 224 );
const CS_4_X_BUCKET02_MAX_NUM_THREADS_PER_GROUP = ( 72 );
const CS_4_X_BUCKET03_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 208 );
const CS_4_X_BUCKET03_MAX_NUM_THREADS_PER_GROUP = ( 76 );
const CS_4_X_BUCKET04_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 192 );
const CS_4_X_BUCKET04_MAX_NUM_THREADS_PER_GROUP = ( 84 );
const CS_4_X_BUCKET05_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 176 );
const CS_4_X_BUCKET05_MAX_NUM_THREADS_PER_GROUP = ( 92 );
const CS_4_X_BUCKET06_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 160 );
const CS_4_X_BUCKET06_MAX_NUM_THREADS_PER_GROUP = ( 100 );
const CS_4_X_BUCKET07_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 144 );
const CS_4_X_BUCKET07_MAX_NUM_THREADS_PER_GROUP = ( 112 );
const CS_4_X_BUCKET08_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 128 );
const CS_4_X_BUCKET08_MAX_NUM_THREADS_PER_GROUP = ( 128 );
const CS_4_X_BUCKET09_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 112 );
const CS_4_X_BUCKET09_MAX_NUM_THREADS_PER_GROUP = ( 144 );
const CS_4_X_BUCKET10_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 96 );
const CS_4_X_BUCKET10_MAX_NUM_THREADS_PER_GROUP = ( 168 );
const CS_4_X_BUCKET11_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 80 );
const CS_4_X_BUCKET11_MAX_NUM_THREADS_PER_GROUP = ( 204 );
const CS_4_X_BUCKET12_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 64 );
const CS_4_X_BUCKET12_MAX_NUM_THREADS_PER_GROUP = ( 256 );
const CS_4_X_BUCKET13_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 48 );
const CS_4_X_BUCKET13_MAX_NUM_THREADS_PER_GROUP = ( 340 );
const CS_4_X_BUCKET14_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 32 );
const CS_4_X_BUCKET14_MAX_NUM_THREADS_PER_GROUP = ( 512 );
const CS_4_X_BUCKET15_MAX_BYTES_TGSM_WRITABLE_PER_THREAD = ( 16 );
const CS_4_X_BUCKET15_MAX_NUM_THREADS_PER_GROUP = ( 768 );
const CS_4_X_DISPATCH_MAX_THREAD_GROUPS_IN_Z_DIMENSION = ( 1 );
const CS_4_X_RAW_UAV_BYTE_ALIGNMENT = ( 256 );
const CS_4_X_THREAD_GROUP_MAX_THREADS_PER_GROUP = ( 768 );
const CS_4_X_THREAD_GROUP_MAX_X = ( 768 );
const CS_4_X_THREAD_GROUP_MAX_Y = ( 768 );
const CS_4_X_UAV_REGISTER_COUNT = ( 1 );
const CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION = ( 65535 );
const CS_TGSM_REGISTER_COUNT = ( 8192 );
const CS_TGSM_REGISTER_READS_PER_INST = ( 1 );
const CS_TGSM_RESOURCE_REGISTER_COMPONENTS = ( 1 );
const CS_TGSM_RESOURCE_REGISTER_READ_PORTS = ( 1 );
const CS_THREADGROUPID_REGISTER_COMPONENTS = ( 3 );
const CS_THREADGROUPID_REGISTER_COUNT = ( 1 );
const CS_THREADIDINGROUPFLATTENED_REGISTER_COMPONENTS = ( 1 );
const CS_THREADIDINGROUPFLATTENED_REGISTER_COUNT = ( 1 );
const CS_THREADIDINGROUP_REGISTER_COMPONENTS = ( 3 );
const CS_THREADIDINGROUP_REGISTER_COUNT = ( 1 );
const CS_THREADID_REGISTER_COMPONENTS = ( 3 );
const CS_THREADID_REGISTER_COUNT = ( 1 );
const CS_THREAD_GROUP_MAX_THREADS_PER_GROUP = ( 1024 );
const CS_THREAD_GROUP_MAX_X = ( 1024 );
const CS_THREAD_GROUP_MAX_Y = ( 1024 );
const CS_THREAD_GROUP_MAX_Z = ( 64 );
const CS_THREAD_GROUP_MIN_X = ( 1 );
const CS_THREAD_GROUP_MIN_Y = ( 1 );
const CS_THREAD_GROUP_MIN_Z = ( 1 );
const CS_THREAD_LOCAL_TEMP_REGISTER_POOL = ( 16384 );
const DEFAULT_BLEND_FACTOR_ALPHA = ( 1.0f );
const DEFAULT_BLEND_FACTOR_BLUE = ( 1.0f );
const DEFAULT_BLEND_FACTOR_GREEN = ( 1.0f );
const DEFAULT_BLEND_FACTOR_RED = ( 1.0f );
const DEFAULT_BORDER_COLOR_COMPONENT = ( 0.0f );
const DEFAULT_DEPTH_BIAS = ( 0 );
const DEFAULT_DEPTH_BIAS_CLAMP = ( 0.0f );
const DEFAULT_MAX_ANISOTROPY = ( 16 );
const DEFAULT_MIP_LOD_BIAS = ( 0.0f );
const DEFAULT_MSAA_RESOURCE_PLACEMENT_ALIGNMENT = ( 4194304 );
const DEFAULT_RENDER_TARGET_ARRAY_INDEX = ( 0 );
const DEFAULT_RESOURCE_PLACEMENT_ALIGNMENT = ( 65536 );
const DEFAULT_SAMPLE_MASK = ( 0xffffffff );
const DEFAULT_SCISSOR_ENDX = ( 0 );
const DEFAULT_SCISSOR_ENDY = ( 0 );
const DEFAULT_SCISSOR_STARTX = ( 0 );
const DEFAULT_SCISSOR_STARTY = ( 0 );
const DEFAULT_SLOPE_SCALED_DEPTH_BIAS = ( 0.0f );
const DEFAULT_STENCIL_READ_MASK = ( 0xff );
const DEFAULT_STENCIL_REFERENCE = ( 0 );
const DEFAULT_STENCIL_WRITE_MASK = ( 0xff );
const DEFAULT_VIEWPORT_AND_SCISSORRECT_INDEX = ( 0 );
const DEFAULT_VIEWPORT_HEIGHT = ( 0 );
const DEFAULT_VIEWPORT_MAX_DEPTH = ( 0.0f );
const DEFAULT_VIEWPORT_MIN_DEPTH = ( 0.0f );
const DEFAULT_VIEWPORT_TOPLEFTX = ( 0 );
const DEFAULT_VIEWPORT_TOPLEFTY = ( 0 );
const DEFAULT_VIEWPORT_WIDTH = ( 0 );
const DESCRIPTOR_RANGE_OFFSET_APPEND = ( 0xffffffff );
const DRIVER_RESERVED_REGISTER_SPACE_VALUES_END = ( 0xfffffff7 );
const DRIVER_RESERVED_REGISTER_SPACE_VALUES_START = ( 0xfffffff0 );
const DS_INPUT_CONTROL_POINTS_MAX_TOTAL_SCALARS = ( 3968 );
const DS_INPUT_CONTROL_POINT_REGISTER_COMPONENTS = ( 4 );
const DS_INPUT_CONTROL_POINT_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const DS_INPUT_CONTROL_POINT_REGISTER_COUNT = ( 32 );
const DS_INPUT_CONTROL_POINT_REGISTER_READS_PER_INST = ( 2 );
const DS_INPUT_CONTROL_POINT_REGISTER_READ_PORTS = ( 1 );
const DS_INPUT_DOMAIN_POINT_REGISTER_COMPONENTS = ( 3 );
const DS_INPUT_DOMAIN_POINT_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const DS_INPUT_DOMAIN_POINT_REGISTER_COUNT = ( 1 );
const DS_INPUT_DOMAIN_POINT_REGISTER_READS_PER_INST = ( 2 );
const DS_INPUT_DOMAIN_POINT_REGISTER_READ_PORTS = ( 1 );
const DS_INPUT_PATCH_CONSTANT_REGISTER_COMPONENTS = ( 4 );
const DS_INPUT_PATCH_CONSTANT_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const DS_INPUT_PATCH_CONSTANT_REGISTER_COUNT = ( 32 );
const DS_INPUT_PATCH_CONSTANT_REGISTER_READS_PER_INST = ( 2 );
const DS_INPUT_PATCH_CONSTANT_REGISTER_READ_PORTS = ( 1 );
const DS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENTS = ( 1 );
const DS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const DS_INPUT_PRIMITIVE_ID_REGISTER_COUNT = ( 1 );
const DS_INPUT_PRIMITIVE_ID_REGISTER_READS_PER_INST = ( 2 );
const DS_INPUT_PRIMITIVE_ID_REGISTER_READ_PORTS = ( 1 );
const DS_OUTPUT_REGISTER_COMPONENTS = ( 4 );
const DS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const DS_OUTPUT_REGISTER_COUNT = ( 32 );
const FLOAT16_FUSED_TOLERANCE_IN_ULP = ( 0.6 );
const FLOAT32_MAX = ( 3.402823466e+38f );
const FLOAT32_TO_INTEGER_TOLERANCE_IN_ULP = ( 0.6f );
const FLOAT_TO_SRGB_EXPONENT_DENOMINATOR = ( 2.4f );
const FLOAT_TO_SRGB_EXPONENT_NUMERATOR = ( 1.0f );
const FLOAT_TO_SRGB_OFFSET = ( 0.055f );
const FLOAT_TO_SRGB_SCALE_1 = ( 12.92f );
const FLOAT_TO_SRGB_SCALE_2 = ( 1.055f );
const FLOAT_TO_SRGB_THRESHOLD = ( 0.0031308f );
const FTOI_INSTRUCTION_MAX_INPUT = ( 2147483647.999f );
const FTOI_INSTRUCTION_MIN_INPUT = ( -2147483648.999f );
const FTOU_INSTRUCTION_MAX_INPUT = ( 4294967295.999f );
const FTOU_INSTRUCTION_MIN_INPUT = ( 0.0f );
const GS_INPUT_INSTANCE_ID_READS_PER_INST = ( 2 );
const GS_INPUT_INSTANCE_ID_READ_PORTS = ( 1 );
const GS_INPUT_INSTANCE_ID_REGISTER_COMPONENTS = ( 1 );
const GS_INPUT_INSTANCE_ID_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const GS_INPUT_INSTANCE_ID_REGISTER_COUNT = ( 1 );
const GS_INPUT_PRIM_CONST_REGISTER_COMPONENTS = ( 1 );
const GS_INPUT_PRIM_CONST_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const GS_INPUT_PRIM_CONST_REGISTER_COUNT = ( 1 );
const GS_INPUT_PRIM_CONST_REGISTER_READS_PER_INST = ( 2 );
const GS_INPUT_PRIM_CONST_REGISTER_READ_PORTS = ( 1 );
const GS_INPUT_REGISTER_COMPONENTS = ( 4 );
const GS_INPUT_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const GS_INPUT_REGISTER_COUNT = ( 32 );
const GS_INPUT_REGISTER_READS_PER_INST = ( 2 );
const GS_INPUT_REGISTER_READ_PORTS = ( 1 );
const GS_INPUT_REGISTER_VERTICES = ( 32 );
const GS_MAX_INSTANCE_COUNT = ( 32 );
const GS_MAX_OUTPUT_VERTEX_COUNT_ACROSS_INSTANCES = ( 1024 );
const GS_OUTPUT_ELEMENTS = ( 32 );
const GS_OUTPUT_REGISTER_COMPONENTS = ( 4 );
const GS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const GS_OUTPUT_REGISTER_COUNT = ( 32 );
const HS_CONTROL_POINT_PHASE_INPUT_REGISTER_COUNT = ( 32 );
const HS_CONTROL_POINT_PHASE_OUTPUT_REGISTER_COUNT = ( 32 );
const HS_CONTROL_POINT_REGISTER_COMPONENTS = ( 4 );
const HS_CONTROL_POINT_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const HS_CONTROL_POINT_REGISTER_READS_PER_INST = ( 2 );
const HS_CONTROL_POINT_REGISTER_READ_PORTS = ( 1 );
const HS_FORK_PHASE_INSTANCE_COUNT_UPPER_BOUND = ( 0xffffffff );
const HS_INPUT_FORK_INSTANCE_ID_REGISTER_COMPONENTS = ( 1 );
const HS_INPUT_FORK_INSTANCE_ID_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const HS_INPUT_FORK_INSTANCE_ID_REGISTER_COUNT = ( 1 );
const HS_INPUT_FORK_INSTANCE_ID_REGISTER_READS_PER_INST = ( 2 );
const HS_INPUT_FORK_INSTANCE_ID_REGISTER_READ_PORTS = ( 1 );
const HS_INPUT_JOIN_INSTANCE_ID_REGISTER_COMPONENTS = ( 1 );
const HS_INPUT_JOIN_INSTANCE_ID_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const HS_INPUT_JOIN_INSTANCE_ID_REGISTER_COUNT = ( 1 );
const HS_INPUT_JOIN_INSTANCE_ID_REGISTER_READS_PER_INST = ( 2 );
const HS_INPUT_JOIN_INSTANCE_ID_REGISTER_READ_PORTS = ( 1 );
const HS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENTS = ( 1 );
const HS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const HS_INPUT_PRIMITIVE_ID_REGISTER_COUNT = ( 1 );
const HS_INPUT_PRIMITIVE_ID_REGISTER_READS_PER_INST = ( 2 );
const HS_INPUT_PRIMITIVE_ID_REGISTER_READ_PORTS = ( 1 );
const HS_JOIN_PHASE_INSTANCE_COUNT_UPPER_BOUND = ( 0xffffffff );
const HS_MAXTESSFACTOR_LOWER_BOUND = ( 1.0f );
const HS_MAXTESSFACTOR_UPPER_BOUND = ( 64.0f );
const HS_OUTPUT_CONTROL_POINTS_MAX_TOTAL_SCALARS = ( 3968 );
const HS_OUTPUT_CONTROL_POINT_ID_REGISTER_COMPONENTS = ( 1 );
const HS_OUTPUT_CONTROL_POINT_ID_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const HS_OUTPUT_CONTROL_POINT_ID_REGISTER_COUNT = ( 1 );
const HS_OUTPUT_CONTROL_POINT_ID_REGISTER_READS_PER_INST = ( 2 );
const HS_OUTPUT_CONTROL_POINT_ID_REGISTER_READ_PORTS = ( 1 );
const HS_OUTPUT_PATCH_CONSTANT_REGISTER_COMPONENTS = ( 4 );
const HS_OUTPUT_PATCH_CONSTANT_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const HS_OUTPUT_PATCH_CONSTANT_REGISTER_COUNT = ( 32 );
const HS_OUTPUT_PATCH_CONSTANT_REGISTER_READS_PER_INST = ( 2 );
const HS_OUTPUT_PATCH_CONSTANT_REGISTER_READ_PORTS = ( 1 );
const HS_OUTPUT_PATCH_CONSTANT_REGISTER_SCALAR_COMPONENTS = ( 128 );
const IA_DEFAULT_INDEX_BUFFER_OFFSET_IN_BYTES = ( 0 );
const IA_DEFAULT_PRIMITIVE_TOPOLOGY = ( 0 );
const IA_DEFAULT_VERTEX_BUFFER_OFFSET_IN_BYTES = ( 0 );
const IA_INDEX_INPUT_RESOURCE_SLOT_COUNT = ( 1 );
const IA_INSTANCE_ID_BIT_COUNT = ( 32 );
const IA_INTEGER_ARITHMETIC_BIT_COUNT = ( 32 );
const IA_PATCH_MAX_CONTROL_POINT_COUNT = ( 32 );
const IA_PRIMITIVE_ID_BIT_COUNT = ( 32 );
const IA_VERTEX_ID_BIT_COUNT = ( 32 );
const IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT = ( 32 );
const IA_VERTEX_INPUT_STRUCTURE_ELEMENTS_COMPONENTS = ( 128 );
const IA_VERTEX_INPUT_STRUCTURE_ELEMENT_COUNT = ( 32 );
const INTEGER_DIVIDE_BY_ZERO_QUOTIENT = ( 0xffffffff );
const INTEGER_DIVIDE_BY_ZERO_REMAINDER = ( 0xffffffff );
const KEEP_RENDER_TARGETS_AND_DEPTH_STENCIL = ( 0xffffffff );
const KEEP_UNORDERED_ACCESS_VIEWS = ( 0xffffffff );
const LINEAR_GAMMA = ( 1.0f );
const MAJOR_VERSION = ( 12 );
const MAX_BORDER_COLOR_COMPONENT = ( 1.0f );
const MAX_DEPTH = ( 1.0f );
const MAX_LIVE_STATIC_SAMPLERS = ( 2032 );
const MAX_MAXANISOTROPY = ( 16 );
const MAX_MULTISAMPLE_SAMPLE_COUNT = ( 32 );
const MAX_POSITION_VALUE = ( 3.402823466e+34f );
const MAX_ROOT_COST = ( 64 );
const MAX_SHADER_VISIBLE_DESCRIPTOR_HEAP_SIZE_TIER_1 = ( 1000000 );
const MAX_SHADER_VISIBLE_DESCRIPTOR_HEAP_SIZE_TIER_2 = ( 1000000 );
const MAX_SHADER_VISIBLE_SAMPLER_HEAP_SIZE = ( 2048 );
const MAX_TEXTURE_DIMENSION_2_TO_EXP = ( 17 );
const MAX_VIEW_INSTANCE_COUNT = ( 4 );
const MINOR_VERSION = ( 0 );
const MIN_BORDER_COLOR_COMPONENT = ( 0.0f );
const MIN_DEPTH = ( 0.0f );
const MIN_MAXANISOTROPY = ( 0 );
const MIP_LOD_BIAS_MAX = ( 15.99f );
const MIP_LOD_BIAS_MIN = ( -16.0f );
const MIP_LOD_FRACTIONAL_BIT_COUNT = ( 8 );
const MIP_LOD_RANGE_BIT_COUNT = ( 8 );
const MULTISAMPLE_ANTIALIAS_LINE_WIDTH = ( 1.4f );
const NONSAMPLE_FETCH_OUT_OF_RANGE_ACCESS_RESULT = ( 0 );
const OS_RESERVED_REGISTER_SPACE_VALUES_END = ( 0xffffffff );
const OS_RESERVED_REGISTER_SPACE_VALUES_START = ( 0xfffffff8 );
const PACKED_TILE = ( 0xffffffff );
const PIXEL_ADDRESS_RANGE_BIT_COUNT = ( 15 );
const PREVIEW_SDK_VERSION = ( 716 );
const PRE_SCISSOR_PIXEL_ADDRESS_RANGE_BIT_COUNT = ( 16 );
const PS_CS_UAV_REGISTER_COMPONENTS = ( 1 );
const PS_CS_UAV_REGISTER_COUNT = ( 8 );
const PS_CS_UAV_REGISTER_READS_PER_INST = ( 1 );
const PS_CS_UAV_REGISTER_READ_PORTS = ( 1 );
const PS_FRONTFACING_DEFAULT_VALUE = ( 0xffffffff );
const PS_FRONTFACING_FALSE_VALUE = ( 0 );
const PS_FRONTFACING_TRUE_VALUE = ( 0xffffffff );
const PS_INPUT_REGISTER_COMPONENTS = ( 4 );
const PS_INPUT_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const PS_INPUT_REGISTER_COUNT = ( 32 );
const PS_INPUT_REGISTER_READS_PER_INST = ( 2 );
const PS_INPUT_REGISTER_READ_PORTS = ( 1 );
const PS_LEGACY_PIXEL_CENTER_FRACTIONAL_COMPONENT = ( 0.0f );
const PS_OUTPUT_DEPTH_REGISTER_COMPONENTS = ( 1 );
const PS_OUTPUT_DEPTH_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const PS_OUTPUT_DEPTH_REGISTER_COUNT = ( 1 );
const PS_OUTPUT_MASK_REGISTER_COMPONENTS = ( 1 );
const PS_OUTPUT_MASK_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const PS_OUTPUT_MASK_REGISTER_COUNT = ( 1 );
const PS_OUTPUT_REGISTER_COMPONENTS = ( 4 );
const PS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const PS_OUTPUT_REGISTER_COUNT = ( 8 );
const PS_PIXEL_CENTER_FRACTIONAL_COMPONENT = ( 0.5f );
const RAW_UAV_SRV_BYTE_ALIGNMENT = ( 16 );
const RAYTRACING_AABB_BYTE_ALIGNMENT = ( 8 );
const RAYTRACING_ACCELERATION_STRUCTURE_BYTE_ALIGNMENT = ( 256 );
const RAYTRACING_INSTANCE_DESCS_BYTE_ALIGNMENT = ( 16 );
const RAYTRACING_MAX_ATTRIBUTE_SIZE_IN_BYTES = ( 32 );
const RAYTRACING_MAX_DECLARABLE_TRACE_RECURSION_DEPTH = ( 31 );
const RAYTRACING_MAX_GEOMETRIES_PER_BOTTOM_LEVEL_ACCELERATION_STRUCTURE = ( 16777216 );
const RAYTRACING_MAX_INSTANCES_PER_TOP_LEVEL_ACCELERATION_STRUCTURE = ( 16777216 );
const RAYTRACING_MAX_PRIMITIVES_PER_BOTTOM_LEVEL_ACCELERATION_STRUCTURE = ( 536870912 );
const RAYTRACING_MAX_RAY_GENERATION_SHADER_THREADS = ( 1073741824 );
const RAYTRACING_MAX_SHADER_RECORD_STRIDE = ( 4096 );
const RAYTRACING_SHADER_RECORD_BYTE_ALIGNMENT = ( 32 );
const RAYTRACING_SHADER_TABLE_BYTE_ALIGNMENT = ( 64 );
const RAYTRACING_TRANSFORM3X4_BYTE_ALIGNMENT = ( 16 );
const REQ_BLEND_OBJECT_COUNT_PER_DEVICE = ( 4096 );
const REQ_BUFFER_RESOURCE_TEXEL_COUNT_2_TO_EXP = ( 27 );
const REQ_CONSTANT_BUFFER_ELEMENT_COUNT = ( 4096 );
const REQ_DEPTH_STENCIL_OBJECT_COUNT_PER_DEVICE = ( 4096 );
const REQ_DRAWINDEXED_INDEX_COUNT_2_TO_EXP = ( 32 );
const REQ_DRAW_VERTEX_COUNT_2_TO_EXP = ( 32 );
const REQ_FILTERING_HW_ADDRESSABLE_RESOURCE_DIMENSION = ( 16384 );
const REQ_GS_INVOCATION_32BIT_OUTPUT_COMPONENT_LIMIT = ( 1024 );
const REQ_IMMEDIATE_CONSTANT_BUFFER_ELEMENT_COUNT = ( 4096 );
const REQ_MAXANISOTROPY = ( 16 );
const REQ_MIP_LEVELS = ( 15 );
const REQ_MULTI_ELEMENT_STRUCTURE_SIZE_IN_BYTES = ( 2048 );
const REQ_RASTERIZER_OBJECT_COUNT_PER_DEVICE = ( 4096 );
const REQ_RENDER_TO_BUFFER_WINDOW_WIDTH = ( 16384 );
const REQ_RESOURCE_SIZE_IN_MEGABYTES_EXPRESSION_A_TERM = ( 128 );
const REQ_RESOURCE_SIZE_IN_MEGABYTES_EXPRESSION_B_TERM = ( 0.25f );
const REQ_RESOURCE_SIZE_IN_MEGABYTES_EXPRESSION_C_TERM = ( 2048 );
const REQ_RESOURCE_VIEW_COUNT_PER_DEVICE_2_TO_EXP = ( 20 );
const REQ_SAMPLER_OBJECT_COUNT_PER_DEVICE = ( 4096 );
const REQ_SUBRESOURCES = ( 30720 );
const REQ_TEXTURE1D_ARRAY_AXIS_DIMENSION = ( 2048 );
const REQ_TEXTURE1D_U_DIMENSION = ( 16384 );
const REQ_TEXTURE2D_ARRAY_AXIS_DIMENSION = ( 2048 );
const REQ_TEXTURE2D_U_OR_V_DIMENSION = ( 16384 );
const REQ_TEXTURE3D_U_V_OR_W_DIMENSION = ( 2048 );
const REQ_TEXTURECUBE_DIMENSION = ( 16384 );
const RESINFO_INSTRUCTION_MISSING_COMPONENT_RETVAL = ( 0 );
const RESOURCE_BARRIER_ALL_SUBRESOURCES = ( 0xffffffff );
const RS_SET_SHADING_RATE_COMBINER_COUNT = ( 2 );
const SDK_VERSION = ( 615 );
const SHADER_IDENTIFIER_SIZE_IN_BYTES = ( 32 );
const SHADER_MAJOR_VERSION = ( 5 );
const SHADER_MAX_INSTANCES = ( 65535 );
const SHADER_MAX_INTERFACES = ( 253 );
const SHADER_MAX_INTERFACE_CALL_SITES = ( 4096 );
const SHADER_MAX_TYPES = ( 65535 );
const SHADER_MINOR_VERSION = ( 1 );
const SHIFT_INSTRUCTION_PAD_VALUE = ( 0 );
const SHIFT_INSTRUCTION_SHIFT_VALUE_BIT_COUNT = ( 5 );
const SIMULTANEOUS_RENDER_TARGET_COUNT = ( 8 );
const SMALL_MSAA_RESOURCE_PLACEMENT_ALIGNMENT = ( 65536 );
const SMALL_RESOURCE_PLACEMENT_ALIGNMENT = ( 4096 );
const SO_BUFFER_MAX_STRIDE_IN_BYTES = ( 2048 );
const SO_BUFFER_MAX_WRITE_WINDOW_IN_BYTES = ( 512 );
const SO_BUFFER_SLOT_COUNT = ( 4 );
const SO_DDI_REGISTER_INDEX_DENOTING_GAP = ( 0xffffffff );
const SO_NO_RASTERIZED_STREAM = ( 0xffffffff );
const SO_OUTPUT_COMPONENT_COUNT = ( 128 );
const SO_STREAM_COUNT = ( 4 );
const SPEC_DATE_DAY = ( 14 );
const SPEC_DATE_MONTH = ( 11 );
const SPEC_DATE_YEAR = ( 2014 );
const SPEC_VERSION = ( 1.16 );
const SRGB_GAMMA = ( 2.2f );
const SRGB_TO_FLOAT_DENOMINATOR_1 = ( 12.92f );
const SRGB_TO_FLOAT_DENOMINATOR_2 = ( 1.055f );
const SRGB_TO_FLOAT_EXPONENT = ( 2.4f );
const SRGB_TO_FLOAT_OFFSET = ( 0.055f );
const SRGB_TO_FLOAT_THRESHOLD = ( 0.04045f );
const SRGB_TO_FLOAT_TOLERANCE_IN_ULP = ( 0.5f );
const STANDARD_COMPONENT_BIT_COUNT = ( 32 );
const STANDARD_COMPONENT_BIT_COUNT_DOUBLED = ( 64 );
const STANDARD_MAXIMUM_ELEMENT_ALIGNMENT_BYTE_MULTIPLE = ( 4 );
const STANDARD_PIXEL_COMPONENT_COUNT = ( 128 );
const STANDARD_PIXEL_ELEMENT_COUNT = ( 32 );
const STANDARD_VECTOR_SIZE = ( 4 );
const STANDARD_VERTEX_ELEMENT_COUNT = ( 32 );
const STANDARD_VERTEX_TOTAL_COMPONENT_COUNT = ( 64 );
const SUBPIXEL_FRACTIONAL_BIT_COUNT = ( 8 );
const SUBTEXEL_FRACTIONAL_BIT_COUNT = ( 8 );
const SYSTEM_RESERVED_REGISTER_SPACE_VALUES_END = ( 0xffffffff );
const SYSTEM_RESERVED_REGISTER_SPACE_VALUES_START = ( 0xfffffff0 );
const TESSELLATOR_MAX_EVEN_TESSELLATION_FACTOR = ( 64 );
const TESSELLATOR_MAX_ISOLINE_DENSITY_TESSELLATION_FACTOR = ( 64 );
const TESSELLATOR_MAX_ODD_TESSELLATION_FACTOR = ( 63 );
const TESSELLATOR_MAX_TESSELLATION_FACTOR = ( 64 );
const TESSELLATOR_MIN_EVEN_TESSELLATION_FACTOR = ( 2 );
const TESSELLATOR_MIN_ISOLINE_DENSITY_TESSELLATION_FACTOR = ( 1 );
const TESSELLATOR_MIN_ODD_TESSELLATION_FACTOR = ( 1 );
const TEXEL_ADDRESS_RANGE_BIT_COUNT = ( 16 );
const TEXTURE_DATA_PITCH_ALIGNMENT = ( 256 );
const TEXTURE_DATA_PLACEMENT_ALIGNMENT = ( 512 );
const TILED_RESOURCE_TILE_SIZE_IN_BYTES = ( 65536 );
const TRACKED_WORKLOAD_MAX_INSTANCES = ( 32 );
const UAV_COUNTER_PLACEMENT_ALIGNMENT = ( 4096 );
const UAV_SLOT_COUNT = ( 64 );
const UNBOUND_MEMORY_ACCESS_RESULT = ( 0 );
const VIDEO_DECODE_MAX_ARGUMENTS = ( 10 );
const VIDEO_DECODE_MAX_HISTOGRAM_COMPONENTS = ( 4 );
const VIDEO_DECODE_MIN_BITSTREAM_OFFSET_ALIGNMENT = ( 256 );
const VIDEO_DECODE_MIN_HISTOGRAM_OFFSET_ALIGNMENT = ( 256 );
const VIDEO_DECODE_STATUS_MACROBLOCKS_AFFECTED_UNKNOWN = ( 0xffffffff );
const VIDEO_ENCODER_AV1_INVALID_DPB_RESOURCE_INDEX = ( 0xff );
const VIDEO_ENCODER_AV1_MAX_TILE_COLS = ( 64 );
const VIDEO_ENCODER_AV1_MAX_TILE_ROWS = ( 64 );
const VIDEO_ENCODER_AV1_SUPERRES_DENOM_MIN = ( 9 );
const VIDEO_ENCODER_AV1_SUPERRES_NUM = ( 8 );
const VIDEO_PROCESS_MAX_FILTERS = ( 32 );
const VIDEO_PROCESS_STEREO_VIEWS = ( 2 );
const VIEWPORT_AND_SCISSORRECT_MAX_INDEX = ( 15 );
const VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE = ( 16 );
const VIEWPORT_BOUNDS_MAX = ( 32767 );
const VIEWPORT_BOUNDS_MIN = ( -32768 );
const VS_INPUT_REGISTER_COMPONENTS = ( 4 );
const VS_INPUT_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const VS_INPUT_REGISTER_COUNT = ( 32 );
const VS_INPUT_REGISTER_READS_PER_INST = ( 2 );
const VS_INPUT_REGISTER_READ_PORTS = ( 1 );
const VS_OUTPUT_REGISTER_COMPONENTS = ( 4 );
const VS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT = ( 32 );
const VS_OUTPUT_REGISTER_COUNT = ( 32 );
const WHQL_CONTEXT_COUNT_FOR_RESOURCE_LIMIT = ( 10 );
const WHQL_DRAWINDEXED_INDEX_COUNT_2_TO_EXP = ( 25 );
const WHQL_DRAW_VERTEX_COUNT_2_TO_EXP = ( 25 );
const WORK_GRAPHS_BACKING_MEMORY_ALIGNMENT_IN_BYTES = ( 8 );
const WORK_GRAPHS_MAX_NODE_DEPTH = ( 32 );

alias GpuVirtualAddress = ulong;

enum CommandListType : int
{
    DIRECT,
    BUNDLE,
    COMPUTE,
    COPY,
    VIDEO_DECODE,
    VIDEO_PROCESS,
    VIDEO_ENCODE,
}

bitstruct CommandQueueFlags : uint
{
    bool disableGpuTimeout : 0;
    uint __unused0         : 1..31;
}

const CommandQueueFlags COMMAND_QUEUE_FLAGS_NONE = {};

typedef CommandQueuePriority = int;
const CommandQueuePriority COMMAND_QUEUE_PRIORITY_NORMAL          = 0;
const CommandQueuePriority COMMAND_QUEUE_PRIORITY_HIGH            = 100;
const CommandQueuePriority COMMAND_QUEUE_PRIORITY_GLOBAL_REALTIME = 10000;

struct CommandQueueDesc
{
    CommandListType type;
    CommandQueuePriority priority;
    CommandQueueFlags flags;
    uint nodeMask;
}

enum PrimitiveTopologyType : int
{
    UNDEFINED,
    POINT,
    LINE,
    TRIANGLE,
    PATCH,
}

enum InputClassification : int
{
    PER_VERTEX_DATA,
    PER_INSTANCE_DATA,
}

struct InputElementDesc
{
    ZString semanticName;
    uint semanticIndex;
    Format format;
    uint inputSlot;
    uint alignedByteOffset;
    InputClassification inputSlotClass;
    uint instanceDataStepRate;
}

enum FillMode : int
{
    __UNUSED0,
    __UNUSED1,
    WIREFRAME,
    SOLID,
}

enum CullMode : int
{
    __UNUSED0,
    NONE,
    FRONT,
    BACK,
}

struct SoDeclarationEntry
{
    uint stream;
    ZString semanticName;
    uint semanticIndex;
    char startComponent;
    char componentCount;
    char outputSlot;
}

struct Viewport
{
    float topLeftX;
    float topLeftY;
    float width;
    float height;
    float minDepth;
    float maxDepth;
}

struct Box
{
    uint left;
    uint top;
    uint front;
    uint right;
    uint bottom;
    uint back;
}

enum ComparisonFunc : int
{
    NONE,
    NEVER,
    LESS,
    EQUAL,
    LESS_EQUAL,
    GREATER,
    NOT_EQUAL,
    GREATER_EQUAL,
    ALWAYS,
}

enum DepthWriteMask : int
{
    ZERO,
    ALL,
}

enum StencilOp : int
{
    KEEP,
    ZERO,
    REPLACE,
    INCR_SAT,
    DECR_SAT,
    INVERT,
    INCR,
    DECR,
}

struct DepthStencilopDesc
{
    StencilOp stencilFailOp;
    StencilOp stencilDepthFailOp;
    StencilOp stencilPassOp;
    ComparisonFunc stencilFunc;
}

struct DepthStencilDesc
{
    Bool depthEnable;
    DepthWriteMask depthWriteMask;
    ComparisonFunc depthFunc;
    Bool stencilEnable;
    char stencilReadMask;
    char stencilWriteMask;
    DepthStencilopDesc frontFace;
    DepthStencilopDesc backFace;
}

struct DepthStencilDesc1
{
    Bool depthEnable;
    DepthWriteMask depthWriteMask;
    ComparisonFunc depthFunc;
    Bool stencilEnable;
    char stencilReadMask;
    char stencilWriteMask;
    DepthStencilopDesc frontFace;
    DepthStencilopDesc backFace;
    Bool depthBoundsTestEnable;
}

struct DepthStencilopDesc1
{
    StencilOp stencilFailOp;
    StencilOp stencilDepthFailOp;
    StencilOp stencilPassOp;
    ComparisonFunc stencilFunc;
    char stencilReadMask;
    char stencilWriteMask;
}

struct DepthStencilDesc2
{
    Bool depthEnable;
    DepthWriteMask depthWriteMask;
    ComparisonFunc depthFunc;
    Bool stencilEnable;
    DepthStencilopDesc1 frontFace;
    DepthStencilopDesc1 backFace;
    Bool depthBoundsTestEnable;
}

enum Blend : int
{
    __UNUSED0,
    ZERO,
    ONE,
    SRC_COLOR,
    INV_SRC_COLOR,
    SRC_ALPHA,
    INV_SRC_ALPHA,
    DEST_ALPHA,
    INV_DEST_ALPHA,
    DEST_COLOR,
    INV_DEST_COLOR,
    SRC_ALPHA_SAT,
    __UNUSED1,
    __UNUSED2,
    BLEND_FACTOR,
    INV_BLEND_FACTOR,
    SRC1_COLOR,
    INV_SRC1_COLOR,
    SRC1_ALPHA,
    INV_SRC1_ALPHA,
    ALPHA_FACTOR,
    INV_ALPHA_FACTOR,
}

enum BlendOp : int
{
    __UNUSED0,
    ADD,
    SUBTRACT,
    REV_SUBTRACT,
    MIN,
    MAX,
}

bitstruct ColorWriteEnable : char
{
    bool red       : 0;
    bool green     : 1;
    bool blue      : 2;
    bool alpha     : 3;
    char __unused0 : 4..7;
}

const ColorWriteEnable COLOR_WRITE_ENABLE_RED   = { .red };
const ColorWriteEnable COLOR_WRITE_ENABLE_GREEN = { .green };
const ColorWriteEnable COLOR_WRITE_ENABLE_BLUE  = { .blue };
const ColorWriteEnable COLOR_WRITE_ENABLE_ALPHA = { .alpha };
const ColorWriteEnable COLOR_WRITE_ENABLE_ALL   = { .red, .green, .blue, .alpha };

enum LogicOp : int
{
    CLEAR,
    SET,
    COPY,
    COPY_INVERTED,
    NOOP,
    INVERT,
    AND,
    NAND,
    OR,
    NOR,
    XOR,
    EQUIV,
    AND_REVERSE,
    AND_INVERTED,
    OR_REVERSE,
    OR_INVERTED,
}

struct RenderTargetBlendDesc
{
    Bool blendEnable;
    Bool logicOpEnable;
    Blend srcBlend;
    Blend destBlend;
    BlendOp blendOp;
    Blend srcBlendAlpha;
    Blend destBlendAlpha;
    BlendOp blendOpAlpha;
    LogicOp logicOp;
    ColorWriteEnable renderTargetWriteMask;
}

struct BlendDesc
{
    Bool alphaToCoverageEnable;
    Bool independentBlendEnable;
    RenderTargetBlendDesc[8] renderTarget;
}

enum ConservativeRasterizationMode : int
{
    OFF,
    ON,
}

struct RasterizerDesc
{
    FillMode fillMode;
    CullMode cullMode;
    Bool frontCounterClockwise;
    Win32_INT depthBias;
    float depthBiasClamp;
    float slopeScaledDepthBias;
    Bool depthClipEnable;
    Bool multisampleEnable;
    Bool antialiasedLineEnable;
    uint forcedSampleCount;
    ConservativeRasterizationMode conservativeRaster;
}

struct RasterizerDesc1
{
    FillMode fillMode;
    CullMode cullMode;
    Bool frontCounterClockwise;
    float depthBias;
    float depthBiasClamp;
    float slopeScaledDepthBias;
    Bool depthClipEnable;
    Bool multisampleEnable;
    Bool antialiasedLineEnable;
    uint forcedSampleCount;
    ConservativeRasterizationMode conservativeRaster;
}

enum LineRasterizationMode : int
{
    ALIASED,
    ALPHA_ANTIALIASED,
    QUADRILATERAL_WIDE,
    QUADRILATERAL_NARROW,
}

struct RasterizerDesc2
{
    FillMode fillMode;
    CullMode cullMode;
    Bool frontCounterClockwise;
    float depthBias;
    float depthBiasClamp;
    float slopeScaledDepthBias;
    Bool depthClipEnable;
    LineRasterizationMode lineRasterizationMode;
    uint forcedSampleCount;
    ConservativeRasterizationMode conservativeRaster;
}

// =============================================================================
// IObject
// =============================================================================

const IOBJECT_UUID_STRING = "c4fec28f-7966-4e95-9f94-f431cb56c3b8";
const Win32_GUID IOBJECT_UUID = {
    .data1 = 0xc4fec28f, .data2 = 0x7966, .data3 = 0x4e95,
    .data4 = { 0x9f, 0x94, 0xf4, 0x31, 0xcb, 0x56, 0xc3, 0xb8 }
};

struct IObject
{
    IObjectVTable* vtbl;
}

alias IObject_GetPrivateDataFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData);

alias IObject_SetPrivateDataFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData);

alias IObject_SetPrivateDataInterfaceFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* guid,
    IUnknown* pData);

alias IObject_SetNameFn = fn Win32_HRESULT (
    void* self,
    Win32_LPCWSTR name);

struct IObjectVTable
{
    inline IUnknownVTable _base;
    IObject_GetPrivateDataFn getPrivateData;
    IObject_SetPrivateDataFn setPrivateData;
    IObject_SetPrivateDataInterfaceFn setPrivateDataInterface;
    IObject_SetNameFn setName;
}

// Functions of IUnknown

fn Win32_HRESULT IObject.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IObject.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IObject.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IObject.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IObject.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IObject.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IObject.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// =============================================================================
// IDeviceChild
// =============================================================================

const IDEVICE_CHILD_UUID_STRING = "905db94b-a00c-4140-9df5-2b64ca9ea357";
const Win32_GUID IDEVICE_CHILD_UUID = {
    .data1 = 0x905db94b, .data1 = 0xa00c, .data1 = 0x4140,
    .data4 = { 0x9d, 0xf5, 0x2b, 0x64, 0xca, 0x9e, 0xa3, 0x57 }
};

struct IDeviceChild
{
    IDeviceChildVTable* vtbl;
}

alias IDeviceChild_GetDeviceFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* riid,
    void** ppvDevice);

struct IDeviceChildVTable
{
    inline IObjectVTable _base;
    IDeviceChild_GetDeviceFn getDevice;
}

// Functions of IUnknown

fn Win32_HRESULT IDeviceChild.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDeviceChild.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDeviceChild.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IDeviceChild.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IDeviceChild.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IDeviceChild.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IDeviceChild.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IDeviceChild.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// =============================================================================
// IRootSignature
// =============================================================================

const IROOT_SIGNATURE_UUID_STRING = "c54a6b66-72df-4ee8-8be5-a946a1429214";
const Win32_GUID IROOT_SIGNATURE_UUID = {
    .data1 = 0xc54a6b66, .data2 = 0x72df, .data3 = 0x4ee8,
    .data4 = { 0x8b, 0xe5, 0xa9, 0x46, 0xa1, 0x42, 0x92, 0x14 }
};

struct IRootSignature
{
    IRootSignatureVTable* vtbl;
}

struct IRootSignatureVTable
{
    inline IDeviceChildVTable _base;
}

// Functions of IUnknown

fn Win32_HRESULT IRootSignature.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IRootSignature.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IRootSignature.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IRootSignature.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IRootSignature.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IRootSignature.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IRootSignature.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IRootSignature

fn Win32_HRESULT IRootSignature.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// ---

struct ShaderBytecode
{
    void* pShaderBytecode;
    Win32_SIZE_T bytecodeLength;
}

struct StreamOutputDesc
{
    SoDeclarationEntry* pSODeclaration;
    uint numEntries;
    uint* pBufferStrides;
    uint numStrides;
    uint rasterizedStream;
}

struct InputLayoutDesc
{
    InputElementDesc* pInputElementDescs;
    uint numElements;
}

enum IndexBufferStripCutValue : int
{
    DISABLED,
    VALUE_0XFFFF,
    VALUE_0XFFFFFFFF,
}

const STANDARD_MULTISAMPLE_PATTERN = 0xffffffff;
const CENTER_MULTISAMPLE_PATTERN   = 0xfffffffe;

struct CachedPipelineState
{
    void* pCachedBlob;
    Win32_SIZE_T cachedBlobSizeInBytes;
}

bitstruct PipelineStateFlags : uint
{
    bool none                       : 0;
    bool toolDebug                  : 1;
    bool dynamicDepthBias           : 2;
    bool dynamicIndexBufferStripCut : 3;
    uint __unused0                  : 4..31;
}

struct GraphicsPipelineStateDesc
 {
    IRootSignature* pRootSignature;
    ShaderBytecode vs;
    ShaderBytecode ps;
    ShaderBytecode ds;
    ShaderBytecode hs;
    ShaderBytecode gs;
    StreamOutputDesc streamOutput;
    BlendDesc blendState;
    uint sampleMask;
    RasterizerDesc rasterizerState;
    DepthStencilDesc depthStencilState;
    InputLayoutDesc inputLayout;
    IndexBufferStripCutValue iBStripCutValue;
    PrimitiveTopologyType primitiveTopologyType;
    uint numRenderTargets;
    Format[8] rTVFormats;
    Format dSVFormat;
    SampleDesc sampleDesc;
    uint nodeMask;
    CachedPipelineState cachedPSO;
    PipelineStateFlags flags;
 }

struct ComputePipelineStateDesc
{
    IRootSignature *pRootSignature;
    ShaderBytecode cS;
    uint nodeMask;
    CachedPipelineState cachedPSO;
    PipelineStateFlags flags;
}

struct RtFormatArray
{
    Format[8] rTFormats;
    uint numRenderTargets;
}

struct PipelineStateStreamDesc
{
    Win32_SIZE_T sizeInBytes;
    void* pPipelineStateSubobjectStream;
}

enum PipelineStateSubobjectType : int
{
    ROOT_SIGNATURE,
    VS,
    PS,
    DS,
    HS,
    GS,
    CS,
    STREAM_OUTPUT,
    BLEND,
    SAMPLE_MASK,
    RASTERIZER,
    DEPTH_STENCIL,
    INPUT_LAYOUT,
    IB_STRIP_CUT_VALUE,
    PRIMITIVE_TOPOLOGY,
    RENDER_TARGET_FORMATS,
    DEPTH_STENCIL_FORMAT,
    SAMPLE_DESC,
    NODE_MASK,
    CACHED_PSO,
    FLAGS,
    DEPTH_STENCIL1,
    VIEW_INSTANCING,
    __UNUSED0,
    AS,
    MS,
    DEPTH_STENCIL2,
    RASTERIZER1,
    RASTERIZER2,
    MAX_VALID,
}

enum Feature : int
{
    OPTIONS,
    ARCHITECTURE,
    FEATURE_LEVELS,
    FORMAT_SUPPORT,
    MULTISAMPLE_QUALITY_LEVELS,
    FORMAT_INFO,
    GPU_VIRTUAL_ADDRESS_SUPPORT,
    SHADER_MODEL,
    OPTIONS1,
    __UNUSED0,
    PROTECTED_RESOURCE_SESSION_SUPPORT,
    __UNUSED1,
    ROOT_SIGNATURE,
    __UNUSED2,
    __UNUSED3,
    __UNUSED4,
    ARCHITECTURE1,
    __UNUSED5,
    OPTIONS2,
    SHADER_CACHE,
    COMMAND_QUEUE_PRIORITY,
    OPTIONS3,
    EXISTING_HEAPS,
    OPTIONS4,
    SERIALIZATION,
    CROSS_NODE,
    __UNUSED6,
    OPTIONS5,
    DISPLAYABLE,
    __UNUSED7,
    OPTIONS6,
    QUERY_META_COMMAND,
    OPTIONS7,
    PROTECTED_RESOURCE_SESSION_TYPE_COUNT,
    PROTECTED_RESOURCE_SESSION_TYPES,
    __UNUSED8,
    OPTIONS8,
    OPTIONS9,
    __UNUSED9,
    OPTIONS10,
    OPTIONS11,
    OPTIONS12,
    OPTIONS13,
    OPTIONS14,
    OPTIONS15,
    OPTIONS16,
    OPTIONS17,
    OPTIONS18,
    OPTIONS19,
    OPTIONS20,
    PREDICATION,
    PLACED_RESOURCE_SUPPORT_INFO,
    HARDWARE_COPY,
    OPTIONS21,
    __UNUSED10,
    __UNUSED11,
    __UNUSED12,
    BYTECODE_BYPASS_HASH_SUPPORTED,
}

enum ShaderMinPrecisionSupport : int
{
    NONE,
    BIT_10,
    BIT_16,
}

enum TiledResourcesTier : int
{
    NOT_SUPPORTED,
    TIER_1,
    TIER_2,
    TIER_3,
    TIER_4,
}

enum ResourceBindingTier : int
{
    __UNUSED0,
    TIER_1,
    TIER_2,
    TIER_3,
}

enum ConservativeRasterizationTier : int
{
    NOT_SUPPORTED,
    TIER_1,
    TIER_2,
    TIER_3,
}

bitstruct FormatSupport1 : uint
{
    bool buffer                   : 0;
    bool iaVertexBuffer           : 1;
    bool iaIndexBuffer            : 2;
    bool soBuffer                 : 3;
    bool texture1d                : 4;
    bool texture2d                : 5;
    bool texture3d                : 6;
    bool texturecube              : 7;
    bool shaderLoad               : 8;
    bool shaderSample             : 9;
    bool shaderSampleComparison   : 10;
    bool shaderSampleMonoText     : 11;
    bool mip                      : 12;
    uint __unused0                : 13..13;
    bool renderTarget             : 14;
    bool blendable                : 15;
    bool depthStencil             : 16;
    uint __unused1                : 17..17;
    bool multisampleResolve       : 18;
    bool display                  : 19;
    bool castWithinBitLayout      : 20;
    bool multisampleRendertarget  : 21;
    bool multisampleLoad          : 22;
    bool shaderGather             : 23;
    bool backBufferCast           : 24;
    bool typedUnorderedAccessView : 25;
    bool shaderGatherComparison   : 26;
    bool decoderOutput            : 27;
    bool videoProcessorOutput     : 28;
    bool videoProcessorInput      : 29;
    bool videoEncoder             : 30;
    uint __unused2                : 31..31;
}

bitstruct FormatSupport2 : uint
{
    bool uavAtomicAdd                           : 0;
    bool uavAtomicBitwiseOps                    : 1;
    bool uavAtomicCompareStoreOrCompareExchange : 2;
    bool uavAtomicExchange                      : 3;
    bool uavAtomicSignedMinOrMax                : 4;
    bool uavAtomicUnsignedMinOrMax              : 5;
    bool uavTypedLoad                           : 6;
    bool uavTypedStore                          : 7;
    bool outputMergerLogicOp                    : 8;
    bool tiled                                  : 9;
    uint __unused0                              : 10..13;
    bool multiplaneOverlay                      : 14;
    bool samplerFeedback                        : 15;
    uint __unused1                              : 16..31;
}

const FormatSupport2 FORMAT_SUPPORT2_NONE = {};

bitstruct MultisampleQualityLevelFlags : uint
{
    bool resource  : 0;
    uint __unused0 : 1..31;
}

const MultisampleQualityLevelFlags MULTISAMPLE_QUALITY_LEVEL_FLAGS_NONE = {};

enum CrossNodeSharingTier : int
{
    NOT_SUPPORTED,
    TIER_1_EMULATED,
    TIER_1,
    TIER_2,
    TIER_3,
}

enum ResourceHeapTier : int
{
    __UNUSED0,
    TIER_1,
    TIER_2,
}

enum ProgrammableSamplePositionsTier : int
{
    NOT_SUPPORTED,
    TIER_1,
    TIER_2,
}

enum ViewInstancingTier : int
{
    NOT_SUPPORTED,
    TIER_1,
    TIER_2,
    TIER_3,
}

enum WorkGraphsTier : int
{
    NOT_SUPPORTED,
    __UNUSED0,
    __UNUSED1,
    __UNUSED2,
    __UNUSED3,
    __UNUSED4,
    __UNUSED5,
    __UNUSED6,
    __UNUSED7,
    __UNUSED8,
    TIER_1_0,
}

struct FeatureDataOptions
{
    Bool doublePrecisionFloatShaderOps;
    Bool outputMergerLogicOp;
    ShaderMinPrecisionSupport minPrecisionSupport;
    TiledResourcesTier tiledResourcesTier;
    ResourceBindingTier resourceBindingTier;
    Bool pSSpecifiedStencilRefSupported;
    Bool typedUAVLoadAdditionalFormats;
    Bool rOVsSupported;
    ConservativeRasterizationTier conservativeRasterizationTier;
    uint maxGPUVirtualAddressBitsPerResource;
    Bool standardSwizzle64KBSupported;
    CrossNodeSharingTier crossNodeSharingTier;
    Bool crossAdapterRowMajorTextureSupported;
    Bool vPAndRTArrayIndexFromAnyShaderFeedingRasterizerSupportedWithoutGSEmulation;
    ResourceHeapTier resourceHeapTier;
}

struct FeatureDataOptions1
{
    Bool waveOps;
    uint waveLaneCountMin;
    uint waveLaneCountMax;
    uint totalLaneCount;
    Bool expandedComputeResourceStates;
    Bool int64ShaderOps;
}

struct FeatureDataOptions2
{
    Bool depthBoundsTestSupported;
    ProgrammableSamplePositionsTier programmableSamplePositionsTier;
}

enum RootSignatureVersion : int
{
    __UNUSED0,
    VERSION_1_0,
    VERSION_1_1,
    VERSION_1_2,
}

struct FeatureDataRootSignature
{
    RootSignatureVersion highestVersion;
}

struct FeatureDataArchitecture
{
    uint nodeIndex;
    Bool tileBasedRenderer;
    Bool uMA;
    Bool cacheCoherentUMA;
}

struct FeatureDataArchitecture1
{
    uint nodeIndex;
    Bool tileBasedRenderer;
    Bool uMA;
    Bool cacheCoherentUMA;
    Bool isolatedMMU;
}

struct FeatureDataFeatureLevels
{
    uint numFeatureLevels;
    FeatureLevel* pFeatureLevelsRequested;
    FeatureLevel maxSupportedFeatureLevel;
}

typedef ShaderModel = int;
const ShaderModel SHADER_MODEL_NONE    = 0;
const ShaderModel SHADER_MODEL_5_1     = 0x51;
const ShaderModel SHADER_MODEL_6_0     = 0x60;
const ShaderModel SHADER_MODEL_6_1     = 0x61;
const ShaderModel SHADER_MODEL_6_2     = 0x62;
const ShaderModel SHADER_MODEL_6_3     = 0x63;
const ShaderModel SHADER_MODEL_6_4     = 0x64;
const ShaderModel SHADER_MODEL_6_5     = 0x65;
const ShaderModel SHADER_MODEL_6_6     = 0x66;
const ShaderModel SHADER_MODEL_6_7     = 0x67;
const ShaderModel SHADER_MODEL_6_8     = 0x68;
const ShaderModel SHADER_MODEL_6_9     = 0x69;
const ShaderModel HIGHEST_SHADER_MODEL = SHADER_MODEL_6_9;

struct FeatureDataShaderModel
{
    ShaderModel highestShaderModel;
}

struct FeatureDataFormatSupport
{
    Format format;
    FormatSupport1 support1;
    FormatSupport2 support2;
}

struct FeatureDataMultisampleQualityLevels
{
    Format format;
    uint sampleCount;
    MultisampleQualityLevelFlags flags;
    uint numQualityLevels;
}

struct FeatureDataFormatInfo
{
    Format format;
    char planeCount;
}

struct FeatureDataGpuVirtualAddressSupport
{
    uint maxGPUVirtualAddressBitsPerResource;
    uint maxGPUVirtualAddressBitsPerProcess;
}

bitstruct ShaderCacheSupportFlags : uint
{
    bool singlePso            : 0;
    bool library              : 1;
    bool automaticInprocCache : 2;
    bool automaticDiskCache   : 3;
    bool driverManagedCache   : 4;
    bool shaderControlClear   : 5;
    bool shaderSessionDelete  : 6;
    uint __unused0            : 7..31;
}

const ShaderCacheSupportFlags SHADER_CACHE_SUPPORT_FLAGS_NONE = {};

struct FeatureDataShaderCache
{
    ShaderCacheSupportFlags supportFlags;
}

struct FeatureDataCommandQueuePriority
{
    CommandListType commandListType;
    uint priority;
    Bool priorityForTypeIsSupported;
}

bitstruct CommandListSupportFlags : uint
{
    bool direct       : 0;
    bool bundle       : 1;
    bool compute      : 2;
    bool copy         : 3;
    bool videoDecode  : 4;
    bool videoProcess : 5;
    bool videoEncode  : 6;
    uint __unused0    : 7..31;
}

const CommandListSupportFlags COMMAND_LIST_SUPPORT_FLAGS_NONE = {};

struct FeatureDataOptions3
{
    Bool copyQueueTimestampQueriesSupported;
    Bool castingFullyTypedFormatSupported;
    CommandListSupportFlags writeBufferImmediateSupportFlags;
    ViewInstancingTier viewInstancingTier;
    Bool barycentricsSupported;
}

struct FeatureDataExistingHeaps
{
    Bool supported;
}

enum SharedResourceCompatibilityTier : int
{
    TIER_0,
    TIER_1,
    TIER_2,
}

struct FeatureDataDisplayable
{
    Bool displayableTexture;
    SharedResourceCompatibilityTier sharedResourceCompatibilityTier;
}

struct FeatureDataOptions4
{
    Bool mSAA64KBAlignedTextureSupported;
    SharedResourceCompatibilityTier sharedResourceCompatibilityTier;
    Bool native16BitShaderOpsSupported;
}

enum HeapSerializationTier : int
{
    TIER_0,
    __UNUSED0,
    __UNUSED1,
    __UNUSED2,
    __UNUSED3,
    __UNUSED4,
    __UNUSED5,
    __UNUSED6,
    __UNUSED7,
    __UNUSED8,
    TIER_10,
}

struct FeatureDataSerialization
{
    uint nodeIndex;
    HeapSerializationTier heapSerializationTier;
}

struct FeatureDataCrossNode
{
    CrossNodeSharingTier sharingTier;
    Bool atomicShaderInstructions;
}

enum RenderPassTier : int
{
    TIER_0,
    TIER_1,
    TIER_2,
}

enum RaytracingTier : int
{
    NOT_SUPPORTED,
    __UNUSED0,
    __UNUSED1,
    __UNUSED2,
    __UNUSED3,
    __UNUSED4,
    __UNUSED5,
    __UNUSED6,
    __UNUSED7,
    __UNUSED8,
    TIER_10,
    TIER_11,
}

struct FeatureDataOptions5
{
    Bool sRVOnlyTiledResourceTier3;
    RenderPassTier renderPassesTier;
    RaytracingTier raytracingTier;
}

enum VariableShadingRateTier
{
    NOT_SUPPORTED,
    TIER_1,
    TIER_2,
}

struct FeatureDataOptions6
{
    Bool additionalShadingRatesSupported;
    Bool perPrimitiveShadingRateSupportedWithViewportIndexing;
    VariableShadingRateTier variableShadingRateTier;
    uint shadingRateImageTileSize;
    Bool backgroundProcessingSupported;
}

enum MeshShaderTier : int
{
    NOT_SUPPORTED,
    __UNUSED0,
    __UNUSED1,
    __UNUSED2,
    __UNUSED3,
    __UNUSED4,
    __UNUSED5,
    __UNUSED6,
    __UNUSED7,
    __UNUSED8,
    TIER_1,
}

typedef SamplerFeedbackTier = int;
const SamplerFeedbackTier SAMPLER_FEEDBACK_TIER_NOT_SUPPORTED = 0;
const SamplerFeedbackTier SAMPLER_FEEDBACK_TIER_0_9           = 90;
const SamplerFeedbackTier SAMPLER_FEEDBACK_TIER_1_0           = 100;

struct FeatureDataOptions7
{
    MeshShaderTier meshShaderTier;
    SamplerFeedbackTier samplerFeedbackTier;
}

struct FeatureDataQueryMetaCommand
{
    Win32_GUID commandId;
    uint nodeMask;
    void* pQueryInputData;
    Win32_SIZE_T queryInputDataSizeInBytes;
    void* pQueryOutputData;
    Win32_SIZE_T queryOutputDataSizeInBytes;
}

struct FeatureDataOptions8
{
    Bool unalignedBlockTexturesSupported;
}

enum WaveMmaTier : int
{
    NOT_SUPPORTED,
    __UNUSED0,
    __UNUSED1,
    __UNUSED2,
    __UNUSED3,
    __UNUSED4,
    __UNUSED5,
    __UNUSED6,
    __UNUSED7,
    __UNUSED8,
    TIER_10,
}

struct FeatureDataOptions9
{
    Bool meshShaderPipelineStatsSupported;
    Bool meshShaderSupportsFullRangeRenderTargetArrayIndex;
    Bool atomicInt64OnTypedResourceSupported;
    Bool atomicInt64OnGroupSharedSupported;
    Bool derivativesInMeshAndAmplificationShadersSupported;
    WaveMmaTier waveMMATier;
}

struct FeatureDataOptions10
{
    Bool variableRateShadingSumCombinerSupported;
    Bool meshShaderPerPrimitiveShadingRateSupported;
}

struct FeatureDataOptions11
{
    Bool atomicInt64OnDescriptorHeapResourceSupported;
}

enum TriState : int
{
    FALSE,
    TRUE,
}

struct FeatureDataOptions12
{
    TriState mSPrimitivesPipelineStatisticIncludesCulledPrimitives;
    Bool enhancedBarriersSupported;
    Bool relaxedFormatCastingSupported;
}

struct FeatureDataOptions13
{
    Bool unrestrictedBufferTextureCopyPitchSupported;
    Bool unrestrictedVertexElementAlignmentSupported;
    Bool invertedViewportHeightFlipsYSupported;
    Bool invertedViewportDepthFlipsZSupported;
    Bool textureCopyBetweenDimensionsSupported;
    Bool alphaBlendFactorSupported;
}

struct FeatureDataOptions14
{
    Bool advancedTextureOpsSupported;
    Bool writeableMSAATexturesSupported;
    Bool independentFrontAndBackStencilRefMaskSupported;
}

struct FeatureDataOptions15
{
    Bool triangleFanSupported;
    Bool dynamicIndexBufferStripCutSupported;
}

struct FeatureDataOptions16
{
    Bool dynamicDepthBiasSupported;
    Bool gPUUploadHeapSupported;
}

struct FeatureDataOptions17
{
    Bool nonNormalizedCoordinateSamplersSupported;
    Bool manualWriteTrackingResourceSupported;
}

struct FeatureDataOptions18
{
    Bool renderPassesValid;
}

struct FeatureDataOptions19
{
    Bool mismatchingOutputDimensionsSupported;
    uint supportedSampleCountsWithNoOutputs;
    Bool pointSamplingAddressesNeverRoundUp;
    Bool rasterizerDesc2Supported;
    Bool narrowQuadrilateralLinesSupported;
    Bool anisoFilterWithPointMipSupported;
    uint maxSamplerDescriptorHeapSize;
    uint maxSamplerDescriptorHeapSizeWithStaticSamplers;
    uint maxViewDescriptorHeapSize;
    Bool computeOnlyCustomHeapSupported;
}

enum RecreateAtTier : int
{
    NOT_SUPPORTED,
    TIER_1,
}

struct FeatureDataOptions20
{
    Bool computeOnlyWriteWatchSupported;
    RecreateAtTier recreateAtTier;
}

enum ExecuteIndirectTier : int
{
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
    TIER_1_0,
    TIER_1_1,
}

struct FeatureDataOptions21
{
    WorkGraphsTier workGraphsTier;
    ExecuteIndirectTier executeIndirectTier;
    Bool sampleCmpGradientAndBiasSupported;
    Bool extendedCommandInfoSupported;
}

struct FeatureDataPredication
{
    Bool supported;
}

struct FeatureDataHardwareCopy
{
    Bool supported;
}

struct FeatureDataBytecodeBypassHashSupported
{
    Bool supported;
}

struct ResourceAllocationInfo
{
    ulong sizeInBytes;
    ulong alignment;
}

struct ResourceAllocationInfo1
{
    ulong offset;
    ulong alignment;
    ulong sizeInBytes;
}

enum HeapType : int
{
    __UNUSED0,
    DEFAULT,
    UPLOAD,
    READBACK,
    CUSTOM,
    GPU_UPLOAD,
}

enum CpuPageProperty : int
{
    UNKNOWN,
    NOT_AVAILABLE,
    WRITE_COMBINE,
    WRITE_BACK,
}

enum MemoryPool : int
{

    UNKNOWN,
    POOL_L0,
    POOL_L1,
}

struct HeapProperties
{
    HeapType type;
    CpuPageProperty cPUPageProperty;
    MemoryPool memoryPoolPreference;
    uint creationNodeMask;
    uint visibleNodeMask;
}

bitstruct HeapFlags : uint
{
    bool shared                      : 0;
    uint __unused0                   : 1..1;
    bool denyBuffers                 : 2;
    bool allowDisplay                : 3;
    uint __unused1                   : 4..4;
    bool sharedCrossAdapter          : 5;
    bool denyRtDsTextures            : 6;
    bool denyNonRtDsTextures         : 7;
    bool hardwareProtected           : 8;
    bool allowWriteWatch             : 9;
    bool allowShaderAtomics          : 10;
    bool createNotResident           : 11;
    bool createNotZeroed             : 12;
    bool toolsUseManualWriteTracking : 13;
    uint __unused2                   : 14..31;
}

const HeapFlags HEAP_FLAGS_ALLOW_ALL_BUFFERS_AND_TEXTURES = {};
const HeapFlags HEAP_FLAGS_ALLOW_ONLY_BUFFERS             = { .denyRtDsTextures, .denyNonRtDsTextures };
const HeapFlags HEAP_FLAGS_ALLOW_ONLY_NON_RT_DS_TEXTURES  = { .denyBuffers, .denyRtDsTextures };
const HeapFlags HEAP_FLAGS_ALLOW_ONLY_RT_DS_TEXTURES      = { .denyBuffers, .denyNonRtDsTextures };

struct HeapDesc
{
    ulong sizeInBytes;
    HeapProperties properties;
    ulong alignment;
    HeapFlags flags;
}

enum ResourceDimension : int
{
    UNKNOWN,
    BUFFER,
    TEXTURE1D,
    TEXTURE2D,
    TEXTURE3D,
}

struct FeatureDataPlacedResourceSupportInfo
{
    Format format;
    ResourceDimension dimension;
    HeapProperties destHeapProperties;
    Bool supported;
}

enum TextureLayout : int
{
    UNKNOWN,
    ROW_MAJOR,
    SWIZZLE_64KB_UNDEFINED,
    SWIZZLE_64KB_STANDARD,
}

bitstruct ResourceFlags : uint
{
    bool allowRenderTarget               : 0;
    bool allowDepthStencil               : 1;
    bool allowUnorderedAccess            : 2;
    bool denyShaderResource              : 3;
    bool allowCrossAdapter               : 4;
    bool allowSimultaneousAccess         : 5;
    bool videoDecodeReferenceOnly        : 6;
    bool videoEncodeReferenceOnly        : 7;
    bool raytracingAccelerationStructure : 8;
    uint __unused0                       : 9..31;
}

const ResourceFlags RESOURCE_FLAGS_NONE = {};

struct MipRegion
{
    uint width;
    uint height;
    uint depth;
}

struct ResourceDesc
{
    ResourceDimension dimension;
    ulong alignment;
    ulong width;
    uint height;
    ushort depthOrArraySize;
    ushort mipLevels;
    Format format;
    SampleDesc sampleDesc;
    TextureLayout layout;
    ResourceFlags flags;
}

struct ResourceDesc1
{
    ResourceDimension dimension;
    ulong alignment;
    ulong width;
    uint height;
    ushort depthOrArraySize;
    ushort mipLevels;
    Format format;
    SampleDesc sampleDesc;
    TextureLayout layout;
    ResourceFlags flags;
    MipRegion samplerFeedbackMipRegion;
}

struct DepthStencilValue
{
    float depth;
    char stencil;
}

struct ClearValue
{
    Format format;
    union
    {
        float[4] color;
        DepthStencilValue depthStencil;
    }
}

struct Range
{
    Win32_SIZE_T begin;
    Win32_SIZE_T end;
}

struct RangeUint64
{
    ulong begin;
    ulong end;
}

struct SubresourceRangeUint64
{
    uint subresource;
    RangeUint64 range;
}

struct SubresourceInfo
{
    ulong offset;
    uint rowPitch;
    uint depthPitch;
}

struct TiledResourceCoordinate
{
    uint x;
    uint y;
    uint z;
    uint subresource;
}

struct TileRegionSize
{
    uint numTiles;
    Bool useBox;
    uint width;
    ushort height;
    ushort depth;
}

bitstruct TileRangeFlags : uint
{
    bool nul             : 0;
    bool skip            : 1;
    bool reuseSingleTile : 2;
    uint __unused0       : 3..31;
}

const TileRangeFlags TILE_RANGE_FLAGS_NONE = {};

struct SubresourceTiling
{
    uint widthInTiles;
    ushort heightInTiles;
    ushort depthInTiles;
    uint startTileIndexInOverallResource;
}

struct TileShape
{
    uint widthInTexels;
    uint heightInTexels;
    uint depthInTexels;
}

struct PackedMipInfo
{
    char numStandardMips;
    char numPackedMips;
    uint numTilesForPackedMips;
    uint startTileIndexInOverallResource;
}

bitstruct TileMappingFlags : uint
{
    bool noHazard  : 0;
    uint __unused0 : 1..31;
}

const TileMappingFlags TILE_MAPPING_FLAGS_NONE = {};

bitstruct TileCopyFlags : uint
{
    bool noHazard                            : 0;
    bool linearBufferToSwizzledTiledResource : 1;
    bool swizzledTiledResourceToLinearBuffer : 2;
    uint __unused0                           : 3..31;
}

const TileCopyFlags TILE_COPY_FLAGS_NONE = {};

bitstruct ResourceStates : uint
{
    bool vertexAndConstantBuffer         : 0;
    bool indexBuffer                     : 1;
    bool renderTarget                    : 2;
    bool unorderedAccess                 : 3;
    bool depthWrite                      : 4;
    bool depthRead                       : 5;
    bool nonPixelShaderResource          : 6;
    bool pixelShaderResource             : 7;
    bool streamOut                       : 8;
    bool indirectArgument                : 9;
    bool copyDest                        : 10;
    bool copySource                      : 11;
    bool resolveDest                     : 12;
    bool resolveSource                   : 13;
    bool reservedInternal4000            : 14;
    bool reservedInternal8000            : 15;
    bool videoDecodeRead                 : 16;
    bool videoDecodeWrite                : 17;
    bool videoProcessRead                : 18;
    bool videoProcessWrite               : 19;
    bool reservedInternal100000          : 20;
    bool videoEncodeRead                 : 21;
    bool raytracingAccelerationStructure : 22;
    bool videoEncodeWrite                : 23;
    bool shadingRateSource               : 24;
    uint __unused0                       : 25..29;
    bool reservedInternal40000000        : 30;
    bool reservedInternal80000000        : 31;
}

const ResourceStates RESOURCE_STATES_COMMON = {};
const ResourceStates RESOURCE_STATES_PRESENT = {};
const ResourceStates RESOURCE_STATE_GENERIC_READ = {
    .vertexAndConstantBuffer,
    .indexBuffer,
    .nonPixelShaderResource,
    .pixelShaderResource,
    .indirectArgument,
    .copySource,
};
const ResourceStates RESOURCE_STATES_ALL_SHADER_RESOURCE = {
    .nonPixelShaderResource,
    .pixelShaderResource,
};

enum ResourceBarrierType : int
{
    TRANSITION,
    ALIASING,
    UAV,
}

struct ResourceTransitionBarrier
{
    IResource *pResource;
    uint subresource;
    ResourceStates stateBefore;
    ResourceStates stateAfter;
}

struct ResourceAliasingBarrier
{
    IResource* pResourceBefore;
    IResource* pResourceAfter;
}

struct ResourceUavBarrier
{
    IResource* pResource;
}

bitstruct ResourceBarrierFlags : uint
{
    bool beginOnly : 0;
    bool endOnly   : 1;
    uint __unused0 : 2..31;
}

const ResourceBarrierFlags RESOURCE_BARRIER_FLAGS_NONE = {};

struct ResourceBarrier
{
    ResourceBarrierType type;
    ResourceBarrierFlags flags;
    union
    {
        ResourceTransitionBarrier transition;
        ResourceAliasingBarrier aliasing;
        ResourceUavBarrier uav;
    }
}

struct SubresourceFootprint
{
    Format format;
    uint width;
    uint height;
    uint depth;
    uint rowPitch;
}

struct PlacedSubresourceFootprint
{
    ulong offset;
    SubresourceFootprint footprint;
}

enum TextureCopyType : int
{
    SUBRESOURCE_INDEX,
    PLACED_FOOTPRINT,
}

struct TextureCopyLocation
{
    IResource *pResource;
    TextureCopyType type;
    union
    {
        PlacedSubresourceFootprint placedFootprint;
        uint subresourceIndex;
    }
}

enum ResolveMode : int
{
    DECOMPRESS,
    MIN,
    MAX,
    AVERAGE,
    ENCODE_SAMPLER_FEEDBACK,
    DECODE_SAMPLER_FEEDBACK,
}

struct SamplePosition
{
    ichar x;
    ichar y;
}

struct ViewInstanceLocation
{
    uint viewportArrayIndex;
    uint renderTargetArrayIndex;
}

bitstruct ViewInstancingFlags :uint
{
    bool enableViewInstanceMasking : 0;
    uint __unused0                 : 1..31;
}

const ViewInstancingFlags VIEW_INSTANCING_FLAGS_NONE = {};

struct ViewInstancingDesc
{
    uint viewInstanceCount;
    ViewInstanceLocation* pViewInstanceLocations;
    ViewInstancingFlags flags;
}

enum ShaderComponentMapping : int
{
    FROM_MEMORY_COMPONENT_0,
    FROM_MEMORY_COMPONENT_1,
    FROM_MEMORY_COMPONENT_2,
    FROM_MEMORY_COMPONENT_3,
    FORCE_VALUE_0,
    FORCE_VALUE_1,
}

const SHADER_COMPONENT_MAPPING_MASK = 0x7;
const SHADER_COMPONENT_MAPPING_SHIFT = 3;
const SHADER_COMPONENT_MAPPING_ALWAYS_SET_BIT_AVOIDING_ZEROMEM_MISTAKES =
    (1 << (SHADER_COMPONENT_MAPPING_SHIFT * 4));

macro encodeShader4ComponentMapping($src0, $src1, $src2, $src3) => (
    (($src0) & SHADER_COMPONENT_MAPPING_MASK) |
    ((($src1) & SHADER_COMPONENT_MAPPING_MASK) << SHADER_COMPONENT_MAPPING_SHIFT) |
    ((($src2) & SHADER_COMPONENT_MAPPING_MASK) << (SHADER_COMPONENT_MAPPING_SHIFT * 2)) |
    ((($src3) & SHADER_COMPONENT_MAPPING_MASK) << (SHADER_COMPONENT_MAPPING_SHIFT * 3)) |
    SHADER_COMPONENT_MAPPING_ALWAYS_SET_BIT_AVOIDING_ZEROMEM_MISTAKES
);

macro decodeShader4ComponentMapping($componentToExtract, $mapping) => (
    (ShaderComponentMapping)(
        ($mapping >> (SHADER_COMPONENT_MAPPING_SHIFT * $componentToExtract)) &
        SHADER_COMPONENT_MAPPING_MASK
    )
);

const DEFAULT_SHADER_4_COMPONENT_MAPPING = encodeShader4ComponentMapping(0, 1, 2, 3);

bitstruct BufferSrvFlags : uint
{
    bool raw       : 0;
    uint __unused0 : 1..31;
}

const BufferSrvFlags BUFFER_SRV_FLAGS_NONE = {};

struct BufferSrv
{
    ulong firstElement;
    uint numElements;
    uint structureByteStride;
    BufferSrvFlags flags;
}

struct Tex1DSrv
{
    uint mostDetailedMip;
    uint mipLevels;
    float resourceMinLODClamp;
}

struct Tex1DArraySrv
{
    uint mostDetailedMip;
    uint mipLevels;
    uint firstArraySlice;
    uint arraySize;
    float resourceMinLODClamp;
}

struct Tex2DSrv
{
    uint mostDetailedMip;
    uint mipLevels;
    uint planeSlice;
    float resourceMinLODClamp;
}

struct Tex2DArraySrv
{
    uint mostDetailedMip;
    uint mipLevels;
    uint firstArraySlice;
    uint arraySize;
    uint planeSlice;
    float resourceMinLODClamp;
}

struct Tex3DSrv
{
    uint mostDetailedMip;
    uint mipLevels;
    float resourceMinLODClamp;
}

struct TexcubeSrv
{
    uint mostDetailedMip;
    uint mipLevels;
    float resourceMinLODClamp;
}

struct TexcubeArraySrv
{
    uint mostDetailedMip;
    uint mipLevels;
    uint first2DArrayFace;
    uint numCubes;
    float resourceMinLODClamp;
}

struct Tex2DmsSrv
{
    uint unusedField_NothingToDefine;
}

struct Tex2DmsArraySrv
{
    uint firstArraySlice;
    uint arraySize;
}

struct RaytracingAccelerationStructureSrv
{
    GpuVirtualAddress location;
}

struct ShaderResourceViewDesc
{
    Format format;
    SrvDimension viewDimension;
    uint shader4ComponentMapping;
    union
    {
        BufferSrv buffer;
        Tex1DSrv texture1D;
        Tex1DArraySrv texture1DArray;
        Tex2DSrv texture2D;
        Tex2DArraySrv texture2DArray;
        Tex2DmsSrv texture2DMS;
        Tex2DmsArraySrv texture2DMSArray;
        Tex3DSrv texture3D;
        TexcubeSrv textureCube;
        TexcubeArraySrv textureCubeArray;
        RaytracingAccelerationStructureSrv raytracingAccelerationStructure;
    }
}

struct ConstantBufferViewDesc
{
    GpuVirtualAddress bufferLocation;
    uint sizeInBytes;
}

typedef Filter = int;
const Filter FILTER_MIN_MAG_MIP_POINT                          = 0;
const Filter FILTER_MIN_MAG_POINT_MIP_LINEAR                   = 0x1;
const Filter FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT             = 0x4;
const Filter FILTER_MIN_POINT_MAG_MIP_LINEAR                   = 0x5;
const Filter FILTER_MIN_LINEAR_MAG_MIP_POINT                   = 0x10;
const Filter FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR            = 0x11;
const Filter FILTER_MIN_MAG_LINEAR_MIP_POINT                   = 0x14;
const Filter FILTER_MIN_MAG_MIP_LINEAR                         = 0x15;
const Filter FILTER_MIN_MAG_ANISOTROPIC_MIP_POINT              = 0x54;
const Filter FILTER_ANISOTROPIC                                = 0x55;
const Filter FILTER_COMPARISON_MIN_MAG_MIP_POINT               = 0x80;
const Filter FILTER_COMPARISON_MIN_MAG_POINT_MIP_LINEAR        = 0x81;
const Filter FILTER_COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT  = 0x84;
const Filter FILTER_COMPARISON_MIN_POINT_MAG_MIP_LINEAR        = 0x85;
const Filter FILTER_COMPARISON_MIN_LINEAR_MAG_MIP_POINT        = 0x90;
const Filter FILTER_COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR = 0x91;
const Filter FILTER_COMPARISON_MIN_MAG_LINEAR_MIP_POINT        = 0x94;
const Filter FILTER_COMPARISON_MIN_MAG_MIP_LINEAR              = 0x95;
const Filter FILTER_COMPARISON_MIN_MAG_ANISOTROPIC_MIP_POINT   = 0xd4;
const Filter FILTER_COMPARISON_ANISOTROPIC                     = 0xd5;
const Filter FILTER_MINIMUM_MIN_MAG_MIP_POINT                  = 0x100;
const Filter FILTER_MINIMUM_MIN_MAG_POINT_MIP_LINEAR           = 0x101;
const Filter FILTER_MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT     = 0x104;
const Filter FILTER_MINIMUM_MIN_POINT_MAG_MIP_LINEAR           = 0x105;
const Filter FILTER_MINIMUM_MIN_LINEAR_MAG_MIP_POINT           = 0x110;
const Filter FILTER_MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR    = 0x111;
const Filter FILTER_MINIMUM_MIN_MAG_LINEAR_MIP_POINT           = 0x114;
const Filter FILTER_MINIMUM_MIN_MAG_MIP_LINEAR                 = 0x115;
const Filter FILTER_MINIMUM_MIN_MAG_ANISOTROPIC_MIP_POINT      = 0x154;
const Filter FILTER_MINIMUM_ANISOTROPIC                        = 0x155;
const Filter FILTER_MAXIMUM_MIN_MAG_MIP_POINT                  = 0x180;
const Filter FILTER_MAXIMUM_MIN_MAG_POINT_MIP_LINEAR           = 0x181;
const Filter FILTER_MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT     = 0x184;
const Filter FILTER_MAXIMUM_MIN_POINT_MAG_MIP_LINEAR           = 0x185;
const Filter FILTER_MAXIMUM_MIN_LINEAR_MAG_MIP_POINT           = 0x190;
const Filter FILTER_MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR    = 0x191;
const Filter FILTER_MAXIMUM_MIN_MAG_LINEAR_MIP_POINT           = 0x194;
const Filter FILTER_MAXIMUM_MIN_MAG_MIP_LINEAR                 = 0x195;
const Filter FILTER_MAXIMUM_MIN_MAG_ANISOTROPIC_MIP_POINT      = 0x1d4;
const Filter FILTER_MAXIMUM_ANISOTROPIC                        = 0x1d5;

enum FilterType : int
{
    POINT,
    LINEAR,
}

enum FilterReductionType : int
{
    STANDARD,
    COMPARISON,
    MINIMUM,
    MAXIMUM,
}

const FILTER_REDUCTION_TYPE_MASK  = 0x3;
const FILTER_REDUCTION_TYPE_SHIFT = 7;
const FILTER_TYPE_MASK            = 0x3;
const MIN_FILTER_SHIFT            = 4;
const MAG_FILTER_SHIFT            = 2;
const MIP_FILTER_SHIFT            = 0;
const ANISOTROPIC_FILTERING_BIT   = 0x40;

macro encodeBasicFilter($min, $mag, $mip, $reduction) =>
    ( ( Filter ) (
    ( ( ( $min ) & FILTER_TYPE_MASK ) << MIN_FILTER_SHIFT ) |
    ( ( ( $mag ) & FILTER_TYPE_MASK ) << MAG_FILTER_SHIFT ) |
    ( ( ( $mip ) & FILTER_TYPE_MASK ) << MIP_FILTER_SHIFT ) |
    ( ( ( $reduction ) & FILTER_REDUCTION_TYPE_MASK ) << FILTER_REDUCTION_TYPE_SHIFT ) ) );

macro encodeAnisotropicFilter($reduction) =>
    ( ( Filter ) (
    ANISOTROPIC_FILTERING_BIT |
    encodeBasicFilter( FILTER_TYPE_LINEAR,
        FILTER_TYPE_LINEAR,
        FILTER_TYPE_LINEAR,
        $reduction ) ) );

macro encodeMinMagAnisotropicMipPointFilter($reduction) =>
    ( ( Filter ) (
    ANISOTROPIC_FILTERING_BIT |
    encodeBasicFilter( FILTER_TYPE_LINEAR,
        FILTER_TYPE_LINEAR,
        FILTER_TYPE_POINT,
        $reduction ) ) );

macro decodeMinFilter( Filter ) =>
    ( ( FilterType )
    ( ( ( Filter ) >> MIN_FILTER_SHIFT ) & FILTER_TYPE_MASK ) );

macro decodeMagFilter( Filter ) =>
    ( ( FilterType )
    ( ( ( Filter ) >> MAG_FILTER_SHIFT ) & FILTER_TYPE_MASK ) );

macro decodeMipFilter( Filter ) =>
    ( ( FilterType )
    ( ( ( Filter ) >> MIP_FILTER_SHIFT ) & FILTER_TYPE_MASK ) );

macro decodeFilterReduction( Filter ) =>
    ( ( FilterReductionType )
    ( ( ( Filter ) >> FILTER_REDUCTION_TYPE_SHIFT ) & FILTER_REDUCTION_TYPE_MASK ) );

macro decodeIsComparisonFilter( Filter ) =>
    ( DECODE_FILTER_REDUCTION( Filter ) == FILTER_REDUCTION_TYPE_COMPARISON );

macro decodeIsAnisotropicFilter( Filter ) =>
    ( ( ( Filter ) & ANISOTROPIC_FILTERING_BIT ) &&
    ( FILTER_TYPE_LINEAR == DECODE_MIN_FILTER( Filter ) ) &&
    ( FILTER_TYPE_LINEAR == DECODE_MAG_FILTER( Filter ) ) );

enum TextureAddressMode : int
{
    __UNUSED0,
    WRAP,
    MIRROR,
    CLAMP,
    BORDER,
    MIRROR_ONCE,
}

struct SamplerDesc
{
    Filter filter;
    TextureAddressMode addressU;
    TextureAddressMode addressV;
    TextureAddressMode addressW;
    float mipLODBias;
    uint maxAnisotropy;
    ComparisonFunc comparisonFunc;
    float[4] borderColor;
    float minLOD;
    float maxLOD;
}

bitstruct SamplerFlags : uint
{
    bool uintBorderColor          : 0;
    bool nonNormalizedCoordinates : 1;
    uint __unused0                : 2..31;
}

const SamplerFlags SAMPLER_FLAGS_NONE = {};

struct SamplerDesc2
{
    Filter filter;
    TextureAddressMode addressU;
    TextureAddressMode addressV;
    TextureAddressMode addressW;
    float mipLODBias;
    uint maxAnisotropy;
    ComparisonFunc comparisonFunc;
    union
    {
        float[4] floatBorderColor;
        uint[4] uintBorderColor;
    }
    float minLOD;
    float maxLOD;
    SamplerFlags flags;
}

bitstruct BufferUavFlags : uint
{
    bool raw       : 0;
    uint __unused0 : 1..31;
}

const BufferUavFlags BUFFER_UAV_FLAGS_NONE = {};

struct BufferUav
{
    ulong firstElement;
    uint numElements;
    uint structureByteStride;
    ulong counterOffsetInBytes;
    BufferUavFlags flags;
}

struct Tex1DUav
{
    uint mipSlice;
}

struct Tex1DArrayUav
{
    uint mipSlice;
    uint firstArraySlice;
    uint arraySize;
}

struct Tex2DUav
{
    uint mipSlice;
    uint planeSlice;
}

struct Tex2DArrayUav
{
    uint mipSlice;
    uint firstArraySlice;
    uint arraySize;
    uint planeSlice;
}

struct Tex2DmsUav
{
    uint unusedField_NothingToDefine;
}

struct Tex2DmsArrayUav
{
    uint firstArraySlice;
    uint arraySize;
}

struct Tex3DUav
{
    uint mipSlice;
    uint firstWSlice;
    uint wSize;
}

enum UavDimension : int
{
    UNKNOWN,
    BUFFER,
    TEXTURE1D,
    TEXTURE1DARRAY,
    TEXTURE2D,
    TEXTURE2DARRAY,
    TEXTURE2DMS,
    TEXTURE2DMSARRAY,
    TEXTURE3D,
}

struct UnorderedAccessViewDesc
{
    Format format;
    UavDimension viewDimension;
    union
    {
        BufferUav buffer;
        Tex1DUav texture1D;
        Tex1DArrayUav texture1DArray;
        Tex2DUav texture2D;
        Tex2DArrayUav texture2DArray;
        Tex2DmsUav texture2DMS;
        Tex2DmsArrayUav texture2DMSArray;
        Tex3DUav texture3D;
    }
}

struct BufferRtv
{
    ulong firstElement;
    uint numElements;
}

struct Tex1DRtv
{
    uint mipSlice;
}

struct Tex1DArrayRtv
{
    uint mipSlice;
    uint firstArraySlice;
    uint arraySize;
}

struct Tex2DRtv
{
    uint mipSlice;
    uint planeSlice;
}

struct Tex2DmsRtv
{
    uint unusedField_NothingToDefine;
}

struct Tex2DArrayRtv
{
    uint mipSlice;
    uint firstArraySlice;
    uint arraySize;
    uint planeSlice;
}

struct Tex2DmsArrayRtv
{
    uint firstArraySlice;
    uint arraySize;
}

struct Tex3DRtv
{
    uint mipSlice;
    uint firstWSlice;
    uint wSize;
}

enum RtvDimension : int
{
    UNKNOWN,
    BUFFER,
    TEXTURE1D,
    TEXTURE1DARRAY,
    TEXTURE2D,
    TEXTURE2DARRAY,
    TEXTURE2DMS,
    TEXTURE2DMSARRAY,
    TEXTURE3D,
}

struct RenderTargetViewDesc
{
    Format format;
    RtvDimension viewDimension;
    union
    {
        BufferRtv buffer;
        Tex1DRtv texture1D;
        Tex1DArrayRtv texture1DArray;
        Tex2DRtv texture2D;
        Tex2DArrayRtv texture2DArray;
        Tex2DmsRtv texture2DMS;
        Tex2DmsArrayRtv texture2DMSArray;
        Tex3DRtv texture3D;
    }
}

struct Tex1DDsv
{
    uint mipSlice;
}

struct Tex1DArrayDsv
{
    uint mipSlice;
    uint firstArraySlice;
    uint arraySize;
}

struct Tex2DDsv
{
    uint mipSlice;
}

struct Tex2DArrayDsv
{
    uint mipSlice;
    uint firstArraySlice;
    uint arraySize;
}

struct Tex2DmsDsv
{
    uint unusedField_NothingToDefine;
}

struct Tex2DmsArrayDsv
{
    uint firstArraySlice;
    uint arraySize;
}

bitstruct DsvFlags : uint
{
    bool readOnlyDepth   : 0;
    bool readOnlyStencil : 1;
    uint __unused0       : 2..31;
}

const DsvFlags DSV_FLAGS_NONE = {};

enum DsvDimension : int
{
    UNKNOWN,
    TEXTURE1D,
    TEXTURE1DARRAY,
    TEXTURE2D,
    TEXTURE2DARRAY,
    TEXTURE2DMS,
    TEXTURE2DMSARRAY,
}

struct DepthStencilViewDesc
{
    Format format;
    DsvDimension viewDimension;
    DsvFlags flags;
    union
    {
        Tex1DDsv texture1D;
        Tex1DArrayDsv texture1DArray;
        Tex2DDsv texture2D;
        Tex2DArrayDsv texture2DArray;
        Tex2DmsDsv texture2DMS;
        Tex2DmsArrayDsv texture2DMSArray;
    }
}

bitstruct ClearFlags : uint
{
    bool depth     : 0;
    bool stencil   : 1;
    uint __unused0 : 2..31;
}

bitstruct FenceFlags : uint
{
    bool shared             : 0;
    bool sharedCrossAdapter : 1;
    bool nonMonitored       : 2;
    uint __unused0          : 3..31;
}

const FenceFlags FENCE_FLAGS_NONE = {};

enum DescriptorHeapType : int
{
    CBV_SRV_UAV,
    SAMPLER,
    RTV,
    DSV,
}

const DESCRIPTOR_HEAP_TYPE_NUM_TYPES = DescriptorHeapType.len;

bitstruct DescriptorHeapFlags : uint
{
    bool shaderVisible : 0;
    uint __unused0     : 1..31;
}

struct DescriptorHeapDesc
{
    DescriptorHeapType type;
    uint numDescriptors;
    DescriptorHeapFlags flags;
    uint nodeMask;
}

const DescriptorHeapFlags DESCRIPTOR_HEAP_FLAGS_NONE = {};

enum DescriptorRangeType
{
    SRV,
    UAV,
    CBV,
    SAMPLER,
}

struct DescriptorRange
{
    DescriptorRangeType rangeType;
    uint numDescriptors;
    uint baseShaderRegister;
    uint registerSpace;
    uint offsetInDescriptorsFromTableStart;
}

struct RootDescriptorTable
{
    uint numDescriptorRanges;
    DescriptorRange* pDescriptorRanges;
}

struct RootConstants
{
    uint shaderRegister;
    uint registerSpace;
    uint num32BitValues;
}

struct RootDescriptor
{
    uint shaderRegister;
    uint registerSpace;
}

enum ShaderVisibility
{
    ALL,
    VERTEX,
    HULL,
    DOMAIN,
    GEOMETRY,
    PIXEL,
    AMPLIFICATION,
    MESH,
}

enum RootParameterType : int
{
    DESCRIPTOR_TABLE,
    BIT_32_CONSTANTS,
    CBV,
    SRV,
    UAV,
}

struct RootParameter
{
    RootParameterType parameterType;
    union
    {
        RootDescriptorTable descriptorTable;
        RootConstants constants;
        RootDescriptor descriptor;
    }
    ShaderVisibility shaderVisibility;
}

bitstruct RootSignatureFlags : uint
{
    bool allowInputAssemblerInputLayout    : 0;
    bool denyVertexShaderRootAccess        : 1;
    bool denyHullShaderRootAccess          : 2;
    bool denyDomainShaderRootAccess        : 3;
    bool denyGeometryShaderRootAccess      : 4;
    bool denyPixelShaderRootAccess         : 5;
    bool allowStreamOutput                 : 6;
    bool localRootSignature                : 7;
    bool denyAmplificationShaderRootAccess : 8;
    bool denyMeshShaderRootAccess          : 9;
    bool cbvSrvUavHeapDirectlyIndexed      : 10;
    bool samplerHeapDirectlyIndexed        : 11;
    uint __unused0                         : 12..31;
}

const RootSignatureFlags ROOT_SIGNATURE_FLAGS_NONE = {};

enum StaticBorderColor : int
{
    TRANSPARENT_BLACK,
    OPAQUE_BLACK,
    OPAQUE_WHITE,
    OPAQUE_BLACK_UINT,
    OPAQUE_WHITE_UINT,
}

struct StaticSamplerDesc
{
    Filter filter;
    TextureAddressMode addressU;
    TextureAddressMode addressV;
    TextureAddressMode addressW;
    float mipLODBias;
    uint maxAnisotropy;
    ComparisonFunc comparisonFunc;
    StaticBorderColor borderColor;
    float minLOD;
    float maxLOD;
    uint shaderRegister;
    uint registerSpace;
    ShaderVisibility shaderVisibility;
}

struct StaticSamplerDesc1
{
    Filter filter;
    TextureAddressMode addressU;
    TextureAddressMode addressV;
    TextureAddressMode addressW;
    float mipLODBias;
    uint maxAnisotropy;
    ComparisonFunc comparisonFunc;
    StaticBorderColor borderColor;
    float minLOD;
    float maxLOD;
    uint shaderRegister;
    uint registerSpace;
    ShaderVisibility shaderVisibility;
    SamplerFlags flags;
}

struct RootSignatureDesc
{
    uint numParameters;
    RootParameter* pParameters;
    uint numStaticSamplers;
    StaticSamplerDesc* pStaticSamplers;
    RootSignatureFlags flags;
}

bitstruct DescriptorRangeFlags : uint
{
    bool descriptorsVolatile                        : 0;
    bool dataVolatile                               : 1;
    bool dataStaticWhileSetAtExecute                : 2;
    bool dataStatic                                 : 3;
    uint __unused0                                  : 4..15;
    bool descriptorsStaticKeepingBufferBoundsChecks : 16;
    uint __unused1                                  : 17..31;
}

const DescriptorRangeFlags DESCRIPTOR_RANGE_FLAGS_NONE = {};

struct DescriptorRange1
{
    DescriptorRangeType rangeType;
    uint numDescriptors;
    uint baseShaderRegister;
    uint registerSpace;
    DescriptorRangeFlags flags;
    uint offsetInDescriptorsFromTableStart;
}

struct RootDescriptorTable1
{
    uint numDescriptorRanges;
    DescriptorRange1* pDescriptorRanges;
}

bitstruct RootDescriptorFlags : uint
{
    uint __unused0                   : 0..1;
    bool dataVolatile                : 2;
    bool dataStaticWhileSetAtExecute : 3;
    bool dataStatic                  : 4;
    uint __unused1                   : 5..31;
}

const RootDescriptorFlags ROOT_DESCRIPTOR_FLAGS_NONE = {};

struct RootDescriptor1
{
    uint shaderRegister;
    uint registerSpace;
    RootDescriptorFlags flags;
}

struct RootParameter1
{
    RootParameterType parameterType;
    union
    {
        RootDescriptorTable1 descriptorTable;
        RootConstants constants;
        RootDescriptor1 descriptor;
    }
    ShaderVisibility shaderVisibility;
}

struct RootSignatureDesc1
{
    uint numParameters;
    RootParameter1* pParameters;
    uint numStaticSamplers;
    StaticSamplerDesc* pStaticSamplers;
    RootSignatureFlags flags;
}

struct RootSignatureDesc2
{
    uint numParameters;
    RootParameter1* pParameters;
    uint numStaticSamplers;
    StaticSamplerDesc1* pStaticSamplers;
    RootSignatureFlags flags;
}

struct VersionedRootSignatureDesc
{
    RootSignatureVersion version;
    union
    {
        RootSignatureDesc desc_1_0;
        RootSignatureDesc1 desc_1_1;
        RootSignatureDesc2 desc_1_2;
    }
}

// =============================================================================
// IRootSignatureDeserializer
// =============================================================================

const IROOT_SIGNATURE_DESERIALIZER_UUID_STRING = "34AB647B-3CC8-46AC-841B-C0965645C046";
const Win32_GUID IROOT_SIGNATURE_DESERIALIZER_UUID = {
    .data1 = 0x34AB647B, .data2 = 0x3CC8, .data3 = 0x46AC,
    .data4 = { 0x84, 0x1B, 0xC0, 0x96, 0x56, 0x45, 0xC0, 0x46 }
};

struct IRootSignatureDeserializer
{
    IRootSignatureDeserializerVTable* vtbl;
}

alias IRootSignatureDeserializer_GetRootSignatureDescFn = fn RootSignatureDesc* (void* self);

struct IRootSignatureDeserializerVTable
{
    inline IUnknownVTable _base;
    IRootSignatureDeserializer_GetRootSignatureDescFn getRootSignatureDesc;
}

// Functions of IUnknown

fn Win32_HRESULT IRootSignatureDeserializer.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IRootSignatureDeserializer.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IRootSignatureDeserializer.release(&self) @inline => self.vtbl.release(self);

//  Functions of IRootSignatureDeserializer

fn RootSignatureDesc* IRootSignatureDeserializer.getRootSignatureDesc(&self) @inline =>
    self.vtbl.getRootSignatureDesc(self);

// =============================================================================
// IVersionedRootSignatureDeserializer
// =============================================================================

const IVERSIONED_ROOT_SIGNATURE_DESERIALIZER_UUID_STRING = "7F91CE67-090C-4BB7-B78E-ED8FF2E31DA0";
const Win32_GUID IVERSIONED_ROOT_SIGNATURE_DESERIALIZER_UUID = {
    .data1 = 0x7F91CE67, .data2 = 0x090C, .data3 = 0x4BB7,
    .data4 = { 0xB7, 0x8E, 0xED, 0x8F, 0xF2, 0xE3, 0x1D, 0xA0 }
};

struct IVersionedRootSignatureDeserializer
{
    IVersionedRootSignatureDeserializerVTable* vtbl;
}

alias IVersionedRootSignatureDeserializer_GetRootSignatureDescAtVersionFn = fn Win32_HRESULT (
    void* self,
    RootSignatureVersion convertToVersion,
    VersionedRootSignatureDesc** ppDesc);

alias IVersionedRootSignatureDeserializer_GetUnconvertedRootSignatureDescFn =
    fn VersionedRootSignatureDesc* (void* self);

struct IVersionedRootSignatureDeserializerVTable
{
    inline IUnknownVTable _base;
    IVersionedRootSignatureDeserializer_GetRootSignatureDescAtVersionFn
        getRootSignatureDescAtVersion;
    IVersionedRootSignatureDeserializer_GetUnconvertedRootSignatureDescFn
        getUnconvertedRootSignatureDesn;
}

// Functions of IUnknown

fn Win32_HRESULT IVersionedRootSignatureDeserializer.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IVersionedRootSignatureDeserializer.addRef(&self) @inline =>
    self.vtbl.addRef(self);

fn Win32_DWORD IVersionedRootSignatureDeserializer.release(&self) @inline =>
    self.vtbl.release(self);

//  Functions of IVersionedRootSignatureDeserializer

fn Win32_HRESULT IVersionedRootSignatureDeserializer.getRootSignatureDescAtVersion(
    &self,
    RootSignatureVersion convertToVersion,
    VersionedRootSignatureDesc** ppDesc
) @inline =>
    self.vtbl.getRootSignatureDescAtVersion(self, convertToVersion, ppDesc);

fn VersionedRootSignatureDesc*
    IVersionedRootSignatureDeserializer.getUnconvertedRootSignatureDesn(
        &self) @inline => self.vtbl.getUnconvertedRootSignatureDesn(self);

// ---

alias PFN_SerializeRootSignature = fn Win32_HRESULT (
    RootSignatureDesc* pRootSignature,
    RootSignatureVersion version,
    IBlob** ppBlob,
    IBlob** ppErrorBlob);

extern fn Win32_HRESULT serializeRootSignature(
    RootSignatureDesc* pRootSignature,
    RootSignatureVersion version,
    IBlob** ppBlob,
    IBlob** ppErrorBlob
) @extern("D3D12SerializeRootSignature");

alias PFN_CreateRootSignatureDeserializer = fn Win32_HRESULT (
    void* pSrcData,
    Win32_SIZE_T srcDataSizeInBytes,
    Win32_GUID* pRootSignatureDeserializerInterface,
    void** ppRootSignatureDeserializer);

extern fn Win32_HRESULT createRootSignatureDeserializer(
    void* pSrcData,
    Win32_SIZE_T srcDataSizeInBytes,
    Win32_GUID* pRootSignatureDeserializerInterface,
    void** ppRootSignatureDeserializer
) @extern("D3D12CreateRootSignatureDeserializer");

alias PFN_SerializeVersionedRootSignature = fn Win32_HRESULT (
    VersionedRootSignatureDesc* pRootSignature,
    IBlob** ppBlob,
    IBlob** ppErrorBlob);

extern fn Win32_HRESULT serializeVersionedRootSignature(
    VersionedRootSignatureDesc* pRootSignature,
    IBlob** ppBlob,
    IBlob** ppErrorBlob
) @extern("D3D12SerializeVersionedRootSignature");

alias PFN_CreateVersionedRootSignatureDeserializer = fn Win32_HRESULT (
    void* pSrcData,
    Win32_SIZE_T srcDataSizeInBytes,
    Win32_GUID* pRootSignatureDeserializerInterface,
    void** ppRootSignatureDeserializer);

extern fn Win32_HRESULT createVersionedRootSignatureDeserializer(
    void* pSrcData,
    Win32_SIZE_T srcDataSizeInBytes,
    Win32_GUID* pRootSignatureDeserializerInterface,
    void** ppRootSignatureDeserializer
) @extern("D3D12CreateVersionedRootSignatureDeserializer");

alias PFN_CreateVersionedRootSignatureDeserializerFromSubobjectInLibrary = fn Win32_HRESULT (
    void* pSrcData,
    Win32_SIZE_T srcDataSizeInBytes,
    Win32_LPCWSTR rootSignatureSubobjectName,
    Win32_GUID* pRootSignatureDeserializerInterface,
    void** ppRootSignatureDeserializer);

extern fn Win32_HRESULT createVersionedRootSignatureDeserializerFromSubobjectInLibrary(
    void* pSrcData,
    Win32_SIZE_T srcDataSizeInBytes,
    Win32_LPCWSTR rootSignatureSubobjectName,
    Win32_GUID* pRootSignatureDeserializerInterface,
    void** ppRootSignatureDeserializer
) @extern("D3D12CreateVersionedRootSignatureDeserializerFromSubobjectInLibrary");

struct CpuDescriptorHandle
{
    Win32_SIZE_T ptr;
}

struct GpuDescriptorHandle
{
    ulong ptr;
}

struct DiscardRegion
{
    uint numRects;
    Win32_RECT* pRects;
    uint firstSubresource;
    uint numSubresources;
}

enum QueryHeapType : int
{
    OCCLUSION,
    TIMESTAMP,
    PIPELINE_STATISTICS,
    SO_STATISTICS,
    VIDEO_DECODE_STATISTICS,
    COPY_QUEUE_TIMESTAMP,
    __UNUSED0,
    PIPELINE_STATISTICS1,
}

struct QueryHeapDesc
{
    QueryHeapType type;
    uint count;
    uint nodeMask;
}

enum QueryType : int
{
    OCCLUSION,
    BINARY_OCCLUSION,
    TIMESTAMP,
    PIPELINE_STATISTICS,
    SO_STATISTICS_STREAM0,
    SO_STATISTICS_STREAM1,
    SO_STATISTICS_STREAM2,
    SO_STATISTICS_STREAM3,
    VIDEO_DECODE_STATISTICS,
    __UNUSED0,
    PIPELINE_STATISTICS1,
}

enum PredicationOp : int
{
    EQUAL_ZERO,
    NOT_EQUAL_ZERO,
}

struct QueryDataPipelineStatistics
{
    ulong iAVertices;
    ulong iAPrimitives;
    ulong vSInvocations;
    ulong gSInvocations;
    ulong gSPrimitives;
    ulong cInvocations;
    ulong cPrimitives;
    ulong pSInvocations;
    ulong hSInvocations;
    ulong dSInvocations;
    ulong cSInvocations;
}

struct QueryDataPipelineStatistics1
{
    ulong iAVertices;
    ulong iAPrimitives;
    ulong vSInvocations;
    ulong gSInvocations;
    ulong gSPrimitives;
    ulong cInvocations;
    ulong cPrimitives;
    ulong pSInvocations;
    ulong hSInvocations;
    ulong dSInvocations;
    ulong cSInvocations;
    ulong aSInvocations;
    ulong mSInvocations;
    ulong mSPrimitives;
}

struct QueryDataSoStatistics
{
    ulong numPrimitivesWritten;
    ulong primitivesStorageNeeded;
}

struct StreamOutputBufferView
{
    GpuVirtualAddress bufferLocation;
    ulong sizeInBytes;
    GpuVirtualAddress bufferFilledSizeLocation;
}

struct DrawArguments
{
    uint vertexCountPerInstance;
    uint instanceCount;
    uint startVertexLocation;
    uint startInstanceLocation;
}

struct DrawIndexedArguments
{
    uint indexCountPerInstance;
    uint instanceCount;
    uint startIndexLocation;
    Win32_INT baseVertexLocation;
    uint startInstanceLocation;
}

struct DispatchArguments
{
    uint threadGroupCountX;
    uint threadGroupCountY;
    uint threadGroupCountZ;
}

struct VertexBufferView
{
    GpuVirtualAddress bufferLocation;
    uint sizeInBytes;
    uint strideInBytes;
}

struct IndexBufferView
{
    GpuVirtualAddress bufferLocation;
    uint sizeInBytes;
    Format format;
}

enum IndirectArgumentType : int
{
    DRAW,
    DRAW_INDEXED,
    DISPATCH,
    VERTEX_BUFFER_VIEW,
    INDEX_BUFFER_VIEW,
    CONSTANT,
    CONSTANT_BUFFER_VIEW,
    SHADER_RESOURCE_VIEW,
    UNORDERED_ACCESS_VIEW,
    DISPATCH_RAYS,
    DISPATCH_MESH,
    INCREMENTING_CONSTANT,
}

struct IndirectArgumentDesc
{
    IndirectArgumentType type;
    union
    {
        struct vertexBuffer
        {
            uint slot;
        }
        struct constant
        {
            uint rootParameterIndex;
            uint destOffsetIn32BitValues;
            uint num32BitValuesToSet;
        }
        struct constantBufferView
        {
            uint rootParameterIndex;
        }
        struct shaderResourceView
        {
            uint rootParameterIndex;
        }
        struct unorderedAccessView
        {
            uint rootParameterIndex;
        }
        struct incrementingConstant
        {
            uint rootParameterIndex;
            uint destOffsetIn32BitValues;
        }
    }
}

struct CommandSignatureDesc
{
    uint byteStride;
    uint numArgumentDescs;
    IndirectArgumentDesc* pArgumentDescs;
    uint nodeMask;
}

// =============================================================================
// IPageable
// =============================================================================

const IPAGEABLE_UUID_STRING = "63ee58fb-1268-4835-86da-f008ce62f0d6";
const Win32_GUID IPAGEABLE_UUID = {
    .data1 = 0x63ee58fb, .data2 = 0x1268, .data3 = 0x4835,
    .data4 = { 0x86, 0xda, 0xf0, 0x08, 0xce, 0x62, 0xf0, 0xd6 }
};

struct IPageable
{
    IPageableVTable* vtbl;
}

struct IPageableVTable
{
    inline IDeviceChildVTable _base;
}

// Functions of IUnknown

fn Win32_HRESULT IPageable.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IPageable.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IPageable.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IPageable.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IPageable.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IPageable.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IPageable.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IPageable.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// =============================================================================
// IHeap
// =============================================================================

const IHEAP_UUID_STRING = "6b3b2502-6e51-45b3-90ee-9884265e8df3";
const Win32_GUID IHEAP_UUID = {
    0x6b3b2502, 0x6e51, 0x45b3, { 0x90, 0xee, 0x98, 0x84, 0x26, 0x5e, 0x8d, 0xf3 } };

const IHEAP1_UUID_STRING = "572F7389-2168-49E3-9693-D6DF5871BF6D";
const Win32_GUID IHEAP1_UUID = {
    0x572F7389, 0x2168, 0x49E3, { 0x96, 0x93, 0xD6, 0xDF, 0x58, 0x71, 0xBF, 0x6D } };

struct IHeap
{
    IHeapVTable* vtbl;
}

typedef IHeap1 = inline IHeap;

// Function pointers of IHeap

alias IHeap_GetDescFn = fn HeapDesc* (
    void* self,
    HeapDesc* retVal);

// Function pointers of IHeap1

alias IHeap1_GetProtectedResourceSessionFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* riid,
    void** ppProtectedSession);

struct IHeapVTable
{
    inline IPageableVTable _base;

    // IHeap
    IHeap_GetDescFn getDesc;

    // IHeap1
    IHeap1_GetProtectedResourceSessionFn getProtectedResourceSession;
}

// Functions of IUnknown

fn Win32_HRESULT IHeap.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IHeap.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IHeap.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IHeap.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IHeap.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IHeap.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IHeap.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IHeap.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Functions of IHeap

fn HeapDesc* IHeap.getDesc(
    &self,
    HeapDesc* retVal
) @inline =>
    self.vtbl.getDesc(self, retVal);

// Functions of IHeap1

fn Win32_HRESULT IHeap.getProtectedResourceSession(
    &self,
    Win32_GUID* riid,
    void** ppProtectedSession
) @inline => self.vtbl.getProtectedResourceSession(self, riid, ppProtectedSession);

// =============================================================================
// IResource
// =============================================================================

const IRESOURCE_UUID_STRING = "696442be-a72e-4059-bc79-5b5c98040fad";
const Win32_GUID IRESOURCE_UUID = {
    0x696442be, 0xa72e, 0x4059, { 0xbc, 0x79, 0x5b, 0x5c, 0x98, 0x04, 0x0f, 0xad } };

const IRESOURCE1_UUID_STRING = "9D5E227A-4430-4161-88B3-3ECA6BB16E19";
const Win32_GUID IRESOURCE1_UUID = {
    0x9D5E227A, 0x4430, 0x4161, { 0x88, 0xB3, 0x3E, 0xCA, 0x6B, 0xB1, 0x6E, 0x19 } };

const IRESOURCE2_UUID_STRING = "BE36EC3B-EA85-4AEB-A45A-E9D76404A495";
const Win32_GUID IRESOURCE2_UUID = {
    0xBE36EC3B, 0xEA85, 0x4AEB, { 0xA4, 0x5A, 0xE9, 0xD7, 0x64, 0x04, 0xA4, 0x95 } };

struct IResource
{
    IResourceVTable* vtbl;
}

typedef IResource1 = inline IResource;
typedef IResource2 = inline IResource;

// Function pointers of IResource

alias IResource_MapFn = fn Win32_HRESULT (
    void* self,
    uint subresource,
    Range* pReadRange,
    void** ppData);

alias IResource_UnmapFn = fn void (
    void* self,
    uint subresource,
    Range* pWrittenRange);

alias IResource_GetDescFn = fn ResourceDesc* (
    void* self,
    ResourceDesc* retVal);

alias IResource_GetGPUVirtualAddressFn = fn GpuVirtualAddress (void* self);

alias IResource_WriteToSubresourceFn = fn Win32_HRESULT (
    void* self,
    uint dstSubresource,
    Box* pDstBox,
    void* pSrcData,
    uint srcRowPitch,
    uint srcDepthPitch);

alias IResource_ReadFromSubresourceFn = fn Win32_HRESULT (
    void* self,
    void* pDstData,
    uint dstRowPitch,
    uint dstDepthPitch,
    uint srcSubresource,
    Box* pSrcBox);

alias IResource_GetHeapPropertiesFn = fn Win32_HRESULT (
    void* self,
    HeapProperties* pHeapProperties,
    HeapFlags* pHeapFlags);

// Function pointers of IResource1

alias IResource1_GetProtectedResourceSessionFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* riid,
    void** ppProtectedSession);

// Function pointers of IResource2

alias IResource2_GetDesc1Fn = fn ResourceDesc1* (
    void* self,
    ResourceDesc1* retVal);

struct IResourceVTable
{
    inline IPageableVTable _base;

    // IResource
    IResource_MapFn map;
    IResource_UnmapFn unmap;
    IResource_GetDescFn getDesc;
    IResource_GetGPUVirtualAddressFn getGPUVirtualAddress;
    IResource_WriteToSubresourceFn writeToSubresource;
    IResource_ReadFromSubresourceFn readFromSubresource;
    IResource_GetHeapPropertiesFn getHeapProperties;

    // IResource1
    IResource1_GetProtectedResourceSessionFn getProtectedResourceSession;

    // IResource2
    IResource2_GetDesc1Fn getDesc1;
}

// Functions of IUnknown

fn Win32_HRESULT IResource.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IResource.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IResource.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IResource.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IResource.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IResource.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IResource.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IResource.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Functions of IResource

fn Win32_HRESULT IResource.map(
    &self,
    uint subresource,
    Range* pReadRange,
    void** ppData
) @inline =>
    self.vtbl.map(self, subresource, pReadRange, ppData);

fn void IResource.unmap(
    &self,
    uint subresource,
    Range* pWrittenRange
) @inline =>
    self.vtbl.unmap(self, subresource, pWrittenRange);

fn ResourceDesc* IResource.getDesc(
    &self,
    ResourceDesc* retVal
) @inline =>
    self.vtbl.getDesc(self, retVal);

fn GpuVirtualAddress IResource.getGPUVirtualAddress(&self) @inline =>
    self.vtbl.getGPUVirtualAddress(self);

fn Win32_HRESULT IResource.writeToSubresource(
    &self,
    uint dstSubresource,
    Box* pDstBox,
    void* pSrcData,
    uint srcRowPitch,
    uint srcDepthPitch
) @inline =>
    self.vtbl.writeToSubresource(
        self,
        dstSubresource,
        pDstBox,
        pSrcData,
        srcRowPitch,
        srcDepthPitch);

fn Win32_HRESULT IResource.readFromSubresource(
    &self,
    void* pDstData,
    uint dstRowPitch,
    uint dstDepthPitch,
    uint srcSubresource,
    Box* pSrcBox
) @inline =>
    self.vtbl.readFromSubresource(
        self,
        pDstData,
        dstRowPitch,
        dstDepthPitch,
        srcSubresource,
        pSrcBox);

fn Win32_HRESULT IResource.getHeapProperties(
    &self,
    HeapProperties* pHeapProperties,
    HeapFlags* pHeapFlags
) @inline =>
    self.vtbl.getHeapProperties(self, pHeapProperties, pHeapFlags);

// Functions of IResource1

fn Win32_HRESULT IResource.getProtectedResourceSession(
    &self,
    Win32_GUID* riid,
    void** ppProtectedSession
) @inline => self.vtbl.getProtectedResourceSession(self, riid, ppProtectedSession);

// Functions of IResource2

fn ResourceDesc1* IResource.getDesc1(
    &self,
    ResourceDesc1* retVal
) @inline => self.vtbl.getDesc1(self, retVal);

// =============================================================================
// ICommandAllocator
// =============================================================================

const ICOMMAND_ALLOCATOR_UUID_STRING = "6102dee4-af59-4b09-b999-b44d73f09b24";
const Win32_GUID ICOMMAND_ALLOCATOR_UUID = {
    0x6102dee4, 0xaf59, 0x4b09, { 0xb9, 0x99, 0xb4, 0x4d, 0x73, 0xf0, 0x9b, 0x24 } };

struct ICommandAllocator
{
    ICommandAllocatorVTable* vtbl;
}

alias ICommandAllocator_ResetFn = fn Win32_HRESULT (void* self);

struct ICommandAllocatorVTable
{
    inline IPageableVTable _base;
    ICommandAllocator_ResetFn reset;
}

// Functions of IUnknown

fn Win32_HRESULT ICommandAllocator.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ICommandAllocator.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ICommandAllocator.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT ICommandAllocator.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT ICommandAllocator.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT ICommandAllocator.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT ICommandAllocator.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT ICommandAllocator.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Functions of ICommandAllocator

fn Win32_HRESULT ICommandAllocator.reset(&self) @inline =>
    self.vtbl.reset(self);

// =============================================================================
//  IFence
// =============================================================================

const IFENCE_UUID_STRING = "0a753dcf-c4d8-4b91-adf6-be5a60d95a76";
const Win32_GUID IFENCE_UUID = {
    0x0a753dcf, 0xc4d8, 0x4b91, { 0xad, 0xf6, 0xbe, 0x5a, 0x60, 0xd9, 0x5a, 0x76 } };

const IFENCE1_UUID_STRING = "433685fe-e22b-4ca0-a8db-b5b4f4dd0e4a";
const Win32_GUID IFENCE1_UUID = {
    0x433685fe, 0xe22b, 0x4ca0, { 0xa8, 0xdb, 0xb5, 0xb4, 0xf4, 0xdd, 0x0e, 0x4a } };

struct IFence
{
    IFenceVTable* vtbl;
}

typedef IFecen1 = inline IFence;

// Function pointers of IFence

alias IFence_GetCompletedValueFn = fn ulong (void* self);

alias IFence_SetEventOnCompletionFn = fn Win32_HRESULT (
    void* self,
    ulong value,
    Win32_HANDLE hEvent);

alias IFence_SignalFn = fn Win32_HRESULT (
    void* self,
    ulong value);

// Function pionters of IFence1

alias IFence1_GetCreationFlagsFn = fn FenceFlags (void* self);

struct IFenceVTable
{
    inline IPageableVTable _base;

    // IFence
    IFence_GetCompletedValueFn getCompletedValue;
    IFence_SetEventOnCompletionFn setEventOnCompletion;
    IFence_SignalFn signal;

    // IFence1
    IFence1_GetCreationFlagsFn getCreationFlags;
}

// Functions of IUnknown

fn Win32_HRESULT IFence.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IFence.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IFence.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IFence.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IFence.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IFence.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IFence.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IFence.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Functions of IFence

fn ulong IFence.getCompletedValue(&self) @inline =>
    self.vtbl.getCompletedValue(self);

fn Win32_HRESULT IFence.setEventOnCompletion(
    &self,
    ulong value,
    Win32_HANDLE hEvent
) @inline =>
    self.vtbl.setEventOnCompletion(self, value, hEvent);

fn Win32_HRESULT IFence.signal(
    &self,
    ulong value
) @inline =>
    self.vtbl.signal(self, value);

// Functions of IFence1

fn FenceFlags IFence.getCreationFlags(&self) @inline =>
    self.vtbl.getCreationFlags(self);

// =============================================================================
// IPipelineState
// =============================================================================

const IPIPELINE_STATE_UUID_STRING = "765a30f3-f624-4c6f-a828-ace948622445";
const Win32_GUID IPIPELINE_STATE_UUID = {
    0x765a30f3, 0xf624, 0x4c6f, { 0xa8, 0x28, 0xac, 0xe9, 0x48, 0x62, 0x24, 0x45 } };

struct IPipelineState
{
    IPipelineStateVTable* vtbl;
}

// Function pointers of IPipelineState

alias IPipelineState_GetCachedBlobFn = fn Win32_HRESULT (
    void* self,
    IBlob* ppBlob);

struct IPipelineStateVTable
{
    inline IPageableVTable _base;
    IPipelineState_GetCachedBlobFn getCachedBlob;
}

// Functions of IUnknown

fn Win32_HRESULT IPipelineState.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IPipelineState.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IPipelineState.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IPipelineState.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IPipelineState.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IPipelineState.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IPipelineState.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IPipelineState.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Functions of IPipelineState

fn Win32_HRESULT IPipelineState.getCachedBlob(
    &self,
    IBlob* ppBlob
) @inline =>
    self.vtbl.getCachedBlob(self, ppBlob);

// =============================================================================
// IDescriptorHeap
// =============================================================================

const IDESCRIPTOR_HEAP_UUID_STRING = "8efb471d-616c-4f49-90f7-127bb763fa51";
const Win32_GUID IDESCRIPTOR_HEAP_UUID = {
    0x8efb471d, 0x616c, 0x4f49, { 0x90, 0xf7, 0x12, 0x7b, 0xb7, 0x63, 0xfa, 0x51 } };

struct IDescriptorHeap
{
    IDescriptorHeapVTable* vtbl;
}

// Function pointers of IDescriptorHeap

alias IDescriptorHeap_GetDescFn = fn DescriptorHeapDesc* (
    void* self,
    DescriptorHeapDesc* retVal);

alias IDescriptorHeap_GetCPUDescriptorHandleForHeapStartFn = fn CpuDescriptorHandle* (
    void* self,
    CpuDescriptorHandle* retVal);

alias IDescriptorHeap_GetGPUDescriptorHandleForHeapStartFn = fn GpuDescriptorHandle* (
    void* self,
    GpuDescriptorHandle* retVal);

struct IDescriptorHeapVTable
{
    inline IPageableVTable _base;
    IDescriptorHeap_GetDescFn getDesc;
    IDescriptorHeap_GetCPUDescriptorHandleForHeapStartFn getCPUDescriptorHandleForHeapStart;
    IDescriptorHeap_GetGPUDescriptorHandleForHeapStartFn getGPUDescriptorHandleForHeapStart;
}

// Functions of IUnknown

fn Win32_HRESULT IDescriptorHeap.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDescriptorHeap.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDescriptorHeap.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IDescriptorHeap.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IDescriptorHeap.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IDescriptorHeap.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IDescriptorHeap.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IDescriptorHeap.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Functions of IDescriptorHeap

fn DescriptorHeapDesc* IDescriptorHeap.getDesc(
    &self,
    DescriptorHeapDesc* retVal
) @inline =>
    self.vtbl.getDesc(self, retVal);

fn CpuDescriptorHandle* IDescriptorHeap.getCPUDescriptorHandleForHeapStart(
    &self,
    CpuDescriptorHandle* retVal
) @inline =>
    self.vtbl.getCPUDescriptorHandleForHeapStart(self, retVal);

fn GpuDescriptorHandle* IDescriptorHeap.getGPUDescriptorHandleForHeapStart(
    &self,
    GpuDescriptorHandle* retVal
) @inline =>
    self.vtbl.getGPUDescriptorHandleForHeapStart(self, retVal);

// =============================================================================
// IQueryHeap
// =============================================================================

const IQUERY_HEAP_UUID_STRING = "0d9658ae-ed45-469e-a61d-970ec583cab4";
const Win32_GUID IQUERY_HEAP_UUID = {
    0x0d9658ae, 0xed45, 0x469e, { 0xa6, 0x1d, 0x97, 0x0e, 0xc5, 0x83, 0xca, 0xb4 } };

struct IQueryHeap
{
    IQueryHeapVTable* vtbl;
}

struct IQueryHeapVTable
{
    inline IPageableVTable _base;
}

// Functions of IUnknown

fn Win32_HRESULT IQueryHeap.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IQueryHeap.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IQueryHeap.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IQueryHeap.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IQueryHeap.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IQueryHeap.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IQueryHeap.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IQueryHeap.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// =============================================================================
// ICommandSignature
// =============================================================================

const ICOMMAND_SIGNATURE_UUID_STRING = "c36a797c-ec80-4f0a-8985-a7b2475082d1";
const Win32_GUID ICOMMAND_SIGNATURE_UUID = {
    0xc36a797c, 0xec80, 0x4f0a, { 0x89, 0x85, 0xa7, 0xb2, 0x47, 0x50, 0x82, 0xd1 } };

struct ICommandSignature
{
    ICommandSignatureVTable* vtbl;
}

struct ICommandSignatureVTable
{
    inline IPageableVTable _base;
}

// Functions of IUnknown

fn Win32_HRESULT ICommandSignature.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ICommandSignature.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ICommandSignature.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT ICommandSignature.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT ICommandSignature.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT ICommandSignature.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT ICommandSignature.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT ICommandSignature.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// =============================================================================
// ICommandList
// =============================================================================

const ICOMMAND_LIST_UUID_STRING = "7116d91c-e7e4-47ce-b8c6-ec8168f437e5";
const Win32_GUID ICOMMAND_LIST_UUID = {
    0x7116d91c, 0xe7e4, 0x47ce, { 0xb8, 0xc6, 0xec, 0x81, 0x68, 0xf4, 0x37, 0xe5 } };

// Function pointers of ICommandList

alias ICommandList_GetTypeFn = fn CommandListType (void* self);

struct ICommandList
{
    ICommandListVTable* vtbl;
}

struct ICommandListVTable
{
    inline IDeviceChildVTable _base;
    ICommandList_GetTypeFn getType;
}

// Functions of IUnknown

fn Win32_HRESULT ICommandList.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ICommandList.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ICommandList.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT ICommandList.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT ICommandList.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT ICommandList.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT ICommandList.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT ICommandList.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Functions of ICommandList

fn CommandListType ICommandList.getType(&self) @inline =>
    self.vtbl.getType(self);

// =============================================================================
// IGraphicsCommandList
// =============================================================================

const IGRAPHICS_COMMAND_LIST_UUID_STRING = "5b160d0f-ac1b-4185-8ba8-b3ae42a5a455";
const Win32_GUID IGRAPHICS_COMMAND_LIST_UUID = {
    0x5b160d0f, 0xac1b, 0x4185, { 0x8b, 0xa8, 0xb3, 0xae, 0x42, 0xa5, 0xa4, 0x55 } };

const IGRAPHICS_COMMAND_LIST1_UUID_STRING = "553103fb-1fe7-4557-bb38-946d7d0e7ca7";
const Win32_GUID IGRAPHICS_COMMAND_LIST1_UUID = {
    0x553103fb, 0x1fe7, 0x4557, { 0xbb, 0x38, 0x94, 0x6d, 0x7d, 0x0e, 0x7c, 0xa7 } };

const IGRAPHICS_COMMAND_LIST2_UUID_STRING = "38C3E585-FF17-412C-9150-4FC6F9D72A28";
const Win32_GUID IGRAPHICS_COMMAND_LIST2_UUID = {
    0x38C3E585, 0xFF17, 0x412C, { 0x91, 0x50, 0x4F, 0xC6, 0xF9, 0xD7, 0x2A, 0x28 } };

const IGRAPHICS_COMMAND_LIST3_UUID_STRING = "6FDA83A7-B84C-4E38-9AC8-C7BD22016B3D";
const Win32_GUID IGRAPHICS_COMMAND_LIST3_UUID = {
    0x6FDA83A7, 0xB84C, 0x4E38, { 0x9A, 0xC8, 0xC7, 0xBD, 0x22, 0x01, 0x6B, 0x3D } };

const IGRAPHICS_COMMAND_LIST4_UUID_STRING = "8754318e-d3a9-4541-98cf-645b50dc4874";
const Win32_GUID IGRAPHICS_COMMAND_LIST4_UUID = {
    0x8754318e, 0xd3a9, 0x4541, { 0x98, 0xcf, 0x64, 0x5b, 0x50, 0xdc, 0x48, 0x74 } };

const IGRAPHICS_COMMAND_LIST5_UUID_STRING = "55050859-4024-474c-87f5-6472eaee44ea";
const Win32_GUID IGRAPHICS_COMMAND_LIST5_UUID = {
    0x55050859, 0x4024, 0x474c, { 0x87, 0xf5, 0x64, 0x72, 0xea, 0xee, 0x44, 0xea } };

const IGRAPHICS_COMMAND_LIST6_UUID_STRING = "c3827890-e548-4cfa-96cf-5689a9370f80";
const Win32_GUID IGRAPHICS_COMMAND_LIST6_UUID = {
    0xc3827890, 0xe548, 0x4cfa, { 0x96, 0xcf, 0x56, 0x89, 0xa9, 0x37, 0x0f, 0x80 } };

const IGRAPHICS_COMMAND_LIST7_UUID_STRING = "dd171223-8b61-4769-90e3-160ccde4e2c1";
const Win32_GUID IGRAPHICS_COMMAND_LIST7_UUID = {
    0xdd171223, 0x8b61, 0x4769, { 0x90, 0xe3, 0x16, 0x0c, 0xcd, 0xe4, 0xe2, 0xc1 } };

const IGRAPHICS_COMMAND_LIST8_UUID_STRING = "ee936ef9-599d-4d28-938e-23c4ad05ce51";
const Win32_GUID IGRAPHICS_COMMAND_LIST8_UUID = {
    0xee936ef9, 0x599d, 0x4d28, { 0x93, 0x8e, 0x23, 0xc4, 0xad, 0x05, 0xce, 0x51 } };

const IGRAPHICS_COMMAND_LIST9_UUID_STRING = "34ed2808-ffe6-4c2b-b11a-cabd2b0c59e1";
const Win32_GUID IGRAPHICS_COMMAND_LIST9_UUID = {
    0x34ed2808, 0xffe6, 0x4c2b, { 0xb1, 0x1a, 0xca, 0xbd, 0x2b, 0x0c, 0x59, 0xe1 } };

const IGRAPHICS_COMMAND_LIST10_UUID_STRING = "7013c015-d161-4b63-a08c-238552dd8acc";
const Win32_GUID IGRAPHICS_COMMAND_LIST10_UUID = {
    0x7013c015, 0xd161, 0x4b63, { 0xa0, 0x8c, 0x23, 0x85, 0x52, 0xdd, 0x8a, 0xcc } };

struct IGraphicsCommandList
{
    IGraphicsCommandListVTable* vtbl;
}

typedef IGraphicsCommandList1  = inline IGraphicsCommandList;
typedef IGraphicsCommandList2  = inline IGraphicsCommandList;
typedef IGraphicsCommandList3  = inline IGraphicsCommandList;
typedef IGraphicsCommandList4  = inline IGraphicsCommandList;
typedef IGraphicsCommandList5  = inline IGraphicsCommandList;
typedef IGraphicsCommandList6  = inline IGraphicsCommandList;
typedef IGraphicsCommandList7  = inline IGraphicsCommandList;
typedef IGraphicsCommandList8  = inline IGraphicsCommandList;
typedef IGraphicsCommandList9  = inline IGraphicsCommandList;
typedef IGraphicsCommandList10 = inline IGraphicsCommandList;

// Function pointers of IGraphicsCommandList

alias IGraphicsCommandList_CloseFn = fn Win32_HRESULT (void* self);

alias IGraphicsCommandList_ResetFn = fn Win32_HRESULT (
    void* self,
    ICommandAllocator* pAllocator,
    IPipelineState* pInitialState);

alias IGraphicsCommandList_ClearStateFn = fn void (
    void* self,
    IPipelineState* pPipelineState);

alias IGraphicsCommandList_DrawInstancedFn = fn void (
    void* self,
    uint vertexCountPerInstance,
    uint instanceCount,
    uint startVertexLocation,
    uint startInstanceLocation);

alias IGraphicsCommandList_DrawIndexedInstancedFn = fn void (
    void* self,
    uint indexCountPerInstance,
    uint instanceCount,
    uint startIndexLocation,
    Win32_INT baseVertexLocation,
    uint startInstanceLocation);

alias IGraphicsCommandList_DispatchFn = fn void (
    void* self,
    uint threadGroupCountX,
    uint threadGroupCountY,
    uint threadGroupCountZ);

alias IGraphicsCommandList_CopyBufferRegionFn = fn void (
    void* self,
    IResource* pDstBuffer,
    ulong dstOffset,
    IResource* pSrcBuffer,
    ulong srcOffset,
    ulong numBytes);

alias IGraphicsCommandList_CopyTextureRegionFn = fn void (
    void* self,
    TextureCopyLocation* pDst,
    uint dstX,
    uint dstY,
    uint dstZ,
    TextureCopyLocation* pSrc,
    Box* pSrcBox);

alias IGraphicsCommandList_CopyResourceFn = fn void (
    void* self,
    IResource* pDstResource,
    IResource* pSrcResource);

alias IGraphicsCommandList_CopyTilesFn = fn void (
    void* self,
    IResource* pTiledResource,
    TiledResourceCoordinate* pTileRegionStartCoordinate,
    TileRegionSize* pTileRegionSize,
    IResource* pBuffer,
    ulong bufferStartOffsetInBytes,
    TileCopyFlags flags);

alias IGraphicsCommandList_ResolveSubresourceFn = fn void (
    void* self,
    IResource* pDstResource,
    uint dstSubresource,
    IResource* pSrcResource,
    uint srcSubresource,
    Format format);

alias IGraphicsCommandList_IASetPrimitiveTopologyFn = fn void (
    void* self,
    PrimitiveTopology primitiveTopology);

alias IGraphicsCommandList_RSSetViewportsFn = fn void (
    void* self,
    uint numViewports,
    Viewport* pViewports);

alias IGraphicsCommandList_RSSetScissorRectsFn = fn void (
    void* self,
    uint numRects,
    Win32_RECT* pRects);

alias IGraphicsCommandList_OMSetBlendFactorFn = fn void (
    void* self,
    float[4] blendFactor);

alias IGraphicsCommandList_OMSetStencilRefFn = fn void (
    void* self,
    uint stencilRef);

alias IGraphicsCommandList_SetPipelineStateFn = fn void (
    void* self,
    IPipelineState *pPipelineState);

alias IGraphicsCommandList_ResourceBarrierFn = fn void (
    void* self,
    uint numBarriers,
    ResourceBarrier* pBarriers);

alias IGraphicsCommandList_ExecuteBundleFn = fn void (
    void* self,
    IGraphicsCommandList* pCommandList);

alias IGraphicsCommandList_SetDescriptorHeapsFn = fn void (
    void* self,
    uint numDescriptorHeaps,
    IDescriptorHeap** ppDescriptorHeaps);

alias IGraphicsCommandList_SetComputeRootSignatureFn = fn void (
    void* self,
    IRootSignature* pRootSignature);

alias IGraphicsCommandList_SetGraphicsRootSignatureFn = fn void (
    void* self,
    IRootSignature* pRootSignature);

alias IGraphicsCommandList_SetComputeRootDescriptorTableFn = fn void (
    void* self,
    uint rootParameterIndex,
    GpuDescriptorHandle baseDescriptor);

alias IGraphicsCommandList_SetGraphicsRootDescriptorTableFn = fn void (
    void* self,
    uint rootParameterIndex,
    GpuDescriptorHandle baseDescriptor);

alias IGraphicsCommandList_SetComputeRoot32BitConstantFn = fn void (
    void* self,
    uint rootParameterIndex,
    uint srcData,
    uint destOffsetIn32BitValues);

alias IGraphicsCommandList_SetGraphicsRoot32BitConstantFn = fn void (
    void* self,
    uint rootParameterIndex,
    uint srcData,
    uint destOffsetIn32BitValues);

alias IGraphicsCommandList_SetComputeRoot32BitConstantsFn = fn void (
    void* self,
    uint rootParameterIndex,
    uint num32BitValuesToSet,
    void* pSrcData,
    uint destOffsetIn32BitValues);

alias IGraphicsCommandList_SetGraphicsRoot32BitConstantsFn = fn void (
    void* self,
    uint rootParameterIndex,
    uint num32BitValuesToSet,
    void* pSrcData,
    uint destOffsetIn32BitValues);

alias IGraphicsCommandList_SetComputeRootConstantBufferViewFn = fn void (
    void* self,
    uint rootParameterIndex,
    GpuVirtualAddress bufferLocation);

alias IGraphicsCommandList_SetGraphicsRootConstantBufferViewFn = fn void (
    void* self,
    uint rootParameterIndex,
    GpuVirtualAddress bufferLocation);

alias IGraphicsCommandList_SetComputeRootShaderResourceViewFn = fn void (
    void* self,
    uint rootParameterIndex,
    GpuVirtualAddress bufferLocation);

alias IGraphicsCommandList_SetGraphicsRootShaderResourceViewFn = fn void (
    void* self,
    uint rootParameterIndex,
    GpuVirtualAddress bufferLocation);

alias IGraphicsCommandList_SetComputeRootUnorderedAccessViewFn = fn void (
    void* self,
    uint rootParameterIndex,
    GpuVirtualAddress bufferLocation);

alias IGraphicsCommandList_SetGraphicsRootUnorderedAccessViewFn = fn void (
    void* self,
    uint rootParameterIndex,
    GpuVirtualAddress bufferLocation);

alias IGraphicsCommandList_IASetIndexBufferFn = fn void (
    void* self,
    IndexBufferView* pView);

alias IGraphicsCommandList_IASetVertexBuffersFn = fn void (
    void* self,
    uint startSlot,
    uint numViews,
    VertexBufferView* pViews);

alias IGraphicsCommandList_SOSetTargetsFn = fn void (
    void* self,
    uint startSlot,
    uint numViews,
    StreamOutputBufferView* pViews);

alias IGraphicsCommandList_OMSetRenderTargetsFn = fn void (
    void* self,
    uint numRenderTargetDescriptors,
    CpuDescriptorHandle* pRenderTargetDescriptors,
    Bool rTsSingleHandleToDescriptorRange,
    CpuDescriptorHandle* pDepthStencilDescriptor);

alias IGraphicsCommandList_ClearDepthStencilViewFn = fn void (
    void* self,
    CpuDescriptorHandle depthStencilView,
    ClearFlags clearFlags,
    float depth,
    char stencil,
    uint numRects,
    Win32_RECT* pRects);

alias IGraphicsCommandList_ClearRenderTargetViewFn = fn void (
    void* self,
    CpuDescriptorHandle renderTargetView,
    float[4] colorRGBA,
    uint numRects,
    Win32_RECT* pRects);

alias IGraphicsCommandList_ClearUnorderedAccessViewUintFn = fn void (
    void* self,
    GpuDescriptorHandle viewGPUHandleInCurrentHeap,
    CpuDescriptorHandle viewCPUHandle,
    IResource* pResource,
    uint[4] values,
    uint numRects,
    Win32_RECT* pRects);

alias IGraphicsCommandList_ClearUnorderedAccessViewFloatFn = fn void (
    void* self,
    GpuDescriptorHandle viewGPUHandleInCurrentHeap,
    CpuDescriptorHandle viewCPUHandle,
    IResource* pResource,
    float[4] values,
    uint numRects,
    Win32_RECT* pRects);

alias IGraphicsCommandList_DiscardResourceFn = fn void (
    void* self,
    IResource* pResource,
    DiscardRegion* pRegion);

alias IGraphicsCommandList_BeginQueryFn = fn void (
    void* self,
    IQueryHeap* pQueryHeap,
    QueryType type,
    uint index);

alias IGraphicsCommandList_EndQueryFn = fn void (
    void* self,
    IQueryHeap* pQueryHeap,
    QueryType type,
    uint index);

alias IGraphicsCommandList_ResolveQueryDataFn = fn void (
    void* self,
    IQueryHeap* pQueryHeap,
    QueryType type,
    uint startIndex,
    uint numQueries,
    IResource* pDestinationBuffer,
    ulong alignedDestinationBufferOffset);

alias IGraphicsCommandList_SetPredicationFn = fn void (
    void* self,
    IResource* pBuffer,
    ulong alignedBufferOffset,
    PredicationOp operation);

alias IGraphicsCommandList_SetMarkerFn = fn void (
    void* self,
    uint metadata,
    void* pData,
    uint size);

alias IGraphicsCommandList_BeginEventFn = fn void (
    void* self,
    uint metadata,
    void* pData,
    uint size);

alias IGraphicsCommandList_EndEventFn = fn void (void* self);

alias IGraphicsCommandList_ExecuteIndirectFn = fn void (
    void* self,
    ICommandSignature* pCommandSignature,
    uint maxCommandCount,
    IResource* pArgumentBuffer,
    ulong argumentBufferOffset,
    IResource* pCountBuffer,
    ulong countBufferOffset);

// Function pointers of IGraphicsCommandList1

alias IGraphicsCommandList1_AtomicCopyBufferUINTFn = fn void (
    void* self,
    IResource *pDstBuffer,
    ulong dstOffset,
    IResource *pSrcBuffer,
    ulong srcOffset,
    uint dependencies,
    IResource** ppDependentResources,
    SubresourceRangeUint64* pDependentSubresourceRanges);

alias IGraphicsCommandList1_AtomicCopyBufferUINT64Fn = fn void (
    void* self,
    IResource *pDstBuffer,
    ulong dstOffset,
    IResource *pSrcBuffer,
    ulong srcOffset,
    uint dependencies,
    IResource** ppDependentResources,
    SubresourceRangeUint64* pDependentSubresourceRanges);

alias IGraphicsCommandList1_OMSetDepthBoundsFn = fn void (
    void* self,
    float min,
    float max);

alias IGraphicsCommandList1_SetSamplePositionsFn = fn void (
    void* self,
    uint numSamplesPerPixel,
    uint numPixels,
    SamplePosition* pSamplePositions);

alias IGraphicsCommandList1_ResolveSubresourceRegionFn = fn void (
    void* self,
    IResource *pDstResource,
    uint dstSubresource,
    uint dstX,
    uint dstY,
    IResource *pSrcResource,
    uint srcSubresource,
    Win32_RECT *pSrcRect,
    Format format,
    ResolveMode resolveMode);

alias IGraphicsCommandList1_SetViewInstanceMaskFn = fn void (
    void* self,
    uint mask);

// Function pointers of IGraphicsCommandList2

alias IGraphicsCommandList2_WriteBufferImmediateFn = fn void (
    void* self,
    uint count,
    WritebufferimmediateParameter* pParams,
    WritebufferimmediateMode* pModes);

// Function pointers of IGraphicsCommandList3

alias IGraphicsCommandList3_SetProtectedResourceSessionFn = fn void (
    void* self,
    IProtectedResourceSession* pProtectedResourceSession);

// Function pointers of IGraphicsCommandList4

alias IGraphicsCommandList4_BeginRenderPassFn = fn void (
    void* self,
    uint numRenderTargets,
    RenderPassRenderTargetDesc* pRenderTargets,
    RenderPassDepthStencilDesc* pDepthStencil,
    RenderPassFlags flags);

alias IGraphicsCommandList4_EndRenderPassFn = fn void (void* self);

alias IGraphicsCommandList4_InitializeMetaCommandFn = fn void (
    void* self,
    IMetaCommand* pMetaCommand,
    void* pInitializationParametersData,
    Win32_SIZE_T initializationParametersDataSizeInBytes);

alias IGraphicsCommandList4_ExecuteMetaCommandFn = fn void (
    void* self,
    IMetaCommand* pMetaCommand,
    void* pExecutionParametersData,
    Win32_SIZE_T executionParametersDataSizeInBytes);

alias IGraphicsCommandList4_BuildRaytracingAccelerationStructureFn = fn void (
    void* self,
    BuildRaytracingAccelerationStructureDesc* pDesc,
    uint numPostbuildInfoDescs,
    RaytracingAccelerationStructurePostbuildInfoDesc* pPostbuildInfoDescs);

alias IGraphicsCommandList4_EmitRaytracingAccelerationStructurePostbuildInfoFn = fn void (
    void* self,
    RaytracingAccelerationStructurePostbuildInfoDesc* pDesc,
    uint numSourceAccelerationStructures,
    GpuVirtualAddress* pSourceAccelerationStructureData);

alias IGraphicsCommandList4_CopyRaytracingAccelerationStructureFn = fn void (
    void* self,
    GpuVirtualAddress destAccelerationStructureData,
    GpuVirtualAddress sourceAccelerationStructureData,
    RaytracingAccelerationStructureCopyMode mode);

alias IGraphicsCommandList4_SetPipelineState1Fn = fn void (
    void* self,
    IStateObject* pStateObject);

alias IGraphicsCommandList4_DispatchRaysFn = fn void (
    void* self,
    DispatchRaysDesc* pDesc);

// Function pointers of IGraphicsCommandList5

alias IGraphicsCommandList5_RSSetShadingRateFn = fn void (
    void* self,
    ShadingRate baseShadingRate,
    ShadingRateCombiner* combiners);

alias IGraphicsCommandList5_RSSetShadingRateImageFn = fn void (
    void* self,
    IResource* shadingRateImage);

// Function pointers of IGraphicsCommandList6

alias IGraphicsCommandList6_DispatchMeshFn = fn void (
    void* self,
    uint threadGroupCountX,
    uint threadGroupCountY,
    uint threadGroupCountZ);

// Function pointers of IGraphicsCommandList7

alias IGraphicsCommandList7_BarrierFn = fn void (
    void* self,
    uint numBarrierGroups,
    BarrierGroup* pBarrierGroups);

// Function pointers of IGraphicsCommandList8

alias IGraphicsCommandList8_OMSetFrontAndBackStencilRefFn = fn void (
    void* self,
    uint frontStencilRef,
    uint backStencilRef);

// Function pointers of IGraphicsCommandList9

alias IGraphicsCommandList9_RSSetDepthBiasFn = fn void (
    void* self,
    float depthBias,
    float depthBiasClamp,
    float slopeScaledDepthBias);

alias IGraphicsCommandList9_IASetIndexBufferStripCutValueFn = fn void (
    void* self,
    IndexBufferStripCutValue ibstripCutValue);

// Function pointers of IGraphicsCommandList10

alias IGraphicsCommandList10_SetProgramFn = fn void (
    void* self,
    SetProgramDesc* pDesc);

alias IGraphicsCommandList10_DispatchGraphFn = fn void (
    void* self,
    DispatchGraphDesc* pDesc);

struct IGraphicsCommandListVTable
{
    inline ICommandListVTable _base;

    // IGraphicsCommandList
    IGraphicsCommandList_CloseFn close;
    IGraphicsCommandList_ResetFn reset;
    IGraphicsCommandList_ClearStateFn clearState;
    IGraphicsCommandList_DrawInstancedFn drawInstanced;
    IGraphicsCommandList_DrawIndexedInstancedFn drawIndexedInstanced;
    IGraphicsCommandList_DispatchFn dispatch;
    IGraphicsCommandList_CopyBufferRegionFn copyBufferRegion;
    IGraphicsCommandList_CopyTextureRegionFn copyTextureRegion;
    IGraphicsCommandList_CopyResourceFn copyResource;
    IGraphicsCommandList_CopyTilesFn copyTiles;
    IGraphicsCommandList_ResolveSubresourceFn resolveSubresource;
    IGraphicsCommandList_IASetPrimitiveTopologyFn iASetPrimitiveTopology;
    IGraphicsCommandList_RSSetViewportsFn rSSetViewports;
    IGraphicsCommandList_RSSetScissorRectsFn rSSetScissorRects;
    IGraphicsCommandList_OMSetBlendFactorFn oMSetBlendFactor;
    IGraphicsCommandList_OMSetStencilRefFn oMSetStencilRef;
    IGraphicsCommandList_SetPipelineStateFn setPipelineState;
    IGraphicsCommandList_ResourceBarrierFn resourceBarrier;
    IGraphicsCommandList_ExecuteBundleFn executeBundle;
    IGraphicsCommandList_SetDescriptorHeapsFn setDescriptorHeaps;
    IGraphicsCommandList_SetComputeRootSignatureFn setComputeRootSignature;
    IGraphicsCommandList_SetGraphicsRootSignatureFn setGraphicsRootSignature;
    IGraphicsCommandList_SetComputeRootDescriptorTableFn setComputeRootDescriptorTable;
    IGraphicsCommandList_SetGraphicsRootDescriptorTableFn setGraphicsRootDescriptorTable;
    IGraphicsCommandList_SetComputeRoot32BitConstantFn setComputeRoot32BitConstant;
    IGraphicsCommandList_SetGraphicsRoot32BitConstantFn setGraphicsRoot32BitConstant;
    IGraphicsCommandList_SetComputeRoot32BitConstantsFn setComputeRoot32BitConstants;
    IGraphicsCommandList_SetGraphicsRoot32BitConstantsFn setGraphicsRoot32BitConstants;
    IGraphicsCommandList_SetComputeRootConstantBufferViewFn setComputeRootConstantBufferView;
    IGraphicsCommandList_SetGraphicsRootConstantBufferViewFn setGraphicsRootConstantBufferView;
    IGraphicsCommandList_SetComputeRootShaderResourceViewFn setComputeRootShaderResourceView;
    IGraphicsCommandList_SetGraphicsRootShaderResourceViewFn setGraphicsRootShaderResourceView;
    IGraphicsCommandList_SetComputeRootUnorderedAccessViewFn setComputeRootUnorderedAccessView;
    IGraphicsCommandList_SetGraphicsRootUnorderedAccessViewFn setGraphicsRootUnorderedAccessView;
    IGraphicsCommandList_IASetIndexBufferFn iASetIndexBuffer;
    IGraphicsCommandList_IASetVertexBuffersFn iASetVertexBuffers;
    IGraphicsCommandList_SOSetTargetsFn sOSetTargets;
    IGraphicsCommandList_OMSetRenderTargetsFn oMSetRenderTargets;
    IGraphicsCommandList_ClearDepthStencilViewFn clearDepthStencilView;
    IGraphicsCommandList_ClearRenderTargetViewFn clearRenderTargetView;
    IGraphicsCommandList_ClearUnorderedAccessViewUintFn clearUnorderedAccessViewUint;
    IGraphicsCommandList_ClearUnorderedAccessViewFloatFn clearUnorderedAccessViewFloat;
    IGraphicsCommandList_DiscardResourceFn discardResource;
    IGraphicsCommandList_BeginQueryFn beginQuery;
    IGraphicsCommandList_EndQueryFn endQuery;
    IGraphicsCommandList_ResolveQueryDataFn resolveQueryData;
    IGraphicsCommandList_SetPredicationFn setPredication;
    IGraphicsCommandList_SetMarkerFn setMarker;
    IGraphicsCommandList_BeginEventFn beginEvent;
    IGraphicsCommandList_EndEventFn endEvent;
    IGraphicsCommandList_ExecuteIndirectFn executeIndirect;

    // IGraphicsCommandList1
    IGraphicsCommandList1_AtomicCopyBufferUINTFn atomicCopyBufferUINT;
    IGraphicsCommandList1_AtomicCopyBufferUINT64Fn atomicCopyBufferUINT64;
    IGraphicsCommandList1_OMSetDepthBoundsFn oMSetDepthBounds;
    IGraphicsCommandList1_SetSamplePositionsFn setSamplePositions;
    IGraphicsCommandList1_ResolveSubresourceRegionFn resolveSubresourceRegion;
    IGraphicsCommandList1_SetViewInstanceMaskFn setViewInstanceMask;

    // IGraphicsCommandList2
    IGraphicsCommandList2_WriteBufferImmediateFn writeBufferImmediate;

    // IGraphicsCommandList3
    IGraphicsCommandList3_SetProtectedResourceSessionFn setProtectedResourceSession;

    // IGraphicsCommandList4
    IGraphicsCommandList4_BeginRenderPassFn beginRenderPass;
    IGraphicsCommandList4_EndRenderPassFn endRenderPass;
    IGraphicsCommandList4_InitializeMetaCommandFn initializeMetaCommand;
    IGraphicsCommandList4_ExecuteMetaCommandFn executeMetaCommand;
    IGraphicsCommandList4_BuildRaytracingAccelerationStructureFn
        buildRaytracingAccelerationStructure;
    IGraphicsCommandList4_EmitRaytracingAccelerationStructurePostbuildInfoFn
        emitRaytracingAccelerationStructurePostbuildInfo;
    IGraphicsCommandList4_CopyRaytracingAccelerationStructureFn
        copyRaytracingAccelerationStructure;
    IGraphicsCommandList4_SetPipelineState1Fn setPipelineState1;
    IGraphicsCommandList4_DispatchRaysFn dispatchRays;

    // IGraphicsCommandList5
    IGraphicsCommandList5_RSSetShadingRateFn rsSetShadingRate;
    IGraphicsCommandList5_RSSetShadingRateImageFn rsSetShadingRateImage;

    // IGraphicsCommandList6
    IGraphicsCommandList6_DispatchMeshFn dispatchMesh;

    // IGraphicsCommandList7
    IGraphicsCommandList7_BarrierFn barrier;

    // IGraphicsCommandList8
    IGraphicsCommandList8_OMSetFrontAndBackStencilRefFn omSetFrontAndBackStencilRef;

    // IGraphicsCommandList9
    IGraphicsCommandList9_RSSetDepthBiasFn rsSetDepthBias;
    IGraphicsCommandList9_IASetIndexBufferStripCutValueFn iaSetIndexBufferStripCutValue;

    // IGraphicsCommandList10
    IGraphicsCommandList10_SetProgramFn setProgram;
    IGraphicsCommandList10_DispatchGraphFn dispatchGraph;
}

// Functions of IUnknown

fn Win32_HRESULT IGraphicsCommandList.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IGraphicsCommandList.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IGraphicsCommandList.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IGraphicsCommandList.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IGraphicsCommandList.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IGraphicsCommandList.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IGraphicsCommandList.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IGraphicsCommandList.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Functions of ICommandList

fn CommandListType IGraphicsCommandList.getType(&self) @inline =>
    self.vtbl.getType(self);

// Functions of IGraphicsCommandList

fn Win32_HRESULT IGraphicsCommandList.close(&self) @inline =>
    self.vtbl.close(self);

fn Win32_HRESULT IGraphicsCommandList.reset(
    &self,
    ICommandAllocator* pAllocator,
    IPipelineState* pInitialState
) @inline =>
    self.vtbl.reset(self,pAllocator, pInitialState);

fn void IGraphicsCommandList.clearState(
    &self,
    IPipelineState* pPipelineState
) @inline =>
    self.vtbl.clearState(self, pPipelineState);

fn void IGraphicsCommandList.drawInstanced(
    &self,
    uint vertexCountPerInstance,
    uint instanceCount,
    uint startVertexLocation,
    uint startInstanceLocation
) @inline =>
    self.vtbl.drawInstanced(
        self,
        vertexCountPerInstance,
        instanceCount,
        startVertexLocation,
        startInstanceLocation);

fn void IGraphicsCommandList.drawIndexedInstanced(
    &self,
    uint indexCountPerInstance,
    uint instanceCount,
    uint startIndexLocation,
    Win32_INT baseVertexLocation,
    uint startInstanceLocation
) @inline =>
    self.vtbl.drawIndexedInstanced(
        self,
        indexCountPerInstance,
        instanceCount,
        startIndexLocation,
        baseVertexLocation,
        startInstanceLocation);

fn void IGraphicsCommandList.dispatch(
    &self,
    uint threadGroupCountX,
    uint threadGroupCountY,
    uint threadGroupCountZ
) @inline =>
    self.vtbl.dispatch(self, threadGroupCountX, threadGroupCountY, threadGroupCountZ);

fn void IGraphicsCommandList.copyBufferRegion(
    &self,
    IResource* pDstBuffer,
    ulong dstOffset,
    IResource* pSrcBuffer,
    ulong srcOffset,
    ulong numBytes
) @inline =>
    self.vtbl.copyBufferRegion(self, pDstBuffer, dstOffset, pSrcBuffer, srcOffset, numBytes);

fn void IGraphicsCommandList.copyTextureRegion(
    &self,
    TextureCopyLocation* pDst,
    uint dstX,
    uint dstY,
    uint dstZ,
    TextureCopyLocation* pSrc,
    Box* pSrcBox
) @inline =>
    self.vtbl.copyTextureRegion(self, pDst, dstX, dstY, dstZ, pSrc, pSrcBox);

fn void IGraphicsCommandList.copyResource(
    &self,
    IResource* pDstResource,
    IResource* pSrcResource
) @inline =>
    self.vtbl.copyResource(self, pDstResource, pSrcResource);

fn void IGraphicsCommandList.copyTiles(
    &self,
    IResource* pTiledResource,
    TiledResourceCoordinate* pTileRegionStartCoordinate,
    TileRegionSize* pTileRegionSize,
    IResource* pBuffer,
    ulong bufferStartOffsetInBytes,
    TileCopyFlags flags
) @inline =>
    self.vtbl.copyTiles(self,
        pTiledResource,
        pTileRegionStartCoordinate,
        pTileRegionSize,
        pBuffer,
        bufferStartOffsetInBytes,
        flags);

fn void IGraphicsCommandList.resolveSubresource(
    &self,
    IResource* pDstResource,
    uint dstSubresource,
    IResource* pSrcResource,
    uint srcSubresource,
    Format format
) @inline =>
    self.vtbl.resolveSubresource(
        self,
        pDstResource,
        dstSubresource,
        pSrcResource,
        srcSubresource,
        format);

fn void IGraphicsCommandList.iASetPrimitiveTopology(
    &self,
    PrimitiveTopology primitiveTopology
) @inline =>
    self.vtbl.iASetPrimitiveTopology(self, primitiveTopology);

fn void IGraphicsCommandList.rSSetViewports(
    &self,
    uint numViewports,
    Viewport* pViewports
) @inline =>
    self.vtbl.rSSetViewports(self, numViewports, pViewports);

fn void IGraphicsCommandList.rSSetScissorRects(
    &self,
    uint numRects,
    Win32_RECT* pRects
) @inline =>
    self.vtbl.rSSetScissorRects(self, numRects, pRects);

fn void IGraphicsCommandList.oMSetBlendFactor(
    &self,
    float[4] blendFactor
) @inline =>
    self.vtbl.oMSetBlendFactor(self, blendFactor);

fn void IGraphicsCommandList.oMSetStencilRef(
    &self,
    uint stencilRef
) @inline =>
    self.vtbl.oMSetStencilRef(self, stencilRef);

fn void IGraphicsCommandList.setPipelineState(
    &self,
    IPipelineState *pPipelineState
) @inline =>
    self.vtbl.setPipelineState(self, pPipelineState);

fn void IGraphicsCommandList.resourceBarrier(
    &self,
    uint numBarriers,
    ResourceBarrier* pBarriers
) @inline =>
    self.vtbl.resourceBarrier(self, numBarriers, pBarriers);

fn void IGraphicsCommandList.executeBundle(
    &self,
    IGraphicsCommandList* pCommandList
) @inline =>
    self.vtbl.executeBundle(self, pCommandList);

fn void IGraphicsCommandList.setDescriptorHeaps(
    &self,
    uint numDescriptorHeaps,
    IDescriptorHeap** ppDescriptorHeaps
) @inline =>
    self.vtbl.setDescriptorHeaps(self, numDescriptorHeaps, ppDescriptorHeaps);

fn void IGraphicsCommandList.setComputeRootSignature(
    &self,
    IRootSignature* pRootSignature
) @inline =>
    self.vtbl.setComputeRootSignature(self, pRootSignature);

fn void IGraphicsCommandList.setGraphicsRootSignature(
    &self,
    IRootSignature* pRootSignature
) @inline =>
    self.vtbl.setGraphicsRootSignature(self, pRootSignature);

fn void IGraphicsCommandList.setComputeRootDescriptorTable(
    &self,
    uint rootParameterIndex,
    GpuDescriptorHandle baseDescriptor
) @inline =>
    self.vtbl.setComputeRootDescriptorTable(self, rootParameterIndex, baseDescriptor);

fn void IGraphicsCommandList.setGraphicsRootDescriptorTable(
    &self,
    uint rootParameterIndex,
    GpuDescriptorHandle baseDescriptor
) @inline =>
    self.vtbl.setGraphicsRootDescriptorTable(self, rootParameterIndex, baseDescriptor);

fn void IGraphicsCommandList.setComputeRoot32BitConstant(
    &self,
    uint rootParameterIndex,
    uint srcData,
    uint destOffsetIn32BitValues
) @inline =>
    self.vtbl.setComputeRoot32BitConstant(
        self,
        rootParameterIndex,
        srcData,
        destOffsetIn32BitValues);

fn void IGraphicsCommandList.setGraphicsRoot32BitConstant(
    &self,
    uint rootParameterIndex,
    uint srcData,
    uint destOffsetIn32BitValues
) @inline =>
    self.vtbl.setGraphicsRoot32BitConstant(
        self,
        rootParameterIndex,
        srcData,
        destOffsetIn32BitValues);

fn void IGraphicsCommandList.setComputeRoot32BitConstants(
    &self,
    uint rootParameterIndex,
    uint num32BitValuesToSet,
    void* pSrcData,
    uint destOffsetIn32BitValues
) @inline =>
    self.vtbl.setComputeRoot32BitConstants(
        self,
        rootParameterIndex,
        num32BitValuesToSet,
        pSrcData,
        destOffsetIn32BitValues);

fn void IGraphicsCommandList.setGraphicsRoot32BitConstants(
    &self,
    uint rootParameterIndex,
    uint num32BitValuesToSet,
    void* pSrcData,
    uint destOffsetIn32BitValues
) @inline =>
    self.vtbl.setGraphicsRoot32BitConstants(
        self,
        rootParameterIndex,
        num32BitValuesToSet,
        pSrcData,
        destOffsetIn32BitValues);

fn void IGraphicsCommandList.setComputeRootConstantBufferView(
    &self,
    uint rootParameterIndex,
    GpuVirtualAddress bufferLocation
) @inline =>
    self.vtbl.setComputeRootConstantBufferView(self, rootParameterIndex, bufferLocation);

fn void IGraphicsCommandList.setGraphicsRootConstantBufferView(
    &self,
    uint rootParameterIndex,
    GpuVirtualAddress bufferLocation
) @inline =>
    self.vtbl.setGraphicsRootConstantBufferView(self, rootParameterIndex, bufferLocation);

fn void IGraphicsCommandList.setComputeRootShaderResourceView(
    &self,
    uint rootParameterIndex,
    GpuVirtualAddress bufferLocation
) @inline =>
    self.vtbl.setComputeRootShaderResourceView(self, rootParameterIndex, bufferLocation);

fn void IGraphicsCommandList.setGraphicsRootShaderResourceView(
    &self,
    uint rootParameterIndex,
    GpuVirtualAddress bufferLocation
) @inline =>
    self.vtbl.setGraphicsRootShaderResourceView(self, rootParameterIndex, bufferLocation);

fn void IGraphicsCommandList.setComputeRootUnorderedAccessView(
    &self,
    uint rootParameterIndex,
    GpuVirtualAddress bufferLocation
) @inline =>
    self.vtbl.setComputeRootUnorderedAccessView(self, rootParameterIndex, bufferLocation);

fn void IGraphicsCommandList.setGraphicsRootUnorderedAccessView(
    &self,
    uint rootParameterIndex,
    GpuVirtualAddress bufferLocation
) @inline =>
    self.vtbl.setGraphicsRootUnorderedAccessView(self, rootParameterIndex, bufferLocation);

fn void IGraphicsCommandList.iASetIndexBuffer(
    &self,
    IndexBufferView* pView
) @inline =>
    self.vtbl.iASetIndexBuffer(self, pView);

fn void IGraphicsCommandList.iASetVertexBuffers(
    &self,
    uint startSlot,
    uint numViews,
    VertexBufferView* pViews
) @inline =>
    self.vtbl.iASetVertexBuffers(self, startSlot, numViews, pViews);

fn void IGraphicsCommandList.sOSetTargets(
    &self,
    uint startSlot,
    uint numViews,
    StreamOutputBufferView* pViews
) @inline =>
    self.vtbl.sOSetTargets(self, startSlot, numViews, pViews);

fn void IGraphicsCommandList.oMSetRenderTargets(
    &self,
    uint numRenderTargetDescriptors,
    CpuDescriptorHandle* pRenderTargetDescriptors,
    Bool rTsSingleHandleToDescriptorRange,
    CpuDescriptorHandle* pDepthStencilDescriptor
) @inline =>
    self.vtbl.oMSetRenderTargets(
        self,
        numRenderTargetDescriptors,
        pRenderTargetDescriptors,
        rTsSingleHandleToDescriptorRange,
        pDepthStencilDescriptor);

fn void IGraphicsCommandList.clearDepthStencilView(
    &self,
    CpuDescriptorHandle depthStencilView,
    ClearFlags clearFlags,
    float depth,
    char stencil,
    uint numRects,
    Win32_RECT* pRects
) @inline =>
    self.vtbl.clearDepthStencilView(
        self,
        depthStencilView,
        clearFlags,
        depth,
        stencil,
        numRects,
        pRects);

fn void IGraphicsCommandList.clearRenderTargetView(
    &self,
    CpuDescriptorHandle renderTargetView,
    float[4] colorRGBA,
    uint numRects,
    Win32_RECT* pRects
) @inline =>
    self.vtbl.clearRenderTargetView(self, renderTargetView, colorRGBA, numRects, pRects);

fn void IGraphicsCommandList.clearUnorderedAccessViewUint(
    &self,
    GpuDescriptorHandle viewGPUHandleInCurrentHeap,
    CpuDescriptorHandle viewCPUHandle,
    IResource* pResource,
    uint[4] values,
    uint numRects,
    Win32_RECT* pRects
) @inline =>
    self.vtbl.clearUnorderedAccessViewUint(
        self,
        viewGPUHandleInCurrentHeap,
        viewCPUHandle,
        pResource,
        values,
        numRects,
        pRects);

fn void IGraphicsCommandList.clearUnorderedAccessViewFloat(
    &self,
    GpuDescriptorHandle viewGPUHandleInCurrentHeap,
    CpuDescriptorHandle viewCPUHandle,
    IResource* pResource,
    float[4] values,
    uint numRects,
    Win32_RECT* pRects
) @inline =>
    self.vtbl.clearUnorderedAccessViewFloat(
        self,
        viewGPUHandleInCurrentHeap,
        viewCPUHandle,
        pResource,
        values,
        numRects,
        pRects);

fn void IGraphicsCommandList.discardResource(
    &self,
    IResource* pResource,
    DiscardRegion* pRegion
) @inline =>
    self.vtbl.discardResource(self, pResource, pRegion);

fn void IGraphicsCommandList.beginQuery(
    &self,
    IQueryHeap* pQueryHeap,
    QueryType type,
    uint index
) @inline =>
    self.vtbl.beginQuery(self, pQueryHeap, type, index);

fn void IGraphicsCommandList.endQuery(
    &self,
    IQueryHeap* pQueryHeap,
    QueryType type,
    uint index
) @inline =>
    self.vtbl.endQuery(self, pQueryHeap, type, index);

fn void IGraphicsCommandList.resolveQueryData(
    &self,
    IQueryHeap* pQueryHeap,
    QueryType type,
    uint startIndex,
    uint numQueries,
    IResource* pDestinationBuffer,
    ulong alignedDestinationBufferOffset
) @inline =>
    self.vtbl.resolveQueryData(
        self,
        pQueryHeap,
        type,
        startIndex,
        numQueries,
        pDestinationBuffer,
        alignedDestinationBufferOffset);

fn void IGraphicsCommandList.setPredication(
    &self,
    IResource* pBuffer,
    ulong alignedBufferOffset,
    PredicationOp operation
) @inline =>
    self.vtbl.setPredication(self, pBuffer, alignedBufferOffset, operation);

fn void IGraphicsCommandList.setMarker(
    &self,
    uint metadata,
    void* pData,
    uint size
) @inline =>
    self.vtbl.setMarker(self, metadata, pData, size);

fn void IGraphicsCommandList.beginEvent(
    &self,
    uint metadata,
    void* pData,
    uint size
) @inline =>
    self.vtbl.beginEvent(self, metadata, pData, size);

fn void IGraphicsCommandList.endEvent(&self) @inline =>
    self.vtbl.endEvent(self);

fn void IGraphicsCommandList.executeIndirect(
    &self,
    ICommandSignature* pCommandSignature,
    uint maxCommandCount,
    IResource* pArgumentBuffer,
    ulong argumentBufferOffset,
    IResource* pCountBuffer,
    ulong countBufferOffset
) @inline =>
    self.vtbl.executeIndirect(
        self,
        pCommandSignature,
        maxCommandCount,
        pArgumentBuffer,
        argumentBufferOffset,
        pCountBuffer,
        countBufferOffset);

// Functions of IGraphicsCommandList1

fn void IGraphicsCommandList.atomicCopyBufferUINT(
    &self,
    IResource *pDstBuffer,
    ulong dstOffset,
    IResource *pSrcBuffer,
    ulong srcOffset,
    uint dependencies,
    IResource** ppDependentResources,
    SubresourceRangeUint64* pDependentSubresourceRanges
) @inline =>
    self.vtbl.atomicCopyBufferUINT(
        self,
        pDstBuffer,
        dstOffset,
        pSrcBuffer,
        srcOffset,
        dependencies,
        ppDependentResources,
        pDependentSubresourceRanges);

fn void IGraphicsCommandList.atomicCopyBufferUINT64(
    &self,
    IResource *pDstBuffer,
    ulong dstOffset,
    IResource *pSrcBuffer,
    ulong srcOffset,
    uint dependencies,
    IResource** ppDependentResources,
    SubresourceRangeUint64* pDependentSubresourceRanges
) @inline =>
    self.vtbl.atomicCopyBufferUINT64(
        self,
        pDstBuffer,
        dstOffset,
        pSrcBuffer,
        srcOffset,
        dependencies,
        ppDependentResources,
        pDependentSubresourceRanges);

fn void IGraphicsCommandList.oMSetDepthBounds(
    &self,
    float min,
    float max
) @inline =>
    self.vtbl.oMSetDepthBounds(self, min, max);

fn void IGraphicsCommandList.setSamplePositions(
    &self,
    uint numSamplesPerPixel,
    uint numPixels,
    SamplePosition* pSamplePositions
) @inline =>
    self.vtbl.setSamplePositions(self, numSamplesPerPixel, numPixels, pSamplePositions);

fn void IGraphicsCommandList.resolveSubresourceRegion(
    &self,
    IResource *pDstResource,
    uint dstSubresource,
    uint dstX,
    uint dstY,
    IResource *pSrcResource,
    uint srcSubresource,
    Win32_RECT *pSrcRect,
    Format format,
    ResolveMode resolveMode
) @inline =>
    self.vtbl.resolveSubresourceRegion(
        self,
        pDstResource,
        dstSubresource,
        dstX,
        dstY,
        pSrcResource,
        srcSubresource,
        pSrcRect,
        format,
        resolveMode);

fn void IGraphicsCommandList.setViewInstanceMask(
    &self,
    uint mask
) @inline =>
    self.vtbl.setViewInstanceMask(self, mask);

// Functions of IGraphicsCommandList2

fn void IGraphicsCommandList.writeBufferImmediate(
    &self,
    uint count,
    WritebufferimmediateParameter* pParams,
    WritebufferimmediateMode* pModes
) @inline =>
    self.vtbl.writeBufferImmediate(self, count, pParams, pModes);

// Functions of IGraphicsCommandList3

fn void IGraphicsCommandList.setProtectedResourceSession(
    &self,
    IProtectedResourceSession* pProtectedResourceSession
) @inline =>
    self.vtbl.setProtectedResourceSession(self, pProtectedResourceSession);

// Functions of IGraphicsCommandList4

fn void IGraphicsCommandList.beginRenderPass(
    &self,
    uint numRenderTargets,
    RenderPassRenderTargetDesc* pRenderTargets,
    RenderPassDepthStencilDesc* pDepthStencil,
    RenderPassFlags flags
) @inline =>
    self.vtbl.beginRenderPass(self, numRenderTargets, pRenderTargets, pDepthStencil, flags);

fn void IGraphicsCommandList.endRenderPass(&self) @inline =>
    self.vtbl.endRenderPass(self);

fn void IGraphicsCommandList.initializeMetaCommand(
    &self,
    IMetaCommand* pMetaCommand,
    void* pInitializationParametersData,
    Win32_SIZE_T initializationParametersDataSizeInBytes
) @inline =>
    self.vtbl.initializeMetaCommand(
        self,
        pMetaCommand,
        pInitializationParametersData,
        initializationParametersDataSizeInBytes);

fn void IGraphicsCommandList.executeMetaCommand(
    &self,
    IMetaCommand* pMetaCommand,
    void* pExecutionParametersData,
    Win32_SIZE_T executionParametersDataSizeInBytes
) @inline =>
    self.vtbl.executeMetaCommand(
        self,
        pMetaCommand,
        pExecutionParametersData,
        executionParametersDataSizeInBytes);

fn void IGraphicsCommandList.buildRaytracingAccelerationStructure(
    &self,
    BuildRaytracingAccelerationStructureDesc* pDesc,
    uint numPostbuildInfoDescs,
    RaytracingAccelerationStructurePostbuildInfoDesc* pPostbuildInfoDescs
) @inline =>
    self.vtbl.buildRaytracingAccelerationStructure(
        self,
        pDesc,
        numPostbuildInfoDescs,
        pPostbuildInfoDescs);

fn void IGraphicsCommandList.emitRaytracingAccelerationStructurePostbuildInfo(
    &self,
    RaytracingAccelerationStructurePostbuildInfoDesc* pDesc,
    uint numSourceAccelerationStructures,
    GpuVirtualAddress* pSourceAccelerationStructureData
) @inline =>
    self.vtbl.emitRaytracingAccelerationStructurePostbuildInfo(
        self,
        pDesc,
        numSourceAccelerationStructures,
        pSourceAccelerationStructureData);

fn void IGraphicsCommandList.copyRaytracingAccelerationStructure(
    &self,
    GpuVirtualAddress destAccelerationStructureData,
    GpuVirtualAddress sourceAccelerationStructureData,
    RaytracingAccelerationStructureCopyMode mode
) @inline =>
    self.vtbl.copyRaytracingAccelerationStructure(
        self,
        destAccelerationStructureData,
        sourceAccelerationStructureData,
        mode);

fn void IGraphicsCommandList.setPipelineState1(
    &self,
    IStateObject* pStateObject
) @inline =>
    self.vtbl.setPipelineState1(self, pStateObject);

fn void IGraphicsCommandList.dispatchRays(
    &self,
    DispatchRaysDesc* pDesc
) @inline =>
    self.vtbl.dispatchRays(self, pDesc);

// Functions of IGraphicsCommandList5

fn void IGraphicsCommandList.rsSetShadingRate(
    &self,
    ShadingRate baseShadingRate,
    ShadingRateCombiner* combiners
) @inline =>
    self.vtbl.rsSetShadingRate(self, baseShadingRate, combiners);

fn void IGraphicsCommandList.rsSetShadingRateImage(
    &self,
    IResource* shadingRateImage
) @inline =>
    self.vtbl.rsSetShadingRateImage(self, shadingRateImage);

// Functions of IGraphicsCommandList6

fn void IGraphicsCommandList.dispatchMesh(
    &self,
    uint threadGroupCountX,
    uint threadGroupCountY,
    uint threadGroupCountZ
) @inline =>
    self.vtbl.dispatchMesh(self, threadGroupCountX, threadGroupCountY, threadGroupCountZ);

// Functions of IGraphicsCommandList7

fn void IGraphicsCommandList.barrier(
    &self,
    uint numBarrierGroups,
    BarrierGroup* pBarrierGroups
) @inline =>
    self.vtbl.barrier(self, numBarrierGroups, pBarrierGroups);

// Functions of IGraphicsCommandList8

fn void IGraphicsCommandList.omSetFrontAndBackStencilRef(
    &self,
    uint frontStencilRef,
    uint backStencilRef
) @inline =>
    self.vtbl.omSetFrontAndBackStencilRef(self, frontStencilRef, backStencilRef);

// Functions of IGraphicsCommandList9

fn void IGraphicsCommandList.rsSetDepthBias(
    &self,
    float depthBias,
    float depthBiasClamp,
    float slopeScaledDepthBias
) @inline =>
    self.vtbl.rsSetDepthBias(self, depthBias, depthBiasClamp, slopeScaledDepthBias);

fn void IGraphicsCommandList.iaSetIndexBufferStripCutValue(
    &self,
    IndexBufferStripCutValue ibstripCutValue
) @inline =>
    self.vtbl.iaSetIndexBufferStripCutValue(self, ibstripCutValue);

// Functions of IGraphicsCommandList10

fn void IGraphicsCommandList.setProgram(
    &self,
    SetProgramDesc* pDesc
) @inline =>
    self.vtbl.setProgram(self, pDesc);

fn void IGraphicsCommandList.dispatchGraph(
    &self,
    DispatchGraphDesc* pDesc
) @inline =>
    self.vtbl.dispatchGraph(self, pDesc);

// ---

struct WritebufferimmediateParameter
{
    GpuVirtualAddress dest;
    uint value;
}

enum WritebufferimmediateMode : int
{
    DEFAULT,
    MARKER_IN,
    MARKER_OUT,
}

// =============================================================================
// ICommandQueue
// =============================================================================

const ICOMMAND_QUEUE_UUID_STRING = "0ec870a6-5d7e-4c22-8cfc-5baae07616ed";
const Win32_GUID ICOMMAND_QUEUE_UUID = {
    0x0ec870a6, 0x5d7e, 0x4c22, { 0x8c, 0xfc, 0x5b, 0xaa, 0xe0, 0x76, 0x16, 0xed } };

struct ICommandQueue
{
    ICommandQueueVTable* vtbl;
}

alias ICommandQueue_UpdateTileMappingsFn = fn void (
    void* self,
    IResource* pResource,
    uint numResourceRegions,
    TiledResourceCoordinate* pResourceRegionStartCoordinates,
    TileRegionSize* pResourceRegionSizes,
    IHeap* pHeap,
    uint numRanges,
    TileRangeFlags* pRangeFlags,
    uint* pHeapRangeStartOffsets,
    uint* pRangeTileCounts,
    TileMappingFlags flags);

alias ICommandQueue_CopyTileMappingsFn = fn void (
    void* self,
    IResource* pDstResource,
    TiledResourceCoordinate* pDstRegionStartCoordinate,
    IResource* pSrcResource,
    TiledResourceCoordinate* pSrcRegionStartCoordinate,
    TileRegionSize* pRegionSize,
    TileMappingFlags flags);

alias ICommandQueue_ExecuteCommandListsFn = fn void (
    void* self,
    uint numCommandLists,
    ICommandList** ppCommandLists);

alias ICommandQueue_SetMarkerFn = fn void (
    void* self,
    uint metadata,
    void* pData,
    uint size);

alias ICommandQueue_BeginEventFn = fn void (
    void* self,
    uint metadata,
    void* pData,
    uint size);

alias ICommandQueue_EndEventFn = fn void (void* self);

alias ICommandQueue_SignalFn = fn Win32_HRESULT (
    void* self,
    IFence* pFence,
    ulong value);

alias ICommandQueue_WaitFn = fn Win32_HRESULT (
    void* self,
    IFence* pFence,
    ulong value);

alias ICommandQueue_GetTimestampFrequencyFn = fn Win32_HRESULT (
    void* self,
    ulong* pFrequency);

alias ICommandQueue_GetClockCalibrationFn = fn Win32_HRESULT (
    void* self,
    ulong* pGpuTimestamp,
    ulong* pCpuTimestamp);

alias ICommandQueue_GetDescFn = fn CommandQueueDesc (void* self);

struct ICommandQueueVTable
{
    inline IPageableVTable _base;
    ICommandQueue_UpdateTileMappingsFn updateTileMappings;
    ICommandQueue_CopyTileMappingsFn copyTileMappings;
    ICommandQueue_ExecuteCommandListsFn executeCommandLists;
    ICommandQueue_SetMarkerFn setMarker;
    ICommandQueue_BeginEventFn beginEvent;
    ICommandQueue_EndEventFn endEvent;
    ICommandQueue_SignalFn signal;
    ICommandQueue_WaitFn wait;
    ICommandQueue_GetTimestampFrequencyFn getTimestampFrequency;
    ICommandQueue_GetClockCalibrationFn getClockCalibration;
    ICommandQueue_GetDescFn getDesc;
}

// Functions of IUnknown

fn Win32_HRESULT ICommandQueue.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ICommandQueue.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ICommandQueue.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT ICommandQueue.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT ICommandQueue.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT ICommandQueue.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT ICommandQueue.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT ICommandQueue.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Functions of ICommandQueue

fn void ICommandQueue.updateTileMappings(&self,
    IResource* pResource,
    uint numResourceRegions,
    TiledResourceCoordinate* pResourceRegionStartCoordinates,
    TileRegionSize* pResourceRegionSizes,
    IHeap* pHeap,
    uint numRanges,
    TileRangeFlags* pRangeFlags,
    uint* pHeapRangeStartOffsets,
    uint* pRangeTileCounts,
    TileMappingFlags flags
) @inline =>
    self.vtbl.updateTileMappings(self,
        pResource,
        numResourceRegions,
        pResourceRegionStartCoordinates,
        pResourceRegionSizes,
        pHeap,
        numRanges,
        pRangeFlags,
        pHeapRangeStartOffsets,
        pRangeTileCounts,
        flags);

fn void ICommandQueue.copyTileMappings(&self,
    IResource* pDstResource,
    TiledResourceCoordinate* pDstRegionStartCoordinate,
    IResource* pSrcResource,
    TiledResourceCoordinate* pSrcRegionStartCoordinate,
    TileRegionSize* pRegionSize,
    TileMappingFlags flags
) @inline =>
    self.vtbl.copyTileMappings(self,
        pDstResource,
        pDstRegionStartCoordinate,
        pSrcResource,
        pSrcRegionStartCoordinate,
        pRegionSize,
        flags);

fn void ICommandQueue.executeCommandLists(
    &self,
    uint numCommandLists,
    ICommandList** ppCommandLists
) @inline =>
    self.vtbl.executeCommandLists(self,numCommandLists, ppCommandLists);

fn void ICommandQueue.setMarker(
    &self,
    uint metadata,
    void* pData,
    uint size
) @inline =>
    self.vtbl.setMarker(self,metadata, pData, size);

fn void ICommandQueue.beginEvent(
    &self,
    uint metadata,
    void* pData,
    uint size
) @inline =>
    self.vtbl.beginEvent(self, metadata, pData, size);

fn void ICommandQueue.endEvent(&self) @inline =>
    self.vtbl.endEvent(self);

fn Win32_HRESULT ICommandQueue.signal(
    &self,
    IFence* pFence,
    ulong value
) @inline =>
    self.vtbl.signal(self, pFence, value);

fn Win32_HRESULT ICommandQueue.wait(
    &self,
    IFence* pFence,
    ulong value
) @inline =>
    self.vtbl.wait(self, pFence, value);

fn Win32_HRESULT ICommandQueue.getTimestampFrequency(
    &self,
    ulong* pFrequency
) @inline =>
    self.vtbl.getTimestampFrequency(self, pFrequency);

fn Win32_HRESULT ICommandQueue.getClockCalibration(
    &self,
    ulong* pGpuTimestamp,
    ulong* pCpuTimestamp
) @inline =>
    self.vtbl.getClockCalibration(self, pGpuTimestamp, pCpuTimestamp);

fn CommandQueueDesc ICommandQueue.getDesc(&self) @inline =>
    self.vtbl.getDesc(self);

// =============================================================================
// IDevice
// =============================================================================

const IDEVICE_UUID_STRING = "189819f1-1db6-4b57-be54-1821339b85f7";
const Win32_GUID IDEVICE_UUID = {
    0x189819f1, 0x1db6, 0x4b57, { 0xbe, 0x54, 0x18, 0x21, 0x33, 0x9b, 0x85, 0xf7 } };

const IDEVICE1_UUID_STRING = "77acce80-638e-4e65-8895-c1f23386863e";
const Win32_GUID IDEVICE1_UUID = {
    0x77acce80, 0x638e, 0x4e65, { 0x88, 0x95, 0xc1, 0xf2, 0x33, 0x86, 0x86, 0x3e } };

const IDEVICE2_UUID_STRING = "30baa41e-b15b-475c-a0bb-1af5c5b64328";
const Win32_GUID IDEVICE2_UUID = {
    0x30baa41e, 0xb15b, 0x475c, { 0xa0, 0xbb, 0x1a, 0xf5, 0xc5, 0xb6, 0x43, 0x28 } };

const IDEVICE3_UUID_STRING = "81dadc15-2bad-4392-93c5-101345c4aa98";
const Win32_GUID IDEVICE3_UUID = {
    0x81dadc15, 0x2bad, 0x4392, { 0x93, 0xc5, 0x10, 0x13, 0x45, 0xc4, 0xaa, 0x98 } };

const IDEVICE4_UUID_STRING = "e865df17-a9ee-46f9-a463-3098315aa2e5";
const Win32_GUID IDEVICE4_UUID = {
    0xe865df17, 0xa9ee, 0x46f9, { 0xa4, 0x63, 0x30, 0x98, 0x31, 0x5a, 0xa2, 0xe5 } };

const IDEVICE5_UUID_STRING = "8b4f173b-2fea-4b80-8f58-4307191ab95d";
const Win32_GUID IDEVICE5_UUID = {
    0x8b4f173b, 0x2fea, 0x4b80, { 0x8f, 0x58, 0x43, 0x07, 0x19, 0x1a, 0xb9, 0x5d } };

const IDEVICE6_UUID_STRING = "c70b221b-40e4-4a17-89af-025a0727a6dc";
const Win32_GUID IDEVICE6_UUID = {
    0xc70b221b, 0x40e4, 0x4a17, { 0x89, 0xaf, 0x02, 0x5a, 0x07, 0x27, 0xa6, 0xdc } };

const IDEVICE7_UUID_STRING = "5c014b53-68a1-4b9b-8bd1-dd6046b9358b";
const Win32_GUID IDEVICE7_UUID = {
    0x5c014b53, 0x68a1, 0x4b9b, { 0x8b, 0xd1, 0xdd, 0x60, 0x46, 0xb9, 0x35, 0x8b } };

const IDEVICE8_UUID_STRING = "9218E6BB-F944-4F7E-A75C-B1B2C7B701F3";
const Win32_GUID IDEVICE8_UUID = {
    0x9218E6BB, 0xF944, 0x4F7E, { 0xA7, 0x5C, 0xB1, 0xB2, 0xC7, 0xB7, 0x01, 0xF3 } };

const IDEVICE9_UUID_STRING = "4c80e962-f032-4f60-bc9e-ebc2cfa1d83c";
const Win32_GUID IDEVICE9_UUID = {
    0x4c80e962, 0xf032, 0x4f60, { 0xbc, 0x9e, 0xeb, 0xc2, 0xcf, 0xa1, 0xd8, 0x3c } };

const IDEVICE10_UUID_STRING = "517f8718-aa66-49f9-b02b-a7ab89c06031";
const Win32_GUID IDEVICE10_UUID = {
    0x517f8718, 0xaa66, 0x49f9, { 0xb0, 0x2b, 0xa7, 0xab, 0x89, 0xc0, 0x60, 0x31 } };

const IDEVICE11_UUID_STRING = "5405c344-d457-444e-b4dd-2366e45aee39";
const Win32_GUID IDEVICE11_UUID = {
    0x5405c344, 0xd457, 0x444e, { 0xb4, 0xdd, 0x23, 0x66, 0xe4, 0x5a, 0xee, 0x39 } };

const IDEVICE12_UUID_STRING = "5af5c532-4c91-4cd0-b541-15a405395fc5";
const Win32_GUID IDEVICE12_UUID = {
    0x5af5c532, 0x4c91, 0x4cd0, { 0xb5, 0x41, 0x15, 0xa4, 0x05, 0x39, 0x5f, 0xc5 } };

const IDEVICE13_UUID_STRING = "14eecffc-4df8-40f7-a118-5c816f45695e";
const Win32_GUID IDEVICE13_UUID = {
    0x14eecffc, 0x4df8, 0x40f7, { 0xa1, 0x18, 0x5c, 0x81, 0x6f, 0x45, 0x69, 0x5e } };

const IDEVICE14_UUID_STRING = "5f6e592d-d895-44c2-8e4a-88ad4926d323";
const Win32_GUID IDEVICE14_UUID = {
    0x5f6e592d, 0xd895, 0x44c2, { 0x8e, 0x4a, 0x88, 0xad, 0x49, 0x26, 0xd3, 0x23 } };

struct IDevice
{
    IDeviceVTable* vtbl;
}

typedef IDevice1  = IDevice;
typedef IDevice2  = IDevice;
typedef IDevice3  = IDevice;
typedef IDevice4  = IDevice;
typedef IDevice5  = IDevice;
typedef IDevice6  = IDevice;
typedef IDevice7  = IDevice;
typedef IDevice8  = IDevice;
typedef IDevice9  = IDevice;
typedef IDevice10 = IDevice;
typedef IDevice11 = IDevice;
typedef IDevice12 = IDevice;
typedef IDevice13 = IDevice;
typedef IDevice14 = IDevice;

// Function pointers of IDevice

alias IDevice_GetNodeCountFn = fn uint (void* self);

alias IDevice_CreateCommandQueueFn = fn Win32_HRESULT (
    void* self,
    CommandQueueDesc* pDesc,
    Win32_GUID* riid,
    void** ppCommandQueue);

alias IDevice_CreateCommandAllocatorFn = fn Win32_HRESULT (
    void* self,
    CommandListType type,
    Win32_GUID* riid,
    void** ppCommandAllocator);

alias IDevice_CreateGraphicsPipelineStateFn = fn Win32_HRESULT (
    void* self,
    GraphicsPipelineStateDesc* pDesc,
    Win32_GUID* riid,
    void** ppPipelineState);

alias IDevice_CreateComputePipelineStateFn =fn Win32_HRESULT (
    void* self,
    ComputePipelineStateDesc* pDesc,
    Win32_GUID* riid,
    void** ppPipelineState);

alias IDevice_CreateCommandListFn = fn Win32_HRESULT (
    void* self,
    uint nodeMask,
    CommandListType type,
    ICommandAllocator* pCommandAllocator,
    IPipelineState* pInitialState,
    Win32_GUID* riid,
    void** ppCommandList);

alias IDevice_CheckFeatureSupportFn = fn Win32_HRESULT (
    void* self,
    Feature feature,
    void* pFeatureSupportData,
    uint featureSupportDataSize);

alias IDevice_CreateDescriptorHeapFn = fn Win32_HRESULT (
    void* self,
    DescriptorHeapDesc* pDescriptorHeapDesc,
    Win32_GUID* riid,
    void** ppvHeap);

alias IDevice_GetDescriptorHandleIncrementSizeFn = fn uint (
    void* self,
    DescriptorHeapType descriptorHeapType);

alias IDevice_CreateRootSignatureFn = fn Win32_HRESULT (
    void* self,
    uint nodeMask,
    void* pBlobWithRootSignature,
    Win32_SIZE_T blobLengthInBytes,
    Win32_GUID* riid,
    void** ppvRootSignature);

alias IDevice_CreateConstantBufferViewFn = fn void (
    void* self,
    ConstantBufferViewDesc* pDesc,
    CpuDescriptorHandle destDescriptor);

alias IDevice_CreateShaderResourceViewFn = fn void (
    void* self,
    IResource* pResource,
    ShaderResourceViewDesc* pDesc,
    CpuDescriptorHandle destDescriptor);

alias IDevice_CreateUnorderedAccessViewFn = fn void (
    void* self,
    IResource* pResource,
    IResource* pCounterResource,
    UnorderedAccessViewDesc* pDesc,
    CpuDescriptorHandle destDescriptor);

alias IDevice_CreateRenderTargetViewFn = fn void (
    void* self,
    IResource* pResource,
    RenderTargetViewDesc* pDesc,
    CpuDescriptorHandle destDescriptor);

alias IDevice_CreateDepthStencilViewFn = fn void (
    void* self,
    IResource* pResource,
    DepthStencilViewDesc* pDesc,
    CpuDescriptorHandle destDescriptor);

alias IDevice_CreateSamplerFn = fn void (
    void* self,
    SamplerDesc* pDesc,
    CpuDescriptorHandle destDescriptor);

alias IDevice_CopyDescriptorsFn = fn void (
    void* self,
    uint numDestDescriptorRanges,
    CpuDescriptorHandle* pDestDescriptorRangeStarts,
    uint* pDestDescriptorRangeSizes,
    uint numSrcDescriptorRanges,
    CpuDescriptorHandle* pSrcDescriptorRangeStarts,
    uint* pSrcDescriptorRangeSizes,
    DescriptorHeapType descriptorHeapsType);

alias IDevice_CopyDescriptorsSimpleFn = fn void (
    void* self,
    uint numDescriptors,
    CpuDescriptorHandle destDescriptorRangeStart,
    CpuDescriptorHandle srcDescriptorRangeStart,
    DescriptorHeapType descriptorHeapsType);

alias IDevice_GetResourceAllocationInfoFn = fn ResourceAllocationInfo* (
    void* self,
    ResourceAllocationInfo* retVal,
    uint visibleMask,
    uint numResourceDescs,
    ResourceDesc* pResourceDescs);

alias IDevice_GetCustomHeapPropertiesFn = fn HeapProperties* (
    void* self,
    HeapProperties* retVal,
    uint nodeMask,
    HeapType heapType);

alias IDevice_CreateCommittedResourceFn = fn Win32_HRESULT (
    void* self,
    HeapProperties* pHeapProperties,
    HeapFlags heapFlags,
    ResourceDesc* pDesc,
    ResourceStates initialResourceState,
    ClearValue* pOptimizedClearValue,
    Win32_GUID* riidResource,
    void** ppvResource);

alias IDevice_CreateHeapFn = fn Win32_HRESULT (
    void* self, HeapDesc* pDesc, Win32_GUID* riid, void** ppvHeap);

alias IDevice_CreatePlacedResourceFn = fn Win32_HRESULT (
    void* self,
    IHeap* pHeap,
    ulong heapOffset,
    ResourceDesc* pDesc,
    ResourceStates initialState,
    ClearValue* pOptimizedClearValue,
    Win32_GUID* riid,
    void** ppvResource);

alias IDevice_CreateReservedResourceFn = fn Win32_HRESULT (
    void* self,
    ResourceDesc* pDesc,
    ResourceStates initialState,
    ClearValue* pOptimizedClearValue,
    Win32_GUID* riid,
    void** ppvResource);

alias IDevice_CreateSharedHandleFn = fn Win32_HRESULT (
    void* self,
    IDeviceChild* pObject,
    Win32_SECURITY_ATTRIBUTES* pAttributes,
    Win32_DWORD access,
    Win32_LPCWSTR name,
    Win32_HANDLE* pHandle);

alias IDevice_OpenSharedHandleFn = fn Win32_HRESULT (
    void* self,
    Win32_HANDLE nTHandle,
    Win32_GUID* riid,
    void** ppvObj);

alias IDevice_OpenSharedHandleByNameFn = fn Win32_HRESULT (
    void* self,
    Win32_LPCWSTR name,
    Win32_DWORD access,
    Win32_HANDLE* pNTHandle);

alias IDevice_MakeResidentFn = fn Win32_HRESULT (
    void* self,
    uint numObjects,
    IPageable** ppObjects);

alias IDevice_EvictFn = fn Win32_HRESULT (
    void* self,
    uint numObjects,
    IPageable** ppObjects);

alias IDevice_CreateFenceFn = fn Win32_HRESULT (
    void* self,
    ulong initialValue,
    FenceFlags flags,
    Win32_GUID* riid,
    void** ppFence);

alias IDevice_GetDeviceRemovedReasonFn = fn Win32_HRESULT (void* self);

alias IDevice_GetCopyableFootprintsFn = fn void (
    void* self,
    ResourceDesc* pResourceDesc,
    uint firstSubresource,
    uint numSubresources,
    ulong baseOffset,
    PlacedSubresourceFootprint* pLayouts,
    uint* pNumRows,
    ulong* pRowSizeInBytes,
    ulong* pTotalBytes);

alias IDevice_CreateQueryHeapFn = fn Win32_HRESULT (
    void* self,
    QueryHeapDesc* pDesc,
    Win32_GUID* riid,
    void** ppvHeap);

alias IDevice_SetStablePowerStateFn = fn Win32_HRESULT (
    void* self,
    Bool enable);

alias IDevice_CreateCommandSignatureFn = fn Win32_HRESULT (
    void* self,
    CommandSignatureDesc* pDesc,
    IRootSignature* pRootSignature,
    Win32_GUID* riid,
    void** ppvCommandSignature);

alias IDevice_GetResourceTilingFn = fn void (
    void* self,
    IResource* pTiledResource,
    uint* pNumTilesForEntireResource,
    PackedMipInfo* pPackedMipDesc,
    TileShape* pStandardTileShapeForNonPackedMips,
    uint* pNumSubresourceTilings,
    uint firstSubresourceTilingToGet,
    SubresourceTiling* pSubresourceTilingsForNonPackedMips);

alias IDevice_GetAdapterLuidFn = fn Win32_LUID* (
    void* self,
    Win32_LUID* retVal);

// Function pointers of IDevice1

alias IDevice1_CreatePipelineLibraryFn = fn Win32_HRESULT (
    void* self,
    void* pLibraryBlob,
    Win32_SIZE_T blobLength,
    Win32_GUID* riid,
    void** ppPipelineLibrary);

alias IDevice1_SetEventOnMultipleFenceCompletionFn = fn Win32_HRESULT (
    void* self,
    IFence** ppFences,
    ulong* pFenceValues,
    uint numFences,
    MultipleFenceWaitFlags flags,
    Win32_HANDLE hEvent);

alias IDevice1_SetResidencyPriorityFn = fn Win32_HRESULT (
    void* self,
    uint numObjects,
    IPageable** ppObjects,
    ResidencyPriority* pPriorities);

// Function pointers of IDevice2

alias IDevice2_CreatePipelineStateFn = fn Win32_HRESULT (
    void* self,
    PipelineStateStreamDesc* pDesc,
    Win32_GUID* riid,
    void** ppPipelineState);

// Function pointers of IDevice3

alias IDevice3_OpenExistingHeapFromAddressFn = fn Win32_HRESULT (
    void* self,
    void* pAddress,
    Win32_GUID* riid,
    void** ppvHeap);

alias IDevice3_OpenExistingHeapFromFileMappingFn = fn Win32_HRESULT (
    void* self,
    Win32_HANDLE hFileMapping,
    Win32_GUID* riid,
    void** ppvHeap);

alias IDevice3_EnqueueMakeResidentFn = fn Win32_HRESULT (
    void* self,
    ResidencyFlags flags,
    uint numObjects,
    IPageable** ppObjects,
    IFence* pFenceToSignal,
    ulong fenceValueToSignal);

// Function pointers of IDevice4

alias IDevice4_CreateCommandList1Fn = fn Win32_HRESULT (
    void* self,
    uint nodeMask,
    CommandListType type,
    CommandListFlags flags,
    Win32_GUID* riid,
    void** ppCommandList);

alias IDevice4_CreateProtectedResourceSessionFn = fn Win32_HRESULT (
    void* self,
    ProtectedResourceSessionDesc* pDesc,
    Win32_GUID* riid,
    void** ppSession);

alias IDevice4_CreateCommittedResource1Fn = fn Win32_HRESULT (
    void* self,
    HeapProperties* pHeapProperties,
    HeapFlags heapFlags,
    ResourceDesc* pDesc,
    ResourceStates initialResourceState,
    ClearValue* pOptimizedClearValue,
    IProtectedResourceSession* pProtectedSession,
    Win32_GUID* riidResource,
    void** ppvResource);

alias IDevice4_CreateHeap1Fn = fn Win32_HRESULT (
    void* self,
    HeapDesc* pDesc,
    IProtectedResourceSession* pProtectedSession,
    Win32_GUID* riid,
    void** ppvHeap);

alias IDevice4_CreateReservedResource1Fn = fn Win32_HRESULT (
    void* self,
    ResourceDesc* pDesc,
    ResourceStates initialState,
    ClearValue* pOptimizedClearValue,
    IProtectedResourceSession* pProtectedSession,
    Win32_GUID* riid,
    void** ppvResource);

alias IDevice4_GetResourceAllocationInfo1Fn = fn ResourceAllocationInfo* (
    void* self,
    ResourceAllocationInfo* retVal,
    uint visibleMask,
    uint numResourceDescs,
    ResourceDesc* pResourceDescs,
    ResourceAllocationInfo1* pResourceAllocationInfo1);

// Function pointers of IDevice5

alias IDevice5_CreateLifetimeTrackerFn = fn Win32_HRESULT (
    void* self,
    ILifetimeOwner* pOwner,
    Win32_GUID* riid,
    void** ppvTracker);

alias IDevice5_RemoveDeviceFn = fn void (void* self);

alias IDevice5_EnumerateMetaCommandsFn = fn Win32_HRESULT (
    void* self,
    uint* pNumMetaCommands,
    MetaCommandDesc* pDescs);

alias IDevice5_EnumerateMetaCommandParametersFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* commandId,
    MetaCommandParameterStage stage,
    uint *pTotalStructureSizeInBytes,
    uint *pParameterCount,
    MetaCommandParameterDesc* pParameterDescs);

alias IDevice5_CreateMetaCommandFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* commandId,
    uint nodeMask,
    void* pCreationParametersData,
    Win32_SIZE_T creationParametersDataSizeInBytes,
    Win32_GUID* riid,
    void** ppMetaCommand);

alias IDevice5_CreateStateObjectFn = fn Win32_HRESULT (
    void* self,
    StateObjectDesc* pDesc,
    Win32_GUID* riid,
    void** ppStateObject);

alias IDevice5_GetRaytracingAccelerationStructurePrebuildInfoFn = fn void (
    void* self,
    BuildRaytracingAccelerationStructureInputs* pDesc,
    RaytracingAccelerationStructurePrebuildInfo* pInfo);

alias IDevice5_CheckDriverMatchingIdentifierFn = fn DriverMatchingIdentifierStatus (
    void* self,
    SerializedDataType serializedDataType,
    SerializedDataDriverMatchingIdentifier* pIdentifierToCheck);

// Function pointers of IDevice6

alias IDevice6_SetBackgroundProcessingModeFn = fn Win32_HRESULT (
    void* self,
    BackgroundProcessingMode mode,
    MeasurementsAction measurementsAction,
    Win32_HANDLE hEventToSignalUponCompletion,
    Bool* pbFurtherMeasurementsDesired);

// Function pointers of IDevice7

alias IDevice7_AddToStateObjectFn = fn Win32_HRESULT (
    void* self,
    StateObjectDesc* pAddition,
    IStateObject* pStateObjectToGrowFrom,
    Win32_GUID* riid,
    void** ppNewStateObject);

alias IDevice7_CreateProtectedResourceSession1Fn = fn Win32_HRESULT (
    void* self,
    ProtectedResourceSessionDesc1* pDesc,
    Win32_GUID* riid,
    void** ppSession);

// Function pointers of IDevice8

alias IDevice8_GetResourceAllocationInfo2Fn = fn ResourceAllocationInfo* (
    void* self,
    ResourceAllocationInfo* retVal,
    uint visibleMask,
    uint numResourceDescs,
    ResourceDesc1* pResourceDescs,
    ResourceAllocationInfo1* pResourceAllocationInfo1);

alias IDevice8_CreateCommittedResource2Fn = fn Win32_HRESULT (
    void* self,
    HeapProperties* pHeapProperties,
    HeapFlags heapFlags,
    ResourceDesc1* pDesc,
    ResourceStates initialResourceState,
    ClearValue* pOptimizedClearValue,
    IProtectedResourceSession* pProtectedSession,
    Win32_GUID* riidResource,
    void** ppvResource);

alias IDevice8_CreatePlacedResource1Fn = fn Win32_HRESULT (
    void* self,
    IHeap *pHeap,
    ulong heapOffset,
    ResourceDesc1* pDesc,
    ResourceStates initialState,
    ClearValue* pOptimizedClearValue,
    Win32_GUID* riid,
    void** ppvResource);

alias IDevice8_CreateSamplerFeedbackUnorderedAccessViewFn = fn void (
    void* self,
    IResource* pTargetedResource,
    IResource* pFeedbackResource,
    CpuDescriptorHandle destDescriptor);

alias IDevice8_GetCopyableFootprints1Fn = fn void (
    void* self,
    ResourceDesc1* pResourceDesc,
    uint firstSubresource,
    uint numSubresources,
    ulong baseOffset,
    PlacedSubresourceFootprint* pLayouts,
    uint* pNumRows,
    ulong* pRowSizeInBytes,
    ulong* pTotalBytes);

// Function pointers of IDevice9

alias IDevice9_CreateShaderCacheSessionFn = fn Win32_HRESULT (
    void* self,
    ShaderCacheSessionDesc* pDesc,
    Win32_GUID* riid,
    void** ppvSession);

alias IDevice9_ShaderCacheControlFn = fn Win32_HRESULT (
    void* self,
    ShaderCacheKindFlags kinds,
    ShaderCacheControlFlags control);

alias IDevice9_CreateCommandQueue1Fn = fn Win32_HRESULT (
    void* self,
    CommandQueueDesc* pDesc,
    Win32_GUID* creatorID,
    Win32_GUID* riid,
    void** ppCommandQueue);

// Function pointers of IDevice10

alias IDevice10_CreateCommittedResource3Fn = fn Win32_HRESULT (
    void* self,
    HeapProperties* pHeapProperties,
    HeapFlags heapFlags,
    ResourceDesc1* pDesc,
    BarrierLayout initialLayout,
    ClearValue* pOptimizedClearValue,
    IProtectedResourceSession *pProtectedSession,
    uint numCastableFormats,
    Format* pCastableFormats,
    Win32_GUID* riidResource,
    void** ppvResource);

alias IDevice10_CreatePlacedResource2Fn = fn Win32_HRESULT (
    void* self,
    IHeap *pHeap,
    ulong heapOffset,
    ResourceDesc1* pDesc,
    BarrierLayout initialLayout,
    ClearValue* pOptimizedClearValue,
    uint numCastableFormats,
    Format* pCastableFormats,
    Win32_GUID* riid,
    void** ppvResource);

alias IDevice10_CreateReservedResource2Fn = fn Win32_HRESULT (
    void* self,
    ResourceDesc* pDesc,
    BarrierLayout initialLayout,
    ClearValue* pOptimizedClearValue,
    IProtectedResourceSession *pProtectedSession,
    uint numCastableFormats,
    Format* pCastableFormats,
    Win32_GUID* riid,
    void** ppvResource);

// Function pointers of IDevice11

alias IDevice11_CreateSampler2Fn = fn void (
    void* self,
    SamplerDesc2* pDesc,
    CpuDescriptorHandle destDescriptor);

// Function pointers of IDevice12

alias IDevice12_GetResourceAllocationInfo3Fn = fn ResourceAllocationInfo* (
    void* self,
    ResourceAllocationInfo* retVal,
    uint visibleMask,
    uint numResourceDescs,
    ResourceDesc1* pResourceDescs,
    uint* pNumCastableFormats,
    Format** ppCastableFormats,
    ResourceAllocationInfo1* pResourceAllocationInfo1);

// Function pointers of IDevice13

alias IDevice13_OpenExistingHeapFromAddress1Fn = fn Win32_HRESULT (
    void* self,
    void* pAddress,
    Win32_SIZE_T size,
    Win32_GUID* riid,
    void** ppvHeap);

// Function pointers of IDevice14

alias IDevice14_CreateRootSignatureFromSubobjectInLibraryFn = fn Win32_HRESULT (
    void* self,
    uint nodeMask,
    void* pLibraryBlob,
    Win32_SIZE_T blobLengthInBytes,
    Win32_LPCWSTR subobjectName,
    Win32_GUID* riid,
    void** ppvRootSignature);

struct IDeviceVTable
{
    inline IObjectVTable _base;

    // IDevice
    IDevice_GetNodeCountFn getNodeCount;
    IDevice_CreateCommandQueueFn createCommandQueue;
    IDevice_CreateCommandAllocatorFn createCommandAllocator;
    IDevice_CreateGraphicsPipelineStateFn createGraphicsPipelineState;
    IDevice_CreateComputePipelineStateFn createComputePipelineState;
    IDevice_CreateCommandListFn createCommandList;
    IDevice_CheckFeatureSupportFn checkFeatureSupport;
    IDevice_CreateDescriptorHeapFn createDescriptorHeap;
    IDevice_GetDescriptorHandleIncrementSizeFn getDescriptorHandleIncrementSize;
    IDevice_CreateRootSignatureFn createRootSignature;
    IDevice_CreateConstantBufferViewFn createConstantBufferView;
    IDevice_CreateShaderResourceViewFn createShaderResourceView;
    IDevice_CreateUnorderedAccessViewFn createUnorderedAccessView;
    IDevice_CreateRenderTargetViewFn createRenderTargetView;
    IDevice_CreateDepthStencilViewFn createDepthStencilView;
    IDevice_CreateSamplerFn createSampler;
    IDevice_CopyDescriptorsFn copyDescriptors;
    IDevice_CopyDescriptorsSimpleFn copyDescriptorsSimple;
    IDevice_GetResourceAllocationInfoFn getResourceAllocationInfo;
    IDevice_GetCustomHeapPropertiesFn getCustomHeapProperties;
    IDevice_CreateCommittedResourceFn createCommittedResource;
    IDevice_CreateHeapFn createHeap;
    IDevice_CreatePlacedResourceFn createPlacedResource;
    IDevice_CreateReservedResourceFn createReservedResource;
    IDevice_CreateSharedHandleFn createSharedHandle;
    IDevice_OpenSharedHandleFn openSharedHandle;
    IDevice_OpenSharedHandleByNameFn openSharedHandleByName;
    IDevice_MakeResidentFn makeResident;
    IDevice_EvictFn evict;
    IDevice_CreateFenceFn createFence;
    IDevice_GetDeviceRemovedReasonFn getDeviceRemovedReason;
    IDevice_GetCopyableFootprintsFn getCopyableFootprints;
    IDevice_CreateQueryHeapFn createQueryHeap;
    IDevice_SetStablePowerStateFn setStablePowerState;
    IDevice_CreateCommandSignatureFn createCommandSignature;
    IDevice_GetResourceTilingFn getResourceTiling;
    IDevice_GetAdapterLuidFn getAdapterLuid;

    // IDevice1
    IDevice1_CreatePipelineLibraryFn createPipelineLibrary;
    IDevice1_SetEventOnMultipleFenceCompletionFn setEventOnMultipleFenceCompletion;
    IDevice1_SetResidencyPriorityFn setResidencyPriority;

    // IDevice2
    IDevice2_CreatePipelineStateFn createPipelineState;

    // IDevice3
    IDevice3_OpenExistingHeapFromAddressFn openExistingHeapFromAddress;
    IDevice3_OpenExistingHeapFromFileMappingFn openExistingHeapFromFileMapping;
    IDevice3_EnqueueMakeResidentFn enqueueMakeResident;

    // IDevice4
    IDevice4_CreateCommandList1Fn createCommandList1;
    IDevice4_CreateProtectedResourceSessionFn createProtectedResourceSession;
    IDevice4_CreateCommittedResource1Fn createCommittedResource1;
    IDevice4_CreateHeap1Fn createHeap1;
    IDevice4_CreateReservedResource1Fn createReservedResource1;
    IDevice4_GetResourceAllocationInfo1Fn getResourceAllocationInfo1;

    // IDevice5
    IDevice5_CreateLifetimeTrackerFn createLifetimeTracker;
    IDevice5_RemoveDeviceFn removeDevice;
    IDevice5_EnumerateMetaCommandsFn enumerateMetaCommands;
    IDevice5_EnumerateMetaCommandParametersFn enumerateMetaCommandParameters;
    IDevice5_CreateMetaCommandFn createMetaCommand;
    IDevice5_CreateStateObjectFn createStateObject;
    IDevice5_GetRaytracingAccelerationStructurePrebuildInfoFn
        getRaytracingAccelerationStructurePrebuildInfo;
    IDevice5_CheckDriverMatchingIdentifierFn checkDriverMatchingIdentifier;

    // IDevice6
    IDevice6_SetBackgroundProcessingModeFn setBackgroundProcessingMode;

    // IDevice7
    IDevice7_AddToStateObjectFn addToStateObject;
    IDevice7_CreateProtectedResourceSession1Fn createProtectedResourceSession1;

    // IDevice8
    IDevice8_GetResourceAllocationInfo2Fn getResourceAllocationInfo2;
    IDevice8_CreateCommittedResource2Fn createCommittedResource2;
    IDevice8_CreatePlacedResource1Fn createPlacedResource1;
    IDevice8_CreateSamplerFeedbackUnorderedAccessViewFn createSamplerFeedbackUnorderedAccessView;
    IDevice8_GetCopyableFootprints1Fn getCopyableFootprints1;

    // IDevice9
    IDevice9_CreateShaderCacheSessionFn createShaderCacheSession;
    IDevice9_ShaderCacheControlFn shaderCacheControl;
    IDevice9_CreateCommandQueue1Fn createCommandQueue1;

    // IDevice10
    IDevice10_CreateCommittedResource3Fn createCommittedResource3;
    IDevice10_CreatePlacedResource2Fn createPlacedResource2;
    IDevice10_CreateReservedResource2Fn createReservedResource2;

    // IDevice11
    IDevice11_CreateSampler2Fn createSampler2;

    // IDevice12
    IDevice12_GetResourceAllocationInfo3Fn getResourceAllocationInfo3;

    // IDevice13
    IDevice13_OpenExistingHeapFromAddress1Fn openExistingHeapFromAddress1;

    // IDevice14
    IDevice14_CreateRootSignatureFromSubobjectInLibraryFn createRootSignatureFromSubobjectInLibrary;
}

// Functions of IUnknown

fn Win32_HRESULT IDevice.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDevice.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDevice.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IDevice.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IDevice.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IDevice.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IDevice.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDevice

fn uint IDevice.getNodeCount(&self) @inline =>
    self.vtbl.getNodeCount(self);

fn Win32_HRESULT IDevice.createCommandQueue(
    &self,
    CommandQueueDesc* pDesc,
    Win32_GUID* riid,
    void** ppCommandQueue
) @inline =>
    self.vtbl.createCommandQueue(self, pDesc, riid, ppCommandQueue);

fn Win32_HRESULT IDevice.createCommandAllocator(
    &self,
    CommandListType type,
    Win32_GUID* riid,
    void** ppCommandAllocator
) @inline =>
    self.vtbl.createCommandAllocator(self, type, riid, ppCommandAllocator);

fn Win32_HRESULT IDevice.createGraphicsPipelineState(
    &self,
    GraphicsPipelineStateDesc* pDesc,
    Win32_GUID* riid,
    void** ppPipelineState
) @inline =>
    self.vtbl.createGraphicsPipelineState(self, pDesc, riid, ppPipelineState);

fn Win32_HRESULT IDevice.createComputePipelineState(
    &self,
    ComputePipelineStateDesc* pDesc,
    Win32_GUID* riid,
    void** ppPipelineState
) @inline =>
    self.vtbl.createComputePipelineState(self, pDesc, riid, ppPipelineState);

fn Win32_HRESULT IDevice.createCommandList(
    &self,
    uint nodeMask,
    CommandListType type,
    ICommandAllocator* pCommandAllocator,
    IPipelineState* pInitialState,
    Win32_GUID* riid,
    void** ppCommandList
) @inline =>
    self.vtbl.createCommandList(
        self,
        nodeMask,
        type,
        pCommandAllocator,
        pInitialState,
        riid,
        ppCommandList);

fn Win32_HRESULT IDevice.checkFeatureSupport(
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

fn Win32_HRESULT IDevice.createDescriptorHeap(
    &self,
    DescriptorHeapDesc* pDescriptorHeapDesc,
    Win32_GUID* riid,
    void** ppvHeap
) @inline =>
    self.vtbl.createDescriptorHeap(self, pDescriptorHeapDesc, riid, ppvHeap);

fn uint IDevice.getDescriptorHandleIncrementSize(
    &self,
    DescriptorHeapType descriptorHeapType
) @inline =>
    self.vtbl.getDescriptorHandleIncrementSize(self, descriptorHeapType);

fn Win32_HRESULT IDevice.createRootSignature(
    &self,
    uint nodeMask,
    void* pBlobWithRootSignature,
    Win32_SIZE_T blobLengthInBytes,
    Win32_GUID* riid,
    void** ppvRootSignature
) @inline =>
    self.vtbl.createRootSignature(
        self,
        nodeMask,
        pBlobWithRootSignature,
        blobLengthInBytes,
        riid,
        ppvRootSignature);

fn void IDevice.createConstantBufferView(
    &self,
    ConstantBufferViewDesc* pDesc,
    CpuDescriptorHandle destDescriptor
) @inline =>
    self.vtbl.createConstantBufferView(self, pDesc, destDescriptor);

fn void IDevice.createShaderResourceView(
    &self,
    IResource* pResource,
    ShaderResourceViewDesc* pDesc,
    CpuDescriptorHandle destDescriptor
) @inline =>
    self.vtbl.createShaderResourceView(self, pResource, pDesc, destDescriptor);

fn void IDevice.createUnorderedAccessView(
    &self,
    IResource* pResource,
    IResource* pCounterResource,
    UnorderedAccessViewDesc* pDesc,
    CpuDescriptorHandle destDescriptor
) @inline =>
    self.vtbl.createUnorderedAccessView(self, pResource, pCounterResource, pDesc, destDescriptor);

fn void IDevice.createRenderTargetView(
    &self,
    IResource* pResource,
    RenderTargetViewDesc* pDesc,
    CpuDescriptorHandle destDescriptor
) @inline =>
    self.vtbl.createRenderTargetView(self, pResource, pDesc, destDescriptor);

fn void IDevice.createDepthStencilView(
    &self,
    IResource* pResource,
    DepthStencilViewDesc* pDesc,
    CpuDescriptorHandle destDescriptor
) @inline =>
    self.vtbl.createDepthStencilView(self, pResource, pDesc, destDescriptor);

fn void IDevice.createSampler(
    &self,
    SamplerDesc* pDesc,
    CpuDescriptorHandle destDescriptor
) @inline =>
    self.vtbl.createSampler(self, pDesc, destDescriptor);

fn void IDevice.copyDescriptors(
    &self,
    uint numDestDescriptorRanges,
    CpuDescriptorHandle* pDestDescriptorRangeStarts,
    uint* pDestDescriptorRangeSizes,
    uint numSrcDescriptorRanges,
    CpuDescriptorHandle* pSrcDescriptorRangeStarts,
    uint* pSrcDescriptorRangeSizes,
    DescriptorHeapType descriptorHeapsType
) @inline =>
    self.vtbl.copyDescriptors(
        self,
        numDestDescriptorRanges,
        pDestDescriptorRangeStarts,
        pDestDescriptorRangeSizes,
        numSrcDescriptorRanges,
        pSrcDescriptorRangeStarts,
        pSrcDescriptorRangeSizes,
        descriptorHeapsType);

fn void IDevice.copyDescriptorsSimple(
    &self,
    uint numDescriptors,
    CpuDescriptorHandle destDescriptorRangeStart,
    CpuDescriptorHandle srcDescriptorRangeStart,
    DescriptorHeapType descriptorHeapsType
) @inline =>
    self.vtbl.copyDescriptorsSimple(
        self,
        numDescriptors,
        destDescriptorRangeStart,
        srcDescriptorRangeStart,
        descriptorHeapsType);

fn ResourceAllocationInfo* IDevice.getResourceAllocationInfo(
    &self,
    ResourceAllocationInfo* retVal,
    uint visibleMask,
    uint numResourceDescs,
    ResourceDesc* pResourceDescs
) @inline =>
    self.vtbl.getResourceAllocationInfo(
        self,
        retVal,
        visibleMask,
        numResourceDescs,
        pResourceDescs);

fn HeapProperties* IDevice.getCustomHeapProperties(
    &self,
    HeapProperties* retVal,
    uint nodeMask,
    HeapType heapType
) @inline =>
    self.vtbl.getCustomHeapProperties(self, retVal, nodeMask, heapType);

fn Win32_HRESULT IDevice.createCommittedResource(
    &self,
    HeapProperties* pHeapProperties,
    HeapFlags heapFlags,
    ResourceDesc* pDesc,
    ResourceStates initialResourceState,
    ClearValue* pOptimizedClearValue,
    Win32_GUID* riidResource,
    void** ppvResource
) @inline =>
    self.vtbl.createCommittedResource(
        self,
        pHeapProperties,
        heapFlags,
        pDesc,
        initialResourceState,
        pOptimizedClearValue,
        riidResource,
        ppvResource);

fn Win32_HRESULT IDevice.createHeap(
    &self,
    HeapDesc* pDesc,
    Win32_GUID* riid,
    void** ppvHeap
) @inline =>
    self.vtbl.createHeap(self, pDesc, riid, ppvHeap);

fn Win32_HRESULT IDevice.createPlacedResource(
    &self,
    IHeap* pHeap,
    ulong heapOffset,
    ResourceDesc* pDesc,
    ResourceStates initialState,
    ClearValue* pOptimizedClearValue,
    Win32_GUID* riid,
    void** ppvResource
) @inline =>
    self.vtbl.createPlacedResource(
        self,
        pHeap,
        heapOffset,
        pDesc,
        initialState,
        pOptimizedClearValue,
        riid,
        ppvResource);

fn Win32_HRESULT IDevice.createReservedResource(
    &self,
    ResourceDesc* pDesc,
    ResourceStates initialState,
    ClearValue* pOptimizedClearValue,
    Win32_GUID* riid,
    void** ppvResource
) @inline =>
    self.vtbl.createReservedResource(
        self,
        pDesc,
        initialState,
        pOptimizedClearValue,
        riid,
        ppvResource);

fn Win32_HRESULT IDevice.createSharedHandle(
    &self,
    IDeviceChild* pObject,
    Win32_SECURITY_ATTRIBUTES* pAttributes,
    Win32_DWORD access,
    Win32_LPCWSTR name,
    Win32_HANDLE* pHandle
) @inline =>
    self.vtbl.createSharedHandle(self, pObject, pAttributes, access, name, pHandle);

fn Win32_HRESULT IDevice.openSharedHandle(
    &self,
    Win32_HANDLE nTHandle,
    Win32_GUID* riid,
    void** ppvObj
) @inline =>
    self.vtbl.openSharedHandle(self, nTHandle, riid, ppvObj);

fn Win32_HRESULT IDevice.openSharedHandleByName(
    &self,
    Win32_LPCWSTR name,
    Win32_DWORD access,
    Win32_HANDLE* pNTHandle
) @inline =>
    self.vtbl.openSharedHandleByName(self, name, access, pNTHandle);

fn Win32_HRESULT IDevice.makeResident(
    &self,
    uint numObjects,
    IPageable** ppObjects
) @inline =>
    self.vtbl.makeResident(self, numObjects, ppObjects);

fn Win32_HRESULT IDevice.evict(
    &self,
    uint numObjects,
    IPageable** ppObjects
) @inline =>
    self.vtbl.evict(self, numObjects, ppObjects);

fn Win32_HRESULT IDevice.createFence(
    &self,
    ulong initialValue,
    FenceFlags flags,
    Win32_GUID* riid,
    void** ppFence
) @inline =>
    self.vtbl.createFence(self, initialValue, flags, riid, ppFence);

fn Win32_HRESULT IDevice.getDeviceRemovedReason(
    &self
) @inline =>
    self.vtbl.getDeviceRemovedReason(self);

fn void IDevice.getCopyableFootprints(
    &self,
    ResourceDesc* pResourceDesc,
    uint firstSubresource,
    uint numSubresources,
    ulong baseOffset,
    PlacedSubresourceFootprint* pLayouts,
    uint* pNumRows,
    ulong* pRowSizeInBytes,
    ulong* pTotalBytes
) @inline =>
    self.vtbl.getCopyableFootprints(
        self,
        pResourceDesc,
        firstSubresource,
        numSubresources,
        baseOffset,
        pLayouts,
        pNumRows,
        pRowSizeInBytes,
        pTotalBytes);

fn Win32_HRESULT IDevice.createQueryHeap(
    &self,
    QueryHeapDesc* pDesc,
    Win32_GUID* riid,
    void** ppvHeap
) @inline =>
    self.vtbl.createQueryHeap(self, pDesc, riid, ppvHeap);

fn Win32_HRESULT IDevice.setStablePowerState(
    &self,
    Bool enable
) @inline =>
    self.vtbl.setStablePowerState(self, enable);

fn Win32_HRESULT IDevice.createCommandSignature(
    &self,
    CommandSignatureDesc* pDesc,
    IRootSignature* pRootSignature,
    Win32_GUID* riid,
    void** ppvCommandSignature
) @inline =>
    self.vtbl.createCommandSignature(
        self,
        pDesc,
        pRootSignature,
        riid,
        ppvCommandSignature);

fn void IDevice.getResourceTiling(
    &self,
    IResource* pTiledResource,
    uint* pNumTilesForEntireResource,
    PackedMipInfo* pPackedMipDesc,
    TileShape* pStandardTileShapeForNonPackedMips,
    uint* pNumSubresourceTilings,
    uint firstSubresourceTilingToGet,
    SubresourceTiling* pSubresourceTilingsForNonPackedMips
) @inline =>
    self.vtbl.getResourceTiling(
        self,
        pTiledResource,
        pNumTilesForEntireResource,
        pPackedMipDesc,
        pStandardTileShapeForNonPackedMips,
        pNumSubresourceTilings,
        firstSubresourceTilingToGet,
        pSubresourceTilingsForNonPackedMips);

fn Win32_LUID* IDevice.getAdapterLuid(
    &self,
    Win32_LUID* retVal
) @inline =>
    self.vtbl.getAdapterLuid(self, retVal);

// Functions of IDevice1

fn Win32_HRESULT IDevice.createPipelineLibrary(
    &self,
    void* pLibraryBlob,
    Win32_SIZE_T blobLength,
    Win32_GUID* riid,
    void** ppPipelineLibrary
) @inline =>
    self.vtbl.createPipelineLibrary(
        self,
        pLibraryBlob,
        blobLength,
        riid,
        ppPipelineLibrary);

fn Win32_HRESULT IDevice.setEventOnMultipleFenceCompletion(
    &self,
    IFence** ppFences,
    ulong* pFenceValues,
    uint numFences,
    MultipleFenceWaitFlags flags,
    Win32_HANDLE hEvent
) @inline =>
    self.vtbl.setEventOnMultipleFenceCompletion(
        self,
        ppFences,
        pFenceValues,
        numFences,
        flags,
        hEvent);

fn Win32_HRESULT IDevice.setResidencyPriority(
    &self,
    uint numObjects,
    IPageable** ppObjects,
    ResidencyPriority* pPriorities
) @inline =>
    self.vtbl.setResidencyPriority(self, numObjects, ppObjects, pPriorities);

// Function of IDevice2

fn Win32_HRESULT IDevice.createPipelineState(
    &self,
    PipelineStateStreamDesc* pDesc,
    Win32_GUID* riid,
    void** ppPipelineState
) @inline =>
    self.vtbl.createPipelineState(self, pDesc, riid, ppPipelineState);

// Function of IDevice3

fn Win32_HRESULT IDevice.openExistingHeapFromAddress(
    &self,
    void* pAddress,
    Win32_GUID* riid,
    void** ppvHeap
) @inline =>
    self.vtbl.openExistingHeapFromAddress(self,pAddress, riid, ppvHeap);

fn Win32_HRESULT IDevice.openExistingHeapFromFileMapping(
    &self,
    Win32_HANDLE hFileMapping,
    Win32_GUID* riid,
    void** ppvHeap
) @inline =>
    self.vtbl.openExistingHeapFromFileMapping(self, hFileMapping, riid, ppvHeap);

fn Win32_HRESULT IDevice.enqueueMakeResident(
    &self,
    ResidencyFlags flags,
    uint numObjects,
    IPageable** ppObjects,
    IFence* pFenceToSignal,
    ulong fenceValueToSignal
) @inline =>
    self.vtbl.enqueueMakeResident(
        self,
        flags,
        numObjects,
        ppObjects,
        pFenceToSignal,
        fenceValueToSignal);

// Function of IDevice4

fn Win32_HRESULT IDevice.createCommandList1(
    &self,
    uint nodeMask,
    CommandListType type,
    CommandListFlags flags,
    Win32_GUID* riid,
    void** ppCommandList
) @inline =>
    self.vtbl.createCommandList1(self, nodeMask, type, flags, riid, ppCommandList);

fn Win32_HRESULT IDevice.createProtectedResourceSession(
    &self,
    ProtectedResourceSessionDesc* pDesc,
    Win32_GUID* riid,
    void** ppSession
) @inline =>
    self.vtbl.createProtectedResourceSession(self, pDesc, riid, ppSession);

fn Win32_HRESULT IDevice.createCommittedResource1(
    &self,
    HeapProperties* pHeapProperties,
    HeapFlags heapFlags,
    ResourceDesc* pDesc,
    ResourceStates initialResourceState,
    ClearValue* pOptimizedClearValue,
    IProtectedResourceSession* pProtectedSession,
    Win32_GUID* riidResource,
    void** ppvResource
) @inline =>
    self.vtbl.createCommittedResource1(
        self,
        pHeapProperties,
        heapFlags,
        pDesc,
        initialResourceState,
        pOptimizedClearValue,
        pProtectedSession,
        riidResource,
        ppvResource);

fn Win32_HRESULT IDevice.createHeap1(
    &self,
    HeapDesc* pDesc,
    IProtectedResourceSession* pProtectedSession,
    Win32_GUID* riid,
    void** ppvHeap
) @inline =>
    self.vtbl.createHeap1(self, pDesc, pProtectedSession, riid, ppvHeap);

fn Win32_HRESULT IDevice.createReservedResource1(
    &self,
    ResourceDesc* pDesc,
    ResourceStates initialState,
    ClearValue* pOptimizedClearValue,
    IProtectedResourceSession* pProtectedSession,
    Win32_GUID* riid,
    void** ppvResource
) @inline =>
    self.vtbl.createReservedResource1(
        self,
        pDesc,
        initialState,
        pOptimizedClearValue,
        pProtectedSession,
        riid,
        ppvResource);

fn ResourceAllocationInfo* IDevice.getResourceAllocationInfo1(
    &self,
    ResourceAllocationInfo* retVal,
    uint visibleMask,
    uint numResourceDescs,
    ResourceDesc* pResourceDescs,
    ResourceAllocationInfo1* pResourceAllocationInfo1
) @inline =>
    self.vtbl.getResourceAllocationInfo1(
        self,
        retVal,
        visibleMask,
        numResourceDescs,
        pResourceDescs,
        pResourceAllocationInfo1);

// Function of IDevice5

fn Win32_HRESULT IDevice.createLifetimeTracker(
    &self,
    ILifetimeOwner* pOwner,
    Win32_GUID* riid,
    void** ppvTracker
) @inline =>
    self.vtbl.createLifetimeTracker(self, pOwner, riid, ppvTracker);

fn void IDevice.removeDevice(&self) @inline =>
    self.vtbl.removeDevice(self);

fn Win32_HRESULT IDevice.enumerateMetaCommands(
    &self,
    uint* pNumMetaCommands,
    MetaCommandDesc* pDescs
) @inline =>
    self.vtbl.enumerateMetaCommands(self, pNumMetaCommands, pDescs);

fn Win32_HRESULT IDevice.enumerateMetaCommandParameters(
    &self,
    Win32_GUID* commandId,
    MetaCommandParameterStage stage,
    uint* pTotalStructureSizeInBytes,
    uint* pParameterCount,
    MetaCommandParameterDesc* pParameterDescs
) @inline =>
    self.vtbl.enumerateMetaCommandParameters(
        self,
        commandId,
        stage,
        pTotalStructureSizeInBytes,
        pParameterCount,
        pParameterDescs);

fn Win32_HRESULT IDevice.createMetaCommand(
    &self,
    Win32_GUID* commandId,
    uint nodeMask,
    void* pCreationParametersData,
    Win32_SIZE_T creationParametersDataSizeInBytes,
    Win32_GUID* riid,
    void** ppMetaCommand
) @inline =>
    self.vtbl.createMetaCommand(
        self,
        commandId,
        nodeMask,
        pCreationParametersData,
        creationParametersDataSizeInBytes,
        riid,
        ppMetaCommand);

fn Win32_HRESULT IDevice.createStateObject(
    &self,
    StateObjectDesc* pDesc,
    Win32_GUID* riid,
    void** ppStateObject
) @inline =>
    self.vtbl.createStateObject(self, pDesc, riid, ppStateObject);

fn void IDevice.getRaytracingAccelerationStructurePrebuildInfo(
    &self,
    BuildRaytracingAccelerationStructureInputs* pDesc,
    RaytracingAccelerationStructurePrebuildInfo* pInfo
) @inline =>
    self.vtbl.getRaytracingAccelerationStructurePrebuildInfo(self, pDesc, pInfo);

fn DriverMatchingIdentifierStatus IDevice.checkDriverMatchingIdentifier(
    &self,
    SerializedDataType serializedDataType,
    SerializedDataDriverMatchingIdentifier* pIdentifierToCheck
) @inline =>
    self.vtbl.checkDriverMatchingIdentifier(self, serializedDataType, pIdentifierToCheck);

// Function of IDevice6

fn Win32_HRESULT IDevice.setBackgroundProcessingMode(
    &self,
    BackgroundProcessingMode mode,
    MeasurementsAction measurementsAction,
    Win32_HANDLE hEventToSignalUponCompletion,
    Bool* pbFurtherMeasurementsDesired
) @inline =>
    self.vtbl.setBackgroundProcessingMode(
        self,
        mode,
        measurementsAction,
        hEventToSignalUponCompletion,
        pbFurtherMeasurementsDesired);

// Function of IDevice7

fn Win32_HRESULT IDevice.addToStateObject(
    &self,
    StateObjectDesc* pAddition,
    IStateObject* pStateObjectToGrowFrom,
    Win32_GUID* riid,
    void** ppNewStateObject
) @inline =>
    self.vtbl.addToStateObject(
        self,
        pAddition,
        pStateObjectToGrowFrom,
        riid,
        ppNewStateObject);

fn Win32_HRESULT IDevice.createProtectedResourceSession1(
    &self,
    ProtectedResourceSessionDesc1* pDesc,
    Win32_GUID* riid,
    void** ppSession
) @inline =>
    self.vtbl.createProtectedResourceSession1(self, pDesc, riid, ppSession);

// Function of IDevice8

fn ResourceAllocationInfo* IDevice.getResourceAllocationInfo2(
    &self,
    ResourceAllocationInfo* retVal,
    uint visibleMask,
    uint numResourceDescs,
    ResourceDesc1* pResourceDescs,
    ResourceAllocationInfo1* pResourceAllocationInfo1
) @inline =>
    self.vtbl.getResourceAllocationInfo2(
        self,
        retVal,
        visibleMask,
        numResourceDescs,
        pResourceDescs,
        pResourceAllocationInfo1);

fn Win32_HRESULT IDevice.createCommittedResource2(
    &self,
    HeapProperties* pHeapProperties,
    HeapFlags heapFlags,
    ResourceDesc1* pDesc,
    ResourceStates initialResourceState,
    ClearValue* pOptimizedClearValue,
    IProtectedResourceSession* pProtectedSession,
    Win32_GUID* riidResource,
    void** ppvResource
) @inline =>
    self.vtbl.createCommittedResource2(
        self,
        pHeapProperties,
        heapFlags,
        pDesc,
        initialResourceState,
        pOptimizedClearValue,
        pProtectedSession,
        riidResource,
        ppvResource);

fn Win32_HRESULT IDevice.createPlacedResource1(
    &self,
    IHeap *pHeap,
    ulong heapOffset,
    ResourceDesc1* pDesc,
    ResourceStates initialState,
    ClearValue* pOptimizedClearValue,
    Win32_GUID* riid,
    void** ppvResource
) @inline =>
    self.vtbl.createPlacedResource1(
        self,
        pHeap,
        heapOffset,
        pDesc,
        initialState,
        pOptimizedClearValue,
        riid,
        ppvResource);

fn void IDevice.createSamplerFeedbackUnorderedAccessView(
    &self,
    IResource* pTargetedResource,
    IResource* pFeedbackResource,
    CpuDescriptorHandle destDescriptor
) @inline =>
    self.vtbl.createSamplerFeedbackUnorderedAccessView(
        self,
        pTargetedResource,
        pFeedbackResource,
        destDescriptor);

fn void IDevice.getCopyableFootprints1(
    &self,
    ResourceDesc1* pResourceDesc,
    uint firstSubresource,
    uint numSubresources,
    ulong baseOffset,
    PlacedSubresourceFootprint* pLayouts,
    uint* pNumRows,
    ulong* pRowSizeInBytes,
    ulong* pTotalBytes
) @inline =>
    self.vtbl.getCopyableFootprints1(
        self,
        pResourceDesc,
        firstSubresource,
        numSubresources,
        baseOffset,
        pLayouts,
        pNumRows,
        pRowSizeInBytes,
        pTotalBytes);

// Function of IDevice9

fn Win32_HRESULT IDevice.createShaderCacheSession(
    &self,
    ShaderCacheSessionDesc* pDesc,
    Win32_GUID* riid,
    void** ppvSession
) @inline =>
    self.vtbl.createShaderCacheSession(self, pDesc, riid, ppvSession);

fn Win32_HRESULT IDevice.shaderCacheControl(
    &self,
    ShaderCacheKindFlags kinds,
    ShaderCacheControlFlags control
) @inline =>
    self.vtbl.shaderCacheControl(self, kinds, control);

fn Win32_HRESULT IDevice.createCommandQueue1(
    &self,
    CommandQueueDesc* pDesc,
    Win32_GUID* creatorID,
    Win32_GUID* riid,
    void** ppCommandQueue
) @inline =>
    self.vtbl.createCommandQueue1(self, pDesc, creatorID, riid, ppCommandQueue);

// Function of IDevice10

fn Win32_HRESULT IDevice.createCommittedResource3(
    &self,
    HeapProperties* pHeapProperties,
    HeapFlags heapFlags,
    ResourceDesc1* pDesc,
    BarrierLayout initialLayout,
    ClearValue* pOptimizedClearValue,
    IProtectedResourceSession *pProtectedSession,
    uint numCastableFormats,
    Format* pCastableFormats,
    Win32_GUID* riidResource,
    void** ppvResource
) @inline =>
    self.vtbl.createCommittedResource3(
        self,
        pHeapProperties,
        heapFlags,
        pDesc,
        initialLayout,
        pOptimizedClearValue,
        pProtectedSession,
        numCastableFormats,
        pCastableFormats,
        riidResource,
        ppvResource);

fn Win32_HRESULT IDevice.createPlacedResource2(
    &self,
    IHeap *pHeap,
    ulong heapOffset,
    ResourceDesc1* pDesc,
    BarrierLayout initialLayout,
    ClearValue* pOptimizedClearValue,
    uint numCastableFormats,
    Format* pCastableFormats,
    Win32_GUID* riid,
    void** ppvResource
) @inline =>
    self.vtbl.createPlacedResource2(
        self,
        pHeap,
        heapOffset,
        pDesc,
        initialLayout,
        pOptimizedClearValue,
        numCastableFormats,
        pCastableFormats,
        riid,
        ppvResource);

fn Win32_HRESULT IDevice.createReservedResource2(
    &self,
    ResourceDesc* pDesc,
    BarrierLayout initialLayout,
    ClearValue* pOptimizedClearValue,
    IProtectedResourceSession *pProtectedSession,
    uint numCastableFormats,
    Format* pCastableFormats,
    Win32_GUID* riid,
    void** ppvResource
) @inline =>
    self.vtbl.createReservedResource2(
        self,
        pDesc,
        initialLayout,
        pOptimizedClearValue,
        pProtectedSession,
        numCastableFormats,
        pCastableFormats,
        riid,
        ppvResource);

// Function of IDevice11

fn void IDevice.createSampler2(
    &self,
    SamplerDesc2* pDesc,
    CpuDescriptorHandle destDescriptor
) @inline =>
    self.vtbl.createSampler2(self, pDesc, destDescriptor);

// Function of IDevice12

fn ResourceAllocationInfo* IDevice.getResourceAllocationInfo3(
    &self,
    ResourceAllocationInfo* retVal,
    uint visibleMask,
    uint numResourceDescs,
    ResourceDesc1* pResourceDescs,
    uint* pNumCastableFormats,
    Format** ppCastableFormats,
    ResourceAllocationInfo1* pResourceAllocationInfo1
) @inline =>
    self.vtbl.getResourceAllocationInfo3(
        self,
        retVal,
        visibleMask,
        numResourceDescs,
        pResourceDescs,
        pNumCastableFormats,
        ppCastableFormats,
        pResourceAllocationInfo1);

// Function of IDevice13

fn Win32_HRESULT IDevice.openExistingHeapFromAddress1(
    &self,
    void* pAddress,
    Win32_SIZE_T size,
    Win32_GUID* riid,
    void** ppvHeap
) @inline =>
    self.vtbl.openExistingHeapFromAddress1(self, pAddress, size, riid, ppvHeap);

// Function of IDevice14

fn Win32_HRESULT IDevice.createRootSignatureFromSubobjectInLibrary(
    &self,
    uint nodeMask,
    void* pLibraryBlob,
    Win32_SIZE_T blobLengthInBytes,
    Win32_LPCWSTR subobjectName,
    Win32_GUID* riid,
    void** ppvRootSignature
) @inline =>
    self.vtbl.createRootSignatureFromSubobjectInLibrary(
        self,
        nodeMask,
        pLibraryBlob,
        blobLengthInBytes,
        subobjectName,
        riid,
        ppvRootSignature);

// =============================================================================
// IPipelineLibrary
// =============================================================================

const IPIPELINE_LIBRARY_UUID_STRING = "c64226a8-9201-46af-b4cc-53fb9ff7414f";
const Win32_GUID IPIPELINE_LIBRARY_UUID = {
    0xc64226a8, 0x9201, 0x46af, { 0xb4, 0xcc, 0x53, 0xfb, 0x9f, 0xf7, 0x41, 0x4f } };

const IPIPELINE_LIBRARY1_UUID_STRING = "80eabf42-2568-4e5e-bd82-c37f86961dc3";
const Win32_GUID IPIPELINE_LIBRARY1_UUID = {
    0x80eabf42, 0x2568, 0x4e5e, { 0xbd, 0x82, 0xc3, 0x7f, 0x86, 0x96, 0x1d, 0xc3 } };

struct IPipelineLibrary
{
    IPipelineLibraryVTable* vtbl;
}

typedef IPipelineLibrary1 = inline IPipelineLibrary;

// Function pointers of IPipelineLibrary

alias IPipelineLibrary_StorePipelineFn = fn Win32_HRESULT (
    void* self,
    Win32_LPCWSTR pName,
    IPipelineState* pPipeline);

alias IPipelineLibrary_LoadGraphicsPipelineFn = fn Win32_HRESULT (
    void* self,
    Win32_LPCWSTR pName,
    GraphicsPipelineStateDesc* pDesc,
    Win32_GUID* riid,
    void** ppPipelineState);

alias IPipelineLibrary_LoadComputePipelineFn = fn Win32_HRESULT (
    void* self,
    Win32_LPCWSTR pName,
    ComputePipelineStateDesc* pDesc,
    Win32_GUID* riid,
    void** ppPipelineState);

alias IPipelineLibrary_GetSerializedSizeFn = fn Win32_SIZE_T (void* self);

alias IPipelineLibrary_SerializeFn = fn Win32_HRESULT (
    void* self,
    void* pData,
    Win32_SIZE_T dataSizeInBytes);

// Function pointers of IPipelineLibrary1

alias IPipelineLibrary1_LoadPipelineFn = fn Win32_HRESULT (
    void* self,
    Win32_LPCWSTR pName,
    PipelineStateStreamDesc* pDesc,
    Win32_GUID* riid,
    void** ppPipelineState);

struct IPipelineLibraryVTable
{
    inline IDeviceChildVTable _base;

    // IPipelineLibrary
    IPipelineLibrary_StorePipelineFn storePipeline;
    IPipelineLibrary_LoadGraphicsPipelineFn loadGraphicsPipeline;
    IPipelineLibrary_LoadComputePipelineFn loadComputePipeline;
    IPipelineLibrary_GetSerializedSizeFn getSerializedSize;
    IPipelineLibrary_SerializeFn serialize;

    // IPipelineLibrary1
    IPipelineLibrary1_LoadPipelineFn loadPipeline;
}

// Functions of IUnknown

fn Win32_HRESULT IPipelineLibrary.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IPipelineLibrary.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IPipelineLibrary.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IPipelineLibrary.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IPipelineLibrary.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IPipelineLibrary.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IPipelineLibrary.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IPipelineLibrary.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Functions of IPipelineLibrary

fn Win32_HRESULT IPipelineLibrary.storePipeline(
    &self,
    Win32_LPCWSTR pName,
    IPipelineState* pPipeline
) @inline =>
    self.vtbl.storePipeline(self, pName, pPipeline);

fn Win32_HRESULT IPipelineLibrary.loadGraphicsPipeline(
    &self,
    Win32_LPCWSTR pName,
    GraphicsPipelineStateDesc* pDesc,
    Win32_GUID* riid,
    void** ppPipelineState
) @inline =>
    self.vtbl.loadGraphicsPipeline(self, pName, pDesc, riid, ppPipelineState);

fn Win32_HRESULT IPipelineLibrary.loadComputePipeline(
    &self,
    Win32_LPCWSTR pName,
    ComputePipelineStateDesc* pDesc,
    Win32_GUID* riid,
    void** ppPipelineState
) @inline =>
    self.vtbl.loadComputePipeline(self, pName, pDesc, riid, ppPipelineState);

fn Win32_SIZE_T IPipelineLibrary.getSerializedSize(&self) @inline =>
    self.vtbl.getSerializedSize(self);

fn Win32_HRESULT IPipelineLibrary.serialize(
    &self,
    void* pData,
    Win32_SIZE_T dataSizeInBytes
) @inline =>
    self.vtbl.serialize(self, pData, dataSizeInBytes);

// Functins of IPipelineLibrary1

fn Win32_HRESULT IPipelineLibrary.loadPipeline(
    &self,
    Win32_LPCWSTR pName,
    PipelineStateStreamDesc* pDesc,
    Win32_GUID* riid,
    void** ppPipelineState
) @inline =>
    self.vtbl.loadPipeline(self, pName, pDesc, riid, ppPipelineState);

// ---

bitstruct MultipleFenceWaitFlags : uint
{
    bool any_      : 0;
    uint __unused0 : 1..31;
}

const MultipleFenceWaitFlags MULTIPLE_FENCE_WAIT_FLAG_NONE = {};
const MultipleFenceWaitFlags MULTIPLE_FENCE_WAIT_FLAG_ANY = {.any_};
const MultipleFenceWaitFlags MULTIPLE_FENCE_WAIT_FLAG_ALL = {};

typedef ResidencyPriority = uint;
const ResidencyPriority RESIDENCY_PRIORITY_MINIMUM = 0x28000000;
const ResidencyPriority RESIDENCY_PRIORITY_LOW = 0x50000000;
const ResidencyPriority RESIDENCY_PRIORITY_NORMAL = 0x78000000;
const ResidencyPriority RESIDENCY_PRIORITY_HIGH = 0xa0010000;
const ResidencyPriority RESIDENCY_PRIORITY_MAXIMUM = 0xc8000000;

bitstruct ResidencyFlags : uint
{
    bool overbudget : 0;
    uint __unused0  : 1..31;
}

const ResidencyFlags RESIDENCY_FLAGS_NONE = {};

bitstruct CommandListFlags : uint
{
    uint __unused0 : 0..31;
}

const CommandListFlags COMMAND_LIST_FLAGS_NONE = {};

bitstruct CommandPoolFlags : uint
{
    uint __unused0 : 0..31;
}

const CommandPoolFlags COMMAND_POOL_FLAGS_NONE = {};

bitstruct CommandRecorderFlags : uint
{
    uint __unused0 : 0..31;
}

const CommandRecorderFlags COMMAND_RECORDER_FLAGS_NONE = {};

enum ProtectedSessionStatus : int
{
    OK,
    INVALID,
}

// =============================================================================
// IProtectedSession
// =============================================================================

const IPROTECTED_SESSION_UUID_STRING = "A1533D18-0AC1-4084-85B9-89A96116806B";
const Win32_GUID IPROTECTED_SESSION_UUID = {
    0xA1533D18, 0x0AC1, 0x4084, { 0x85, 0xB9, 0x89, 0xA9, 0x61, 0x16, 0x80, 0x6B } };

struct IProtectedSession
{
    IProtectedSessionVTable* vtbl;
}

// Function pointers of IProtectedSession

alias IProtectedSession_GetStatusFenceFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* riid,
    void** ppFence);

alias IProtectedSession_GetSessionStatusFn = fn ProtectedSessionStatus (void* self);

struct IProtectedSessionVTable
{
    inline IDeviceChildVTable _base;
    IProtectedSession_GetStatusFenceFn getStatusFence;
    IProtectedSession_GetSessionStatusFn getSessionStatus;
}

// Functions of IUnknown

fn Win32_HRESULT IProtectedSession.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IProtectedSession.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IProtectedSession.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IProtectedSession.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IProtectedSession.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IProtectedSession.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IProtectedSession.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IProtectedSession.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Function of IProtectedSession

fn Win32_HRESULT IProtectedSession.getStatusFence(
    &self,
    Win32_GUID* riid,
    void** ppFence
) @inline =>
    self.vtbl.getStatusFence(self, riid, ppFence);

fn ProtectedSessionStatus IProtectedSession.getSessionStatus(&self) @inline =>
    self.vtbl.getSessionStatus(self);

// ---

bitstruct ProtectedResourceSessionSupportFlags : uint
{
    bool supported : 0;
    uint __unused0 : 1..31;
}

const ProtectedResourceSessionSupportFlags PROTECTED_RESOURCE_SESSION_SUPPORT_FLAGS_NONE = {};

struct FeatureDataProtectedResourceSessionSupport
{
    uint nodeIndex;
    ProtectedResourceSessionSupportFlags support;
}

typedef ProtectedResourceSessionFlags = int;

const ProtectedResourceSessionFlags PROTECTED_RESOURCE_SESSION_FLAGS_NONE = {};

struct ProtectedResourceSessionDesc
{
    uint nodeMask;
    ProtectedResourceSessionFlags flags;
}

// =============================================================================
// IProtectedResourceSession
// =============================================================================

const IPROTECTED_RESOURCE_SESSION_UUID_STRING = "6CD696F4-F289-40CC-8091-5A6C0A099C3D";
const Win32_GUID IPROTECTED_RESOURCE_SESSION_UUID = {
    0x6CD696F4, 0xF289, 0x40CC, { 0x80, 0x91, 0x5A, 0x6C, 0x0A, 0x09, 0x9C, 0x3D } };

const IPROTECTED_RESOURCE_SESSION1_UUID_STRING = "D6F12DD6-76FB-406E-8961-4296EEFC0409";
const Win32_GUID IPROTECTED_RESOURCE_SESSION1_UUID = {
    0xD6F12DD6, 0x76FB, 0x406E, { 0x89, 0x61, 0x42, 0x96, 0xEE, 0xFC, 0x04, 0x09 } };

struct IProtectedResourceSession
{
    IProtectedResourceSessionVTable* vtbl;
}

typedef IProtectedResourceSession1 = IProtectedResourceSession;

// Function pointers of IProtectedResourceSession

alias IProtectedResourceSession_GetDescFn = fn ProtectedResourceSessionDesc* (
    void* self,
    ProtectedResourceSessionDesc* retVal);

// Function pointers of IProtectedResourceSession1

alias IProtectedResourceSession1_GetDesc1Fn = fn ProtectedResourceSessionDesc1* (
    void* self,
    ProtectedResourceSessionDesc1* retVal);

struct IProtectedResourceSessionVTable
{
    inline IProtectedSessionVTable _base;

    // IProtectedResourceSession
    IProtectedResourceSession_GetDescFn getDesc;

    // IProtectedResourceSession1
    IProtectedResourceSession1_GetDesc1Fn getDesc1;
}

// Functions of IUnknown

fn Win32_HRESULT IProtectedResourceSession.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IProtectedResourceSession.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IProtectedResourceSession.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IProtectedResourceSession.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IProtectedResourceSession.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IProtectedResourceSession.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IProtectedResourceSession.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IProtectedResourceSession.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Function of IProtectedSession

fn Win32_HRESULT IProtectedResourceSession.getStatusFence(
    &self,
    Win32_GUID* riid,
    void** ppFence
) @inline =>
    self.vtbl.getStatusFence(self, riid, ppFence);

fn ProtectedSessionStatus IProtectedResourceSession.getSessionStatus(&self) @inline =>
    self.vtbl.getSessionStatus(self);

// Function of IProtectedResourceSession

fn ProtectedResourceSessionDesc* IProtectedResourceSession.getDesc(
    &self,
    ProtectedResourceSessionDesc* retVal
) @inline =>
    self.vtbl.getDesc(self, retVal);

// Function of IProtectedResourceSession1

fn ProtectedResourceSessionDesc1* IProtectedResourceSession.getDesc1(
    &self,
    ProtectedResourceSessionDesc1* retVal
) @inline =>
    self.vtbl.getDesc1(self, retVal);

// ---

enum LifetimeState : int
{
    IN_USE,
    NOT_IN_USE,
}

// =============================================================================
// ILifetimeOwner
// =============================================================================

const ILIFETIME_OWNER_UUID_STRING = "e667af9f-cd56-4f46-83ce-032e595d70a8";
const Win32_GUID ILIFETIME_OWNER_UUID = {
    0xe667af9f, 0xcd56, 0x4f46, { 0x83, 0xce, 0x03, 0x2e, 0x59, 0x5d, 0x70, 0xa8 } };

struct ILifetimeOwner
{
    ILifetimeOwnerVTable* vtbl;
}

// Function pointers of ILifetimeOwner

alias ILifetimeOwner_LifetimeStateUpdatedFn = fn void (
    void* self,
    LifetimeState newState);

struct ILifetimeOwnerVTable
{
    inline IUnknownVTable _base;
    ILifetimeOwner_LifetimeStateUpdatedFn lifetimeStateUpdated;
}

// Functions of IUnknown

fn Win32_HRESULT ILifetimeOwner.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ILifetimeOwner.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ILifetimeOwner.release(&self) @inline => self.vtbl.release(self);

// Function pointers of ILifetimeOwner

fn void ILifetimeOwner.lifetimeStateUpdated(
    &self,
    LifetimeState newState
) @inline =>
    self.vtbl.lifetimeStateUpdated(self, newState);

// =============================================================================
// ISwapChainAssistant
// =============================================================================

const ISWAP_CHAIN_ASSISTANT_UUID_STRING = "f1df64b6-57fd-49cd-8807-c0eb88b45c8f";
const Win32_GUID ISWAP_CHAIN_ASSISTANT_UUID = {
    0xf1df64b6, 0x57fd, 0x49cd, { 0x88, 0x07, 0xc0, 0xeb, 0x88, 0xb4, 0x5c, 0x8f } };

struct ISwapChainAssistant
{
    ISwapChainAssistantVTable* vtbl;
}

// Function pointers of ISwapChainAssistant

alias ISwapChainAssistant_GetLUIDFn = fn Win32_LUID* (
    void* self,
    Win32_LUID* retVal);

alias ISwapChainAssistant_GetSwapChainObjectFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* riid,
    void** ppv);

alias ISwapChainAssistant_GetCurrentResourceAndCommandQueueFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* riidResource,
    void** ppvResource,
    Win32_GUID* riidQueue,
    void** ppvQueue);

alias ISwapChainAssistant_InsertImplicitSyncFn = fn Win32_HRESULT (void* self);

struct ISwapChainAssistantVTable
{
    inline IUnknownVTable _base;
    ISwapChainAssistant_GetLUIDFn getLUID;
    ISwapChainAssistant_GetSwapChainObjectFn getSwapChainObject;
    ISwapChainAssistant_GetCurrentResourceAndCommandQueueFn getCurrentResourceAndCommandQueue;
    ISwapChainAssistant_InsertImplicitSyncFn insertImplicitSync;
}

// Functions of IUnknown

fn Win32_HRESULT ISwapChainAssistant.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ISwapChainAssistant.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ISwapChainAssistant.release(&self) @inline => self.vtbl.release(self);

// Function of ISwapChainAssistant

fn Win32_LUID* ISwapChainAssistant.getLUID(
    &self,
    Win32_LUID* retVal
) @inline =>
    self.vtbl.getLUID(self, retVal);

fn Win32_HRESULT ISwapChainAssistant.getSwapChainObject(
    &self,
    Win32_GUID* riid,
    void** ppv
) @inline =>
    self.vtbl.getSwapChainObject(self, riid, ppv);

fn Win32_HRESULT ISwapChainAssistant.getCurrentResourceAndCommandQueue(
    &self,
    Win32_GUID* riidResource,
    void** ppvResource,
    Win32_GUID* riidQueue,
    void** ppvQueue
) @inline =>
    self.vtbl.getCurrentResourceAndCommandQueue(
        self,
        riidResource,
        ppvResource,
        riidQueue,
        ppvQueue);

fn Win32_HRESULT ISwapChainAssistant.insertImplicitSync(&self) @inline =>
    self.vtbl.insertImplicitSync(self);

// =============================================================================
// ILifetimeTracker
// =============================================================================

const ILIFETIME_TRACKER_UUID_STRING = "3fd03d36-4eb1-424a-a582-494ecb8ba813";
const Win32_GUID ILIFETIME_TRACKER_UUID = {
    0x3fd03d36, 0x4eb1, 0x424a, { 0xa5, 0x82, 0x49, 0x4e, 0xcb, 0x8b, 0xa8, 0x13 } };

struct ILifetimeTracker
{
    ILifetimeTrackerVTable* vtbl;
}

// Function pointers of ILifetimeTracker

alias ILifetimeTracker_DestroyOwnedObjectFn = fn Win32_HRESULT (
    void* self,
    IDeviceChild* pObject);

struct ILifetimeTrackerVTable
{
    inline IDeviceChildVTable _base;
    ILifetimeTracker_DestroyOwnedObjectFn destroyOwnedObject;
}

// Function of ILifetimeTracker

fn Win32_HRESULT ILifetimeTracker.destroyOwnedObject(
    &self,
    IDeviceChild* pObject
) @inline =>
    self.vtbl.destroyOwnedObject(self, pObject);

// ---

enum MetaCommandParameterType : int
{
    FLOAT,
    UINT64,
    GPU_VIRTUAL_ADDRESS,
    CPU_DESCRIPTOR_HANDLE_HEAP_TYPE_CBV_SRV_UAV,
    GPU_DESCRIPTOR_HANDLE_HEAP_TYPE_CBV_SRV_UAV,
}

bitstruct MetaCommandParameterFlags : uint
{
    bool input     : 0;
    bool output    : 1;
    uint __unused0 : 2..31;
}

enum MetaCommandParameterStage : int
{
    CREATION,
    INITIALIZATION,
    EXECUTION,
}

struct MetaCommandParameterDesc
{
    Win32_LPCWSTR name;
    MetaCommandParameterType type;
    MetaCommandParameterFlags flags;
    ResourceStates requiredResourceState;
    uint structureOffset;
}

typedef GraphicsStates = int;
const GraphicsStates GRAPHICS_STATE_NONE                    = 0;
const GraphicsStates GRAPHICS_STATE_IA_VERTEX_BUFFERS       = ( 1 << 0 );
const GraphicsStates GRAPHICS_STATE_IA_INDEX_BUFFER         = ( 1 << 1 );
const GraphicsStates GRAPHICS_STATE_IA_PRIMITIVE_TOPOLOGY   = ( 1 << 2 );
const GraphicsStates GRAPHICS_STATE_DESCRIPTOR_HEAP         = ( 1 << 3 );
const GraphicsStates GRAPHICS_STATE_GRAPHICS_ROOT_SIGNATURE = ( 1 << 4 );
const GraphicsStates GRAPHICS_STATE_COMPUTE_ROOT_SIGNATURE  = ( 1 << 5 );
const GraphicsStates GRAPHICS_STATE_RS_VIEWPORTS            = ( 1 << 6 );
const GraphicsStates GRAPHICS_STATE_RS_SCISSOR_RECTS        = ( 1 << 7 );
const GraphicsStates GRAPHICS_STATE_PREDICATION             = ( 1 << 8 );
const GraphicsStates GRAPHICS_STATE_OM_RENDER_TARGETS       = ( 1 << 9 );
const GraphicsStates GRAPHICS_STATE_OM_STENCIL_REF          = ( 1 << 10 );
const GraphicsStates GRAPHICS_STATE_OM_BLEND_FACTOR         = ( 1 << 11 );
const GraphicsStates GRAPHICS_STATE_PIPELINE_STATE          = ( 1 << 12 );
const GraphicsStates GRAPHICS_STATE_SO_TARGETS              = ( 1 << 13 );
const GraphicsStates GRAPHICS_STATE_OM_DEPTH_BOUNDS         = ( 1 << 14 );
const GraphicsStates GRAPHICS_STATE_SAMPLE_POSITIONS        = ( 1 << 15 );
const GraphicsStates GRAPHICS_STATE_VIEW_INSTANCE_MASK      = ( 1 << 16 );

struct MetaCommandDesc
{
    Win32_GUID id;
    Win32_LPCWSTR name;
    GraphicsStates initializationDirtyState;
    GraphicsStates executionDirtyState;
}

// =============================================================================
// IStateObject
// =============================================================================

const ISTATE_OBJECT_UUID_STRING = "47016943-fca8-4594-93ea-af258b55346d";
const Win32_GUID ISTATE_OBJECT_UUID = {
    0x47016943, 0xfca8, 0x4594, { 0x93, 0xea, 0xaf, 0x25, 0x8b, 0x55, 0x34, 0x6d } };

struct IStateObject
{
    IStateObjectVTable* vtbl;
}

struct IStateObjectVTable
{
    inline IPageableVTable _base;
}

// Functions of IUnknown

fn Win32_HRESULT IStateObject.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IStateObject.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IStateObject.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IStateObject.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IStateObject.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IStateObject.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IStateObject.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IStateObject.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// =============================================================================
// IStateObjectProperties
// =============================================================================

const ISTATE_OBJECT_PROPERTIES_UUID_STRING = "de5fa827-9bf9-4f26-89ff-d7f56fde3860";
const Win32_GUID ISTATE_OBJECT_PROPERTIES_UUID = {
    0xde5fa827, 0x9bf9, 0x4f26, { 0x89, 0xff, 0xd7, 0xf5, 0x6f, 0xde, 0x38, 0x60 } };

const ISTATE_OBJECT_PROPERTIES1_UUID_STRING = "460caac7-1d24-446a-a184-ca67db494138";
const Win32_GUID ISTATE_OBJECT_PROPERTIES1_UUID = {
    0x460caac7, 0x1d24, 0x446a, { 0xa1, 0x84, 0xca, 0x67, 0xdb, 0x49, 0x41, 0x38 } };

struct IStateObjectProperties
{
    IStateObjectPropertiesVTable* vtbl;
}

typedef IStateObjectProperties1 = inline IStateObjectProperties;

// Function pointers of IStateObjectProperties

alias IStateObjectProperties_GetShaderIdentifierFn = fn void *(
    void* self,
    Win32_LPCWSTR pExportName);

alias IStateObjectProperties_GetShaderStackSizeFn = fn ulong (
    void* self,
    Win32_LPCWSTR pExportName);

alias IStateObjectProperties_GetPipelineStackSizeFn = fn ulong (void* self);

alias IStateObjectProperties_SetPipelineStackSizeFn = fn void (
    void* self,
    ulong pipelineStackSizeInBytes);

// Function pointers of IStateObjectProperties1

alias IStateObjectProperties1_GetProgramIdentifierFn = fn ProgramIdentifier* (
    void* self,
    ProgramIdentifier* retVal,
    Win32_LPCWSTR pProgramName);

struct IStateObjectPropertiesVTable
{
    inline IUnknownVTable _base;

    // IStateObjectProperties
    IStateObjectProperties_GetShaderIdentifierFn getShaderIdentifier;
    IStateObjectProperties_GetShaderStackSizeFn getShaderStackSize;
    IStateObjectProperties_GetPipelineStackSizeFn getPipelineStackSize;
    IStateObjectProperties_SetPipelineStackSizeFn setPipelineStackSize;

    // IStateObjectProperties1
    IStateObjectProperties1_GetProgramIdentifierFn getProgramIdentifier;
}

// Functions of IUnknown

fn Win32_HRESULT IStateObjectProperties.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IStateObjectProperties.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IStateObjectProperties.release(&self) @inline => self.vtbl.release(self);

// Function pointers of IStateObjectProperties

fn void* IStateObjectProperties.getShaderIdentifier(
    &self,
    Win32_LPCWSTR pExportName
) @inline =>
    self.vtbl.getShaderIdentifier(self, pExportName);

fn ulong IStateObjectProperties.getShaderStackSize(
    &self,
    Win32_LPCWSTR pExportName
) @inline =>
    self.vtbl.getShaderStackSize(self, pExportName);

fn ulong IStateObjectProperties.getPipelineStackSize(&self) @inline =>
    self.vtbl.getPipelineStackSize(self);

fn void IStateObjectProperties.setPipelineStackSize(
    &self,
    ulong pipelineStackSizeInBytes
) @inline =>
    self.vtbl.setPipelineStackSize(self, pipelineStackSizeInBytes);

// Function pointers of IStateObjectProperties1

fn ProgramIdentifier* IStateObjectProperties.getProgramIdentifier(
    &self,
    ProgramIdentifier* retVal,
    Win32_LPCWSTR pProgramName
) @inline =>
    self.vtbl.getProgramIdentifier(self, retVal, pProgramName);

struct ProgramIdentifier
{
    ulong[4] opaqueData;
}

struct NodeId
{
    Win32_LPCWSTR name;
    uint arrayIndex;
}

struct WorkGraphMemoryRequirements
{
    ulong minSizeInBytes;
    ulong maxSizeInBytes;
    uint sizeGranularityInBytes;
}

// =============================================================================
// IWorkGraphProperties
// =============================================================================

const IWORK_GRAPH_PROPERTIES_UUID_STRING = "065acf71-f863-4b89-82f4-02e4d5886757";
const Win32_GUID IWORK_GRAPH_PROPERTIES_UUID = {
    0x065acf71, 0xf863, 0x4b89, { 0x82, 0xf4, 0x02, 0xe4, 0xd5, 0x88, 0x67, 0x57 } };

struct IWorkGraphProperties
{
    IWorkGraphPropertiesVTable* vtbl;
}

// Function pointers of IWorkGraphProperties

alias IWorkGraphPropertiesIWorkGraphProperties_GetNumWorkGraphsFn = fn uint (void* self);

alias IWorkGraphPropertiesIWorkGraphProperties_GetProgramNameFn = fn Win32_LPCWSTR (
    void* self,
    uint workGraphIndex);

alias IWorkGraphPropertiesIWorkGraphProperties_GetWorkGraphIndexFn = fn uint (
    void* self,
    Win32_LPCWSTR pProgramName);

alias IWorkGraphPropertiesIWorkGraphProperties_GetNumNodesFn = fn uint (
    void* self,
    uint workGraphIndex);

alias IWorkGraphProperties_GetNodeIDFn = fn NodeId* (
    void* self,
    NodeId* retVal,
    uint workGraphIndex,
    uint nodeIndex);

alias IWorkGraphProperties_GetNodeIndexFn = fn uint (
    void* self,
    uint workGraphIndex,
    NodeId nodeID);

alias IWorkGraphProperties_GetNodeLocalRootArgumentsTableIndexFn = fn uint (
    void* self,
    uint workGraphIndex,
    uint nodeIndex);

alias IWorkGraphProperties_GetNumEntrypointsFn = fn uint (
    void* self,
    uint workGraphIndex);

alias IWorkGraphProperties_GetEntrypointIDFn = fn NodeId* (
    void* self,
    NodeId* retVal,
    uint workGraphIndex,
    uint entrypointIndex);

alias IWorkGraphProperties_GetEntrypointIndexFn = fn uint (
    void* self,
    uint workGraphIndex,
    NodeId nodeID);

alias IWorkGraphProperties_GetEntrypointRecordSizeInBytesFn = fn uint (
    void* self,
    uint workGraphIndex,
    uint entrypointIndex);

alias IWorkGraphProperties_GetWorkGraphMemoryRequirementsFn = fn void (
    void* self,
    uint workGraphIndex,
    WorkGraphMemoryRequirements* pWorkGraphMemoryRequirements);

alias IWorkGraphProperties_GetEntrypointRecordAlignmentInBytesFn = fn uint (
    void* self,
    uint workGraphIndex,
    uint entrypointIndex);

struct IWorkGraphPropertiesVTable
{
    inline IUnknownVTable _base;
    IWorkGraphPropertiesIWorkGraphProperties_GetNumWorkGraphsFn
        workGraphProperties_GetNumWorkGraphs;
    IWorkGraphPropertiesIWorkGraphProperties_GetProgramNameFn workGraphProperties_GetProgramName;
    IWorkGraphPropertiesIWorkGraphProperties_GetWorkGraphIndexFn
        workGraphProperties_GetWorkGraphIndex;
    IWorkGraphPropertiesIWorkGraphProperties_GetNumNodesFn workGraphProperties_GetNumNodes;
    IWorkGraphProperties_GetNodeIDFn getNodeID;
    IWorkGraphProperties_GetNodeIndexFn getNodeIndex;
    IWorkGraphProperties_GetNodeLocalRootArgumentsTableIndexFn getNodeLocalRootArgumentsTableIndex;
    IWorkGraphProperties_GetNumEntrypointsFn getNumEntrypoints;
    IWorkGraphProperties_GetEntrypointIDFn getEntrypointID;
    IWorkGraphProperties_GetEntrypointIndexFn getEntrypointIndex;
    IWorkGraphProperties_GetEntrypointRecordSizeInBytesFn getEntrypointRecordSizeInBytes;
    IWorkGraphProperties_GetWorkGraphMemoryRequirementsFn getWorkGraphMemoryRequirements;
    IWorkGraphProperties_GetEntrypointRecordAlignmentInBytesFn getEntrypointRecordAlignmentInBytes;
}

// Functions of IUnknown

fn Win32_HRESULT IWorkGraphProperties.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IWorkGraphProperties.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IWorkGraphProperties.release(&self) @inline => self.vtbl.release(self);

// Function of IWorkGraphProperties

fn uint IWorkGraphProperties.workGraphProperties_GetNumWorkGraphs(&self) @inline =>
    self.vtbl.workGraphProperties_GetNumWorkGraphs(self);

fn Win32_LPCWSTR IWorkGraphProperties.workGraphProperties_GetProgramName(
    &self,
    uint workGraphIndex
) @inline =>
    self.vtbl.workGraphProperties_GetProgramName(self, workGraphIndex);

fn uint IWorkGraphProperties.workGraphProperties_GetWorkGraphIndex(
    &self,
    Win32_LPCWSTR pProgramName
) @inline =>
    self.vtbl.workGraphProperties_GetWorkGraphIndex(self, pProgramName);

fn uint IWorkGraphProperties.workGraphProperties_GetNumNodes(
    &self,
    uint workGraphIndex
) @inline =>
    self.vtbl.workGraphProperties_GetNumNodes(self, workGraphIndex);

fn NodeId* IWorkGraphProperties.getNodeID(
    &self,
    NodeId* retVal,
    uint workGraphIndex,
    uint nodeIndex
) @inline =>
    self.vtbl.getNodeID(self, retVal, workGraphIndex, nodeIndex);

fn uint IWorkGraphProperties.getNodeIndex(
    &self,
    uint workGraphIndex,
    NodeId nodeID
) @inline =>
    self.vtbl.getNodeIndex(self, workGraphIndex, nodeID);

fn uint IWorkGraphProperties.getNodeLocalRootArgumentsTableIndex(
    &self,
    uint workGraphIndex,
    uint nodeIndex
) @inline =>
    self.vtbl.getNodeLocalRootArgumentsTableIndex(self, workGraphIndex, nodeIndex);

fn uint IWorkGraphProperties.getNumEntrypoints(
    &self,
    uint workGraphIndex
) @inline =>
    self.vtbl.getNumEntrypoints(self, workGraphIndex);

fn NodeId* IWorkGraphProperties.getEntrypointID(
    &self,
    NodeId* retVal,
    uint workGraphIndex,
    uint entrypointIndex
) @inline =>
    self.vtbl.getEntrypointID(self, retVal, workGraphIndex, entrypointIndex);

fn uint IWorkGraphProperties.getEntrypointIndex(
    &self,
    uint workGraphIndex,
    NodeId nodeID
) @inline =>
    self.vtbl.getEntrypointIndex(self, workGraphIndex, nodeID);

fn uint IWorkGraphProperties.getEntrypointRecordSizeInBytes(
    &self,
    uint workGraphIndex,
    uint entrypointIndex
) @inline =>
    self.vtbl.getEntrypointRecordSizeInBytes(self, workGraphIndex, entrypointIndex);

fn void IWorkGraphProperties.getWorkGraphMemoryRequirements(
    &self,
    uint workGraphIndex,
    WorkGraphMemoryRequirements* pWorkGraphMemoryRequirements
) @inline =>
    self.vtbl.getWorkGraphMemoryRequirements(self, workGraphIndex, pWorkGraphMemoryRequirements);

fn uint IWorkGraphProperties.getEntrypointRecordAlignmentInBytes(
    &self,
    uint workGraphIndex,
    uint entrypointIndex
) @inline =>
    self.vtbl.getEntrypointRecordAlignmentInBytes(self, workGraphIndex, entrypointIndex);

enum StateSubobjectType : int
{
    STATE_OBJECT_CONFIG,
    GLOBAL_ROOT_SIGNATURE,
    LOCAL_ROOT_SIGNATURE,
    NODE_MASK,
    __UNUSED0,
    DXIL_LIBRARY,
    EXISTING_COLLECTION,
    SUBOBJECT_TO_EXPORTS_ASSOCIATION,
    DXIL_SUBOBJECT_TO_EXPORTS_ASSOCIATION,
    RAYTRACING_SHADER_CONFIG,
    RAYTRACING_PIPELINE_CONFIG,
    HIT_GROUP,
    RAYTRACING_PIPELINE_CONFIG1,
    WORK_GRAPH,
    STREAM_OUTPUT,
    BLEND,
    SAMPLE_MASK,
    RASTERIZER,
    DEPTH_STENCIL,
    INPUT_LAYOUT,
    IB_STRIP_CUT_VALUE,
    PRIMITIVE_TOPOLOGY,
    RENDER_TARGET_FORMATS,
    DEPTH_STENCIL_FORMAT,
    SAMPLE_DESC,
    __UNUSED1,
    FLAGS,
    DEPTH_STENCIL1,
    VIEW_INSTANCING,
    GENERIC_PROGRAM,
    DEPTH_STENCIL2,
    MAX_VALID,
}

struct StateSubobject
{
    StateSubobjectType type;
    void* pDesc;
}

bitstruct StateObjectFlags : uint
{
    bool allowLocalDependenciesOnExternalDefinitions : 0;
    bool allowExternalDependenciesOnLocalDefinitions : 1;
    bool allowStateObjectAdditions                   : 2;
    uint __unused0                                   : 3..31;
}

const StateObjectFlags STATE_OBJECT_FLAGS_NONE = {};

struct StateObjectConfig
{
    StateObjectFlags flags;
}

struct GlobalRootSignature
{
    IRootSignature* pGlobalRootSignature;
}

struct LocalRootSignature
{
    IRootSignature* pLocalRootSignature;
}

struct NodeMask
{
    uint nodeMask;
}

struct SampleMask
{
    uint sampleMask;
}

struct IbStripCutValue
{
    IndexBufferStripCutValue indexBufferStripCutValue;
}

struct PrimitiveTopologyDesc
{
    PrimitiveTopologyType primitiveTopology;
}

struct DepthStencilFormat
{
    Format depthStencilFormat;
}

bitstruct ExportFlags : uint
{
    uint __unused0 : 31..31;
}

const ExportFlags EXPORT_FLAGS_NONE = {};

struct ExportDesc
{
    Win32_LPCWSTR name;
    Win32_LPCWSTR exportToRename;
    ExportFlags flags;
}

struct DxilLibraryDesc
{
    ShaderBytecode dxilLibrary;
    uint numExports;
    ExportDesc* pExports;
}

struct ExistingCollectionDesc
{
    IStateObject* pExistingCollection;
    uint numExports;
    ExportDesc* pExports;
}

struct SubobjectToExportsAssociation
{
    StateSubobject* pSubobjectToAssociate;
    uint numExports;
    Win32_LPCWSTR* pExports;
}

struct DxilSubobjectToExportsAssociation
{
    Win32_LPCWSTR subobjectToAssociate;
    uint numExports;
    Win32_LPCWSTR* pExports;
}

enum HitGroupType : int
{
    TRIANGLES,
    PROCEDURAL_PRIMITIVE,
}

struct HitGroupDesc
{
    Win32_LPCWSTR hitGroupExport;
    HitGroupType type;
    Win32_LPCWSTR anyHitShaderImport;
    Win32_LPCWSTR closestHitShaderImport;
    Win32_LPCWSTR intersectionShaderImport;
}

struct RaytracingShaderConfig
{
    uint maxPayloadSizeInBytes;
    uint maxAttributeSizeInBytes;
}

struct RaytracingPipelineConfig
{
    uint maxTraceRecursionDepth;
}

bitstruct RaytracingPipelineFlags : uint
{
    uint __unused0                : 0..7;
    bool skipTriangles            : 8;
    bool skipProceduralPrimitives : 9;
    uint __unused1                : 10..31;
}

const RaytracingPipelineFlags RAYTRACING_PIPELINE_FLAGS_NONE = {};

struct RaytracingPipelineConfig1
{
    uint maxTraceRecursionDepth;
    RaytracingPipelineFlags flags;
}

struct NodeOutputOverrides
{
    uint outputIndex;
    NodeId* pNewName;
    Bool* pAllowSparseNodes;
    uint* pMaxRecords;
    uint* pMaxRecordsSharedWithOutputIndex;
}

struct BroadcastingLaunchOverrides
{
    uint* pLocalRootArgumentsTableIndex;
    Bool* pProgramEntry;
    NodeId* pNewName;
    NodeId* pShareInputOf;
    uint* pDispatchGrid;
    uint* pMaxDispatchGrid;
    uint numOutputOverrides;
    NodeOutputOverrides* pOutputOverrides;
}

struct CoalescingLaunchOverrides
{
    uint* pLocalRootArgumentsTableIndex;
    Bool* pProgramEntry;
    NodeId* pNewName;
    NodeId* pShareInputOf;
    uint numOutputOverrides;
    NodeOutputOverrides* pOutputOverrides;
}

struct ThreadLaunchOverrides
{
    uint* pLocalRootArgumentsTableIndex;
    Bool* pProgramEntry;
    NodeId* pNewName;
    NodeId* pShareInputOf;
    uint numOutputOverrides;
    NodeOutputOverrides* pOutputOverrides;
}

struct CommonComputeNodeOverrides
{
    uint* pLocalRootArgumentsTableIndex;
    Bool* pProgramEntry;
    NodeId* pNewName;
    NodeId* pShareInputOf;
    uint numOutputOverrides;
    NodeOutputOverrides* pOutputOverrides;
}

enum NodeOverridesType : int
{
    NONE,
    BROADCASTING_LAUNCH,
    COALESCING_LAUNCH,
    THREAD_LAUNCH,
    COMMON_COMPUTE,
}

struct ShaderNode
    {
    Win32_LPCWSTR shader;
    NodeOverridesType overridesType;
    union
    {
        BroadcastingLaunchOverrides* pBroadcastingLaunchOverrides;
        CoalescingLaunchOverrides* pCoalescingLaunchOverrides;
        ThreadLaunchOverrides* pThreadLaunchOverrides;
        CommonComputeNodeOverrides* pCommonComputeNodeOverrides;
    }
}

enum NodeType : int
{
    SHADER,
}

struct Node
{
    NodeType nodeType;
    union
    {
        ShaderNode shader;
    }
}

bitstruct WorkGraphFlags : uint
{
    bool includeAllAvailableNodes : 0;
    uint __unused0                : 1..31;
}

const WorkGraphFlags WORK_GRAPH_FLAGS_NONE = {};

struct WorkGraphDesc
{
    Win32_LPCWSTR programName;
    WorkGraphFlags flags;
    uint numEntrypoints;
    NodeId* pEntrypoints;
    uint numExplicitlyDefinedNodes;
    Node* pExplicitlyDefinedNodes;
}

struct GenericProgramDesc
{
    Win32_LPCWSTR programName;
    uint numExports;
    Win32_LPCWSTR* pExports;
    uint numSubobjects;
    StateSubobject** ppSubobjects;
}

enum StateObjectType : int
{
    COLLECTION,
    __UNUSED0,
    __UNUSED1,
    RAYTRACING_PIPELINE,
    EXECUTABLE,
}

struct StateObjectDesc
{
    StateObjectType type;
    uint numSubobjects;
    StateSubobject* pSubobjects;
}

bitstruct RaytracingGeometryFlags : uint
{
    bool opaque                      : 0;
    bool noDuplicateAnyhitInvocation : 1;
    uint __unused0                   : 2..31;
}

const RaytracingGeometryFlags RAYTRACING_GEOMETRY_FLAGS_NONE = {};

enum RaytracingGeometryType : int
{
    TRIANGLES,
    PROCEDURAL_PRIMITIVE_AABBS,
}

bitstruct RaytracingInstanceFlags : uint
{
    bool triangleCullDisable           : 0;
    bool triangleFrontCounterclockwise : 1;
    bool forceOpaque                   : 2;
    bool forceNonOpaque                : 3;
    uint __unused0                     : 4..31;
}

const RaytracingInstanceFlags RAYTRACING_INSTANCE_FLAGS_NONE = {};

struct GpuVirtualAddressAndStride
{
    GpuVirtualAddress startAddress;
    ulong strideInBytes;
}

struct GpuVirtualAddressRange
{
    GpuVirtualAddress startAddress;
    ulong sizeInBytes;
}

struct GpuVirtualAddressRangeAndStride
{
    GpuVirtualAddress startAddress;
    ulong sizeInBytes;
    ulong strideInBytes;
}

struct RaytracingGeometryTrianglesDesc
{
    GpuVirtualAddress transform3x4;
    Format indexFormat;
    Format vertexFormat;
    uint indexCount;
    uint vertexCount;
    GpuVirtualAddress indexBuffer;
    GpuVirtualAddressAndStride vertexBuffer;
}

struct RaytracingAabb
{
    float minX;
    float minY;
    float minZ;
    float maxX;
    float maxY;
    float maxZ;
}

struct RaytracingGeometryAabbsDesc
{
    ulong aabbCount;
    GpuVirtualAddressAndStride aabbs;
}

bitstruct RaytracingAccelerationStructureBuildFlags : uint
{
    bool allowUpdate     : 0;
    bool allowCompaction : 1;
    bool preferFastTrace : 2;
    bool preferFastBuild : 3;
    bool minimizeMemory  : 4;
    bool performUpdate   : 5;
    uint __unused0       : 6..31;
}

const RaytracingAccelerationStructureBuildFlags
    RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAGS_NONE = {};

enum RaytracingAccelerationStructureCopyMode : int
{
    CLONE,
    COMPACT,
    VISUALIZATION_DECODE_FOR_TOOLS,
    SERIALIZE,
    DESERIALIZE,
}

enum RaytracingAccelerationStructureType : int
{
    TOP_LEVEL,
    BOTTOM_LEVEL,
}

enum ElementsLayout
{
    ARRAY,
    ARRAY_OF_POINTERS,
}

enum RaytracingAccelerationStructurePostbuildInfoType : int
{
    COMPACTED_SIZE,
    TOOLS_VISUALIZATION,
    SERIALIZATION,
    CURRENT_SIZE,
}

struct RaytracingAccelerationStructurePostbuildInfoDesc
{
    GpuVirtualAddress destBuffer;
    RaytracingAccelerationStructurePostbuildInfoType infoType;
}

struct RaytracingAccelerationStructurePostbuildInfoCompactedSizeDesc
{
    ulong compactedSizeInBytes;
}

struct RaytracingAccelerationStructurePostbuildInfoToolsVisualizationDesc
{
    ulong decodedSizeInBytes;
}

struct BuildRaytracingAccelerationStructureToolsVisualizationHeader
{
    RaytracingAccelerationStructureType type;
    uint numDescs;
}

struct RaytracingAccelerationStructurePostbuildInfoSerializationDesc
{
    ulong serializedSizeInBytes;
    ulong numBottomLevelAccelerationStructurePointers;
}

struct SerializedDataDriverMatchingIdentifier
{
    Win32_GUID driverOpaqueGUID;
    char[16] driverOpaqueVersioningData;
}

enum SerializedDataType : int
{
    SERIALIZED_DATA_RAYTRACING_ACCELERATION_STRUCTURE,
}

enum DriverMatchingIdentifierStatus : int
{
    COMPATIBLE_WITH_DEVICE,
    UNSUPPORTED_TYPE,
    UNRECOGNIZED,
    INCOMPATIBLE_VERSION,
    INCOMPATIBLE_TYPE,
}

struct SerializedRaytracingAccelerationStructureHeader
{
    SerializedDataDriverMatchingIdentifier driverMatchingIdentifier;
    ulong serializedSizeInBytesIncludingHeader;
    ulong deserializedSizeInBytes;
    ulong numBottomLevelAccelerationStructurePointersAfterHeader;
}

struct RaytracingAccelerationStructurePostbuildInfoCurrentSizeDesc
{
    ulong currentSizeInBytes;
}

struct RaytracingInstanceDesc
{
    float[4][3] transform;
    uint instanceID;
    uint instanceMask;
    uint instanceContributionToHitGroupIndex;
    uint flags;
    GpuVirtualAddress accelerationStructure;
}

struct RaytracingGeometryDesc
{
    RaytracingGeometryType type;
    RaytracingGeometryFlags flags;
    union
    {
        RaytracingGeometryTrianglesDesc triangles;
        RaytracingGeometryAabbsDesc aABBs;
    }
}

struct BuildRaytracingAccelerationStructureInputs
{
    RaytracingAccelerationStructureType type;
    RaytracingAccelerationStructureBuildFlags flags;
    uint numDescs;
    ElementsLayout descsLayout;
    union
    {
        GpuVirtualAddress instanceDescs;
        RaytracingGeometryDesc* pGeometryDescs;
        RaytracingGeometryDesc** ppGeometryDescs;
    }
}

struct BuildRaytracingAccelerationStructureDesc
{
    GpuVirtualAddress destAccelerationStructureData;
    BuildRaytracingAccelerationStructureInputs inputs;
    GpuVirtualAddress sourceAccelerationStructureData;
    GpuVirtualAddress scratchAccelerationStructureData;
}

struct RaytracingAccelerationStructurePrebuildInfo
{
    ulong resultDataMaxSizeInBytes;
    ulong scratchDataSizeInBytes;
    ulong updateScratchDataSizeInBytes;
}

bitstruct RayFlags : uint
{
    bool forceOpaque                : 0;
    bool forceNonOpaque             : 1;
    bool acceptFirstHitAndEndSearch : 2;
    bool skipClosestHitShader       : 3;
    bool cullBackFacingTriangles    : 4;
    bool cullFrontFacingTriangles   : 5;
    bool cullOpaque                 : 6;
    bool cullNonOpaque              : 7;
    bool skipTriangles              : 8;
    bool skipProceduralPrimitives   : 9;
    uint __unused0                  : 10 ..31;
}

const RayFlags RAY_FLAGS_NONE = {};

typedef HitKind = int;
const HitKind HIT_KIND_TRIANGLE_FRONT_FACE = 0xfe;
const HitKind HIT_KIND_TRIANGLE_BACK_FACE  = 0xff;

enum AutoBreadcrumbOp : int
{
    SETMARKER,
    BEGINEVENT,
    ENDEVENT,
    DRAWINSTANCED,
    DRAWINDEXEDINSTANCED,
    EXECUTEINDIRECT,
    DISPATCH,
    COPYBUFFERREGION,
    COPYTEXTUREREGION,
    COPYRESOURCE,
    COPYTILES,
    RESOLVESUBRESOURCE,
    CLEARRENDERTARGETVIEW,
    CLEARUNORDEREDACCESSVIEW,
    CLEARDEPTHSTENCILVIEW,
    RESOURCEBARRIER,
    EXECUTEBUNDLE,
    PRESENT,
    RESOLVEQUERYDATA,
    BEGINSUBMISSION,
    ENDSUBMISSION,
    DECODEFRAME,
    PROCESSFRAMES,
    ATOMICCOPYBUFFERUINT,
    ATOMICCOPYBUFFERUINT64,
    RESOLVESUBRESOURCEREGION,
    WRITEBUFFERIMMEDIATE,
    DECODEFRAME1,
    SETPROTECTEDRESOURCESESSION,
    DECODEFRAME2,
    PROCESSFRAMES1,
    BUILDRAYTRACINGACCELERATIONSTRUCTURE,
    EMITRAYTRACINGACCELERATIONSTRUCTUREPOSTBUILDINFO,
    COPYRAYTRACINGACCELERATIONSTRUCTURE,
    DISPATCHRAYS,
    INITIALIZEMETACOMMAND,
    EXECUTEMETACOMMAND,
    ESTIMATEMOTION,
    RESOLVEMOTIONVECTORHEAP,
    SETPIPELINESTATE1,
    INITIALIZEEXTENSIONCOMMAND,
    EXECUTEEXTENSIONCOMMAND,
    DISPATCHMESH,
    ENCODEFRAME,
    RESOLVEENCODEROUTPUTMETADATA,
    BARRIER,
    BEGIN_COMMAND_LIST,
    DISPATCHGRAPH,
    SETPROGRAM,
    __UNUSED0,
    __UNUSED1,
    __UNUSED2,
    PROCESSFRAMES2,
}

struct AutoBreadcrumbNode
{
    char* pCommandListDebugNameA;
    Win32_WCHAR* pCommandListDebugNameW;
    char* pCommandQueueDebugNameA;
    Win32_WCHAR* pCommandQueueDebugNameW;
    IGraphicsCommandList* pCommandList;
    ICommandQueue* pCommandQueue;
    uint breadcrumbCount;
    uint* pLastBreadcrumbValue;
    AutoBreadcrumbOp* pCommandHistory;
    AutoBreadcrumbNode* pNext;
}

struct DredBreadcrumbContext
{
    uint breadcrumbIndex;
    Win32_WCHAR* pContextString;
}

struct AutoBreadcrumbNode1
{
    char* pCommandListDebugNameA;
    Win32_WCHAR* pCommandListDebugNameW;
    char* pCommandQueueDebugNameA;
    Win32_WCHAR* pCommandQueueDebugNameW;
    IGraphicsCommandList* pCommandList;
    ICommandQueue* pCommandQueue;
    uint breadcrumbCount;
    uint* pLastBreadcrumbValue;
    AutoBreadcrumbOp* pCommandHistory;
    AutoBreadcrumbNode1* pNext;
    uint breadcrumbContextsCount;
    DredBreadcrumbContext* pBreadcrumbContexts;
}

enum DredVersion : int
{
    __UNUSED0,
    VERSION_1_0,
    VERSION_1_1,
    VERSION_1_2,
    VERSION_1_3,
}

bitstruct DredFlags : uint
{
    bool forceEnable            : 0;
    bool disableAutobreadcrumbs : 1;
    uint __unused0              : 2..31;
}

const DredFlags DRED_FLAGS_NONE = {};

enum DredEnablement : int
{
    SYSTEM_CONTROLLED,
    FORCED_OFF,
    FORCED_ON,
}

struct DeviceRemovedExtendedData
{
    DredFlags flags;
    AutoBreadcrumbNode* pHeadAutoBreadcrumbNode;
}

enum DredAllocationType : int
{
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
    __UNUSED11,
    __UNUSED12,
    __UNUSED13,
    __UNUSED14,
    __UNUSED15,
    __UNUSED16,
    __UNUSED17,
    __UNUSED18,
    COMMAND_QUEUE,
    COMMAND_ALLOCATOR,
    PIPELINE_STATE,
    COMMAND_LIST,
    FENCE,
    DESCRIPTOR_HEAP,
    HEAP,
    __UNUSED19,
    QUERY_HEAP,
    COMMAND_SIGNATURE,
    PIPELINE_LIBRARY,
    VIDEO_DECODER,
    __UNUSED20,
    VIDEO_PROCESSOR,
    __UNUSED21,
    RESOURCE,
    PASS,
    CRYPTOSESSION,
    CRYPTOSESSIONPOLICY,
    PROTECTEDRESOURCESESSION,
    VIDEO_DECODER_HEAP,
    COMMAND_POOL,
    COMMAND_RECORDER,
    STATE_OBJECT,
    METACOMMAND,
    SCHEDULINGGROUP,
    VIDEO_MOTION_ESTIMATOR,
    VIDEO_MOTION_VECTOR_HEAP,
    VIDEO_EXTENSION_COMMAND,
    VIDEO_ENCODER,
    VIDEO_ENCODER_HEAP,
}

const DRED_ALLOCATION_TYPE_INVALID = -1;

struct DredAllocationNode
{
    ZString objectNameA;
    Win32_WCHAR* objectNameW;
    DredAllocationType allocationType;
    DredAllocationNode* pNext;
}

struct DredAllocationNode1
{
    ZString objectNameA;
    Win32_WCHAR* objectNameW;
    DredAllocationType allocationType;
    DredAllocationNode1* pNext;
    IUnknown* pObject;
}

struct DredAutoBreadcrumbsOutput
{
    AutoBreadcrumbNode* pHeadAutoBreadcrumbNode;
}

struct DredAutoBreadcrumbsOutput1
{
    AutoBreadcrumbNode1* pHeadAutoBreadcrumbNode;
}

struct DredPageFaultOutput
{
    GpuVirtualAddress pageFaultVA;
    DredAllocationNode* pHeadExistingAllocationNode;
    DredAllocationNode* pHeadRecentFreedAllocationNode;
}

struct DredPageFaultOutput1
{
    GpuVirtualAddress pageFaultVA;
    DredAllocationNode1* pHeadExistingAllocationNode;
    DredAllocationNode1* pHeadRecentFreedAllocationNode;
}

bitstruct DredPageFaultFlags : uint
{
    uint __unused0 : 0..31;
}

const DredPageFaultFlags DRED_PAGE_FAULT_FLAGS_NONE = {};

enum DredDeviceState : int
{
    UNKNOWN,
    __UNUSED0,
    __UNUSED1,
    HUNG,
    __UNUSED3,
    __UNUSED4,
    FAULT,
    PAGEFAULT,
}

struct DredPageFaultOutput2
{
    GpuVirtualAddress pageFaultVA;
    DredAllocationNode1 *pHeadExistingAllocationNode;
    DredAllocationNode1 *pHeadRecentFreedAllocationNode;
    DredPageFaultFlags pageFaultFlags;
}

struct DeviceRemovedExtendedData1
{
    Win32_HRESULT deviceRemovedReason;
    DredAutoBreadcrumbsOutput autoBreadcrumbsOutput;
    DredPageFaultOutput pageFaultOutput;
}

struct DeviceRemovedExtendedData2
{
    Win32_HRESULT deviceRemovedReason;
    DredAutoBreadcrumbsOutput1 autoBreadcrumbsOutput;
    DredPageFaultOutput1 pageFaultOutput;
}

struct DeviceRemovedExtendedData3
{
    Win32_HRESULT deviceRemovedReason;
    DredAutoBreadcrumbsOutput1 autoBreadcrumbsOutput;
    DredPageFaultOutput2 pageFaultOutput;
    DredDeviceState deviceState;
}

struct VersionedDeviceRemovedExtendedData
{
    DredVersion version;
    union
    {
        DeviceRemovedExtendedData dred_1_0;
        DeviceRemovedExtendedData1 dred_1_1;
        DeviceRemovedExtendedData2 dred_1_2;
        DeviceRemovedExtendedData3 dred_1_3;
    }
}

// =============================================================================
// IDeviceRemovedExtendedDataSettings
// =============================================================================

const IDEVICE_REMOVED_EXTENDED_DATA_SETTINGS_UUID_STRING = "82BC481C-6B9B-4030-AEDB-7EE3D1DF1E63";
const Win32_GUID IDEVICE_REMOVED_EXTENDED_DATA_SETTINGS_UUID = {
    0x82BC481C, 0x6B9B, 0x4030, { 0xAE, 0xDB, 0x7E, 0xE3, 0xD1, 0xDF, 0x1E, 0x63 } };

const IDEVICE_REMOVED_EXTENDED_DATA_SETTINGS1_UUID_STRING = "DBD5AE51-3317-4F0A-ADF9-1D7CEDCAAE0B";
const Win32_GUID IDEVICE_REMOVED_EXTENDED_DATA_SETTINGS1_UUID = {
    0xDBD5AE51, 0x3317, 0x4F0A, { 0xAD, 0xF9, 0x1D, 0x7C, 0xED, 0xCA, 0xAE, 0x0B } };

const IDEVICE_REMOVED_EXTENDED_DATA_SETTINGS2_UUID_STRING = "61552388-01ab-4008-a436-83db189566ea";
const Win32_GUID IDEVICE_REMOVED_EXTENDED_DATA_SETTINGS2_UUID = {
    0x61552388, 0x01ab, 0x4008, { 0xa4, 0x36, 0x83, 0xdb, 0x18, 0x95, 0x66, 0xea } };

struct IDeviceRemovedExtendedDataSettings
{
    IDeviceRemovedExtendedDataSettingsVTable* vtbl;
}

typedef IDeviceRemovedExtendedDataSettings1 = inline IDeviceRemovedExtendedDataSettings;
typedef IDeviceRemovedExtendedDataSettings2 = inline IDeviceRemovedExtendedDataSettings;

// Functions pointers of IDeviceRemovedExtendedDataSettings

alias IDeviceRemovedExtendedDataSettings_SetAutoBreadcrumbsEnablementFn = fn void (
    void* self,
    DredEnablement enablement);

alias IDeviceRemovedExtendedDataSettings_SetPageFaultEnablementFn = fn void (
    void* self,
    DredEnablement enablement);

alias IDeviceRemovedExtendedDataSettings_SetWatsonDumpEnablementFn = fn void (
    void* self,
    DredEnablement enablement);

// Functions pointers of IDeviceRemovedExtendedDataSettings1

alias IDeviceRemovedExtendedDataSettings1_SetBreadcrumbContextEnablementFn = fn void (
    void* self,
    DredEnablement enablement);

// Functions pointers of IDeviceRemovedExtendedDataSettings2

alias IDeviceRemovedExtendedDataSettings2_UseMarkersOnlyAutoBreadcrumbsFn = fn void (
    void* self,
    Bool markersOnly);

struct IDeviceRemovedExtendedDataSettingsVTable
{
    inline IUnknownVTable _base;

    // IDeviceRemovedExtendedDataSettings
    IDeviceRemovedExtendedDataSettings_SetAutoBreadcrumbsEnablementFn setAutoBreadcrumbsEnablement;
    IDeviceRemovedExtendedDataSettings_SetPageFaultEnablementFn setPageFaultEnablement;
    IDeviceRemovedExtendedDataSettings_SetWatsonDumpEnablementFn setWatsonDumpEnablement;

    // IDeviceRemovedExtendedDataSettings1
    IDeviceRemovedExtendedDataSettings1_SetBreadcrumbContextEnablementFn
        setBreadcrumbContextEnablement;

    // IDeviceRemovedExtendedDataSettings2
    IDeviceRemovedExtendedDataSettings2_UseMarkersOnlyAutoBreadcrumbsFn
        useMarkersOnlyAutoBreadcrumbs;
}

// Functions of IUnknown

fn Win32_HRESULT IDeviceRemovedExtendedDataSettings.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDeviceRemovedExtendedDataSettings.addRef(&self) @inline =>
    self.vtbl.addRef(self);

fn Win32_DWORD IDeviceRemovedExtendedDataSettings.release(&self) @inline =>
    self.vtbl.release(self);

// Functions of IDeviceRemovedExtendedDataSettings

fn void IDeviceRemovedExtendedDataSettings.setAutoBreadcrumbsEnablement(
    &self,
    DredEnablement enablement
) @inline =>
    self.vtbl.setAutoBreadcrumbsEnablement(self, enablement);

fn void IDeviceRemovedExtendedDataSettings.setPageFaultEnablement(
    &self,
    DredEnablement enablement
) @inline =>
    self.vtbl.setPageFaultEnablement(self, enablement);

fn void IDeviceRemovedExtendedDataSettings.setWatsonDumpEnablement(
    &self,
    DredEnablement enablement
) @inline =>
    self.vtbl.setWatsonDumpEnablement(self, enablement);

// Functions of IDeviceRemovedExtendedDataSettings1

fn void IDeviceRemovedExtendedDataSettings1.setBreadcrumbContextEnablement(
    &self,
    DredEnablement enablement
) @inline =>
    self.vtbl.setBreadcrumbContextEnablement(self, enablement);

// Functions of IDeviceRemovedExtendedDataSettings2

fn void IDeviceRemovedExtendedDataSettings2.useMarkersOnlyAutoBreadcrumbs(
    &self,
    Bool markersOnly
) @inline =>
    self.vtbl.useMarkersOnlyAutoBreadcrumbs(self, markersOnly);

// =============================================================================
// IDeviceRemovedExtendedData
// =============================================================================

const IDEVICE_REMOVED_EXTENDED_DATA_UUID_STRING = "98931D33-5AE8-4791-AA3C-1A73A2934E71";
const Win32_GUID IDEVICE_REMOVED_EXTENDED_DATA_UUID = {
    0x98931D33, 0x5AE8, 0x4791, { 0xAA, 0x3C, 0x1A, 0x73, 0xA2, 0x93, 0x4E, 0x71 } };

const IDEVICE_REMOVED_EXTENDED_DATA1_UUID_STRING = "9727A022-CF1D-4DDA-9EBA-EFFA653FC506";
const Win32_GUID IDEVICE_REMOVED_EXTENDED_DATA1_UUID = {
    0x9727A022, 0xCF1D, 0x4DDA, { 0x9E, 0xBA, 0xEF, 0xFA, 0x65, 0x3F, 0xC5, 0x06 } };

const IDEVICE_REMOVED_EXTENDED_DATA2_UUID_STRING = "67FC5816-E4CA-4915-BF18-42541272DA54";
const Win32_GUID IDEVICE_REMOVED_EXTENDED_DATA2_UUID = {
    0x67FC5816, 0xE4CA, 0x4915, { 0xBF, 0x18, 0x42, 0x54, 0x12, 0x72, 0xDA, 0x54 } };

struct IDeviceRemovedExtendedData
{
    IDeviceRemovedExtendedDataVTable* vtbl;
}

typedef IDeviceRemovedExtendedData1 = inline IDeviceRemovedExtendedData;
typedef IDeviceRemovedExtendedData2 = inline IDeviceRemovedExtendedData;

// Function pointers of IDeviceRemovedExtendedData

alias IDeviceRemovedExtendedData_GetAutoBreadcrumbsOutputFn = fn Win32_HRESULT (
    void* self,
    DredAutoBreadcrumbsOutput* pOutput);

alias IDeviceRemovedExtendedData_GetPageFaultAllocationOutputFn = fn Win32_HRESULT (
    void* self,
    DredPageFaultOutput* pOutput);

// Function pointers of IDeviceRemovedExtendedData1

alias IDeviceRemovedExtendedData1_GetAutoBreadcrumbsOutput1Fn = fn Win32_HRESULT (
    void* self,
    DredAutoBreadcrumbsOutput1* pOutput);

alias IDeviceRemovedExtendedData1_GetPageFaultAllocationOutput1Fn = fn Win32_HRESULT (
    void* self,
    DredPageFaultOutput1* pOutput);

// Function pointers of IDeviceRemovedExtendedData2

alias IDeviceRemovedExtendedData2_GetPageFaultAllocationOutput2Fn = fn Win32_HRESULT (
    void* self,
    DredPageFaultOutput2* pOutput);

alias IDeviceRemovedExtendedData2_GetDeviceStateFn = fn DredDeviceState (void* self);

struct IDeviceRemovedExtendedDataVTable
{
    inline IUnknownVTable _base;
    IDeviceRemovedExtendedData_GetAutoBreadcrumbsOutputFn getAutoBreadcrumbsOutput;
    IDeviceRemovedExtendedData_GetPageFaultAllocationOutputFn getPageFaultAllocationOutput;

    // IDeviceRemovedExtendedData1
    IDeviceRemovedExtendedData1_GetAutoBreadcrumbsOutput1Fn getAutoBreadcrumbsOutput1;
    IDeviceRemovedExtendedData1_GetPageFaultAllocationOutput1Fn getPageFaultAllocationOutput1;

    // IDeviceRemovedExtendedData2
    IDeviceRemovedExtendedData2_GetPageFaultAllocationOutput2Fn getPageFaultAllocationOutput2;
    IDeviceRemovedExtendedData2_GetDeviceStateFn getDeviceState;
}

// Function  of IUnknown

fn Win32_HRESULT IDeviceRemovedExtendedData.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDeviceRemovedExtendedData.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDeviceRemovedExtendedData.release(&self) @inline => self.vtbl.release(self);

// Function of IDeviceRemovedExtendedData

fn Win32_HRESULT IDeviceRemovedExtendedData.getAutoBreadcrumbsOutput(
    &self,
    DredAutoBreadcrumbsOutput* pOutput
) @inline =>
    self.vtbl.getAutoBreadcrumbsOutput(self, pOutput);

fn Win32_HRESULT IDeviceRemovedExtendedData.getPageFaultAllocationOutput(
    &self,
    DredPageFaultOutput* pOutput
) @inline =>
    self.vtbl.getPageFaultAllocationOutput(self, pOutput);

// Function of IDeviceRemovedExtendedData1

fn Win32_HRESULT IDeviceRemovedExtendedData.getAutoBreadcrumbsOutput1(
    &self,
    DredAutoBreadcrumbsOutput1* pOutput
) @inline =>
    self.vtbl.getAutoBreadcrumbsOutput1(self, pOutput);

fn Win32_HRESULT IDeviceRemovedExtendedData.getPageFaultAllocationOutput1(
    &self,
    DredPageFaultOutput1* pOutput
) @inline =>
    self.vtbl.getPageFaultAllocationOutput1(self, pOutput);

// Function of IDeviceRemovedExtendedData2

fn Win32_HRESULT IDeviceRemovedExtendedData.getPageFaultAllocationOutput2(
    &self,
    DredPageFaultOutput2* pOutput
) @inline =>
    self.vtbl.getPageFaultAllocationOutput2(self, pOutput);

fn DredDeviceState IDeviceRemovedExtendedData.getDeviceState(&self) @inline =>
    self.vtbl.getDeviceState(self);

// ---

enum BackgroundProcessingMode : int
{
    ALLOWED,
    ALLOW_INTRUSIVE_MEASUREMENTS,
    DISABLE_BACKGROUND_WORK,
    DISABLE_PROFILING_BY_SYSTEM,
}

enum MeasurementsAction : int
{
    KEEP_ALL,
    COMMIT_RESULTS,
    COMMIT_RESULTS_HIGH_PRIORITY,
    DISCARD_PREVIOUS,
}

const Win32_GUID PROTECTED_RESOURCES_SESSION_HARDWARE_PROTECTED = {
    0x62B0084E, 0xC70E, 0x4DAA, { 0xA1, 0x09, 0x30, 0xFF, 0x8D, 0x5A, 0x04, 0x82 } };

struct FeatureDataProtectedResourceSessionTypeCount
{
    uint nodeIndex;
    uint count;
}

struct FeatureDataProtectedResourceSessionTypes
{
    uint nodeIndex;
    uint count;
    Win32_GUID *pTypes;
}

struct ProtectedResourceSessionDesc1
{
    uint nodeMask;
    ProtectedResourceSessionFlags flags;
    Win32_GUID protectionType;
}

enum RenderPassBeginningAccessType : int
{
    DISCARD,
    PRESERVE,
    CLEAR,
    NO_ACCESS,
    PRESERVE_LOCAL_RENDER,
    PRESERVE_LOCAL_SRV,
    PRESERVE_LOCAL_UAV,
}

struct RenderPassBeginningAccessClearParameters
{
    ClearValue clearValue;
}

struct RenderPassBeginningAccessPreserveLocalParameters
{
    uint additionalWidth;
    uint additionalHeight;
}

struct RenderPassBeginningAccess
{
    RenderPassBeginningAccessType type;
    union
    {
        RenderPassBeginningAccessClearParameters clear;
        RenderPassBeginningAccessPreserveLocalParameters preserveLocal;
    }
}

enum RenderPassEndingAccessType : int
{
    DISCARD,
    PRESERVE,
    RESOLVE,
    NO_ACCESS,
    PRESERVE_LOCAL_RENDER,
    PRESERVE_LOCAL_SRV,
    PRESERVE_LOCAL_UAV,
}

struct RenderPassEndingAccessResolveSubresourceParameters
{
    uint srcSubresource;
    uint dstSubresource;
    uint dstX;
    uint dstY;
    Win32_RECT srcRect;
}

struct RenderPassEndingAccessResolveParameters
{
    IResource *pSrcResource;
    IResource *pDstResource;
    uint subresourceCount;
    RenderPassEndingAccessResolveSubresourceParameters* pSubresourceParameters;
    Format format;
    ResolveMode resolveMode;
    Bool preserveResolveSource;
}

struct RenderPassEndingAccessPreserveLocalParameters
{
    uint additionalWidth;
    uint additionalHeight;
}

struct RenderPassEndingAccess
{
    RenderPassEndingAccessType type;
    union
    {
    RenderPassEndingAccessResolveParameters resolve;
    RenderPassEndingAccessPreserveLocalParameters preserveLocal;
    }
}

struct RenderPassRenderTargetDesc
{
    CpuDescriptorHandle cpuDescriptor;
    RenderPassBeginningAccess beginningAccess;
    RenderPassEndingAccess endingAccess;
}

struct RenderPassDepthStencilDesc
{
    CpuDescriptorHandle cpuDescriptor;
    RenderPassBeginningAccess depthBeginningAccess;
    RenderPassBeginningAccess stencilBeginningAccess;
    RenderPassEndingAccess depthEndingAccess;
    RenderPassEndingAccess stencilEndingAccess;
}

bitstruct RenderPassFlags : uint
{
    bool allowUavWrites      : 0;
    bool suspendingPass      : 1;
    bool resumingPass        : 2;
    bool bindReadOnlyDepth   : 3;
    bool bindReadOnlyStencil : 4;
    uint __unused0           : 5..31;
}

const RenderPassFlags RENDER_PASS_FLAGS_NONE = {};

// =============================================================================
// IMetaCommand
// =============================================================================;

const IMETA_COMMAND_UUID_STRING = "DBB84C27-36CE-4FC9-B801-F048C46AC570";
const Win32_GUID IMETA_COMMAND_UUID = {
    0xDBB84C27, 0x36CE, 0x4FC9, { 0xB8, 0x01, 0xF0, 0x48, 0xC4, 0x6A, 0xC5, 0x70 } };

struct IMetaCommand
{
    IMetaCommandVTable* vtbl;
}

alias IMetaCommand_GetRequiredParameterResourceSizeFn = fn ulong (
    void* self,
    MetaCommandParameterStage stage,
    uint parameterIndex);

struct IMetaCommandVTable
{
    inline IPageableVTable _base;
    IMetaCommand_GetRequiredParameterResourceSizeFn getRequiredParameterResourceSize;
}

// Functions of IUnknown

fn Win32_HRESULT IMetaCommand.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IMetaCommand.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IMetaCommand.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IMetaCommand.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IMetaCommand.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IMetaCommand.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IMetaCommand.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IMetaCommand.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Functions of IMetaCommand

fn ulong IMetaCommand.getRequiredParameterResourceSize(
    &self,
    MetaCommandParameterStage stage,
    uint parameterIndex
) @inline =>
    self.vtbl.getRequiredParameterResourceSize(self, stage, parameterIndex);

// ---

struct DispatchRaysDesc
{
    GpuVirtualAddressRange rayGenerationShaderRecord;
    GpuVirtualAddressRangeAndStride missShaderTable;
    GpuVirtualAddressRangeAndStride hitGroupTable;
    GpuVirtualAddressRangeAndStride callableShaderTable;
    uint width;
    uint height;
    uint depth;
}

bitstruct SetWorkGraphFlags : uint
{
    bool initialize : 0;
    uint __unused0  : 1..31;
}

const SetWorkGraphFlags SET_WORK_GRAPH_FLAGS_NONE = {};

struct SetWorkGraphDesc
{
    ProgramIdentifier programIdentifier;
    SetWorkGraphFlags flags;
    GpuVirtualAddressRange backingMemory;
    GpuVirtualAddressRangeAndStride nodeLocalRootArgumentsTable;
}

struct SetRaytracingPipelineDesc
{
    ProgramIdentifier programIdentifier;
}

struct SetGenericPipelineDesc
{
    ProgramIdentifier programIdentifier;
}

enum ProgramType : int
{
    __UNUSED0,
    GENERIC_PIPELINE,
    __UNUSED1,
    __UNUSED2,
    RAYTRACING_PIPELINE,
    WORK_GRAPH,
}

struct SetProgramDesc
{
    ProgramType type;
    union
    {
        SetGenericPipelineDesc genericPipeline;
        SetRaytracingPipelineDesc raytracingPipeline;
        SetWorkGraphDesc workGraph;
    }
}

enum DispatchMode : int
{
    NODE_CPU_INPUT,
    NODE_GPU_INPUT,
    MULTI_NODE_CPU_INPUT,
    MULTI_NODE_GPU_INPUT,
}

struct NodeCpuInput
{
    uint entrypointIndex;
    uint numRecords;
    void* pRecords;
    ulong recordStrideInBytes;
}

struct NodeGpuInput
{
    uint entrypointIndex;
    uint numRecords;
    GpuVirtualAddressAndStride records;
}

struct MultiNodeCpuInput
{
    uint numNodeInputs;
    NodeCpuInput* pNodeInputs;
    ulong nodeInputStrideInBytes;
}

struct MultiNodeGpuInput
{
    uint numNodeInputs;
    GpuVirtualAddressAndStride nodeInputs;
}

struct DispatchGraphDesc
{
    DispatchMode mode;
    union
    {
        NodeCpuInput nodeCPUInput;
        GpuVirtualAddress nodeGPUInput;
        MultiNodeCpuInput multiNodeCPUInput;
        GpuVirtualAddress multiNodeGPUInput;
    }
}

enum ShaderCacheMode : int
{
    MEMORY,
    DISK,
}

bitstruct ShaderCacheFlags : uint
{
    bool driverVersioned : 0;
    bool useWorkingDir   : 1;
    uint __unused0       : 2..31;
}

const ShaderCacheFlags SHADER_CACHE_FLAGS_NONE = {};

struct ShaderCacheSessionDesc
{
    Win32_GUID identifier;
    ShaderCacheMode mode;
    ShaderCacheFlags flags;
    uint maximumInMemoryCacheSizeBytes;
    uint maximumInMemoryCacheEntries;
    uint maximumValueFileSizeBytes;
    ulong version;
}

enum BarrierLayout : uint
{
    COMMON,
    GENERIC_READ,
    RENDER_TARGET,
    UNORDERED_ACCESS,
    DEPTH_STENCIL_WRITE,
    DEPTH_STENCIL_READ,
    SHADER_RESOURCE,
    COPY_SOURCE,
    COPY_DEST,
    RESOLVE_SOURCE,
    RESOLVE_DEST,
    SHADING_RATE_SOURCE,
    VIDEO_DECODE_READ,
    VIDEO_DECODE_WRITE,
    VIDEO_PROCESS_READ,
    VIDEO_PROCESS_WRITE,
    VIDEO_ENCODE_READ,
    VIDEO_ENCODE_WRITE,
    DIRECT_QUEUE_COMMON,
    DIRECT_QUEUE_GENERIC_READ,
    DIRECT_QUEUE_UNORDERED_ACCESS,
    DIRECT_QUEUE_SHADER_RESOURCE,
    DIRECT_QUEUE_COPY_SOURCE,
    DIRECT_QUEUE_COPY_DEST,
    COMPUTE_QUEUE_COMMON,
    COMPUTE_QUEUE_GENERIC_READ,
    COMPUTE_QUEUE_UNORDERED_ACCESS,
    COMPUTE_QUEUE_SHADER_RESOURCE,
    COMPUTE_QUEUE_COPY_SOURCE,
    COMPUTE_QUEUE_COPY_DEST,
    VIDEO_QUEUE_COMMON,
    UNDEFINED,
}

const BarrierLayout BARRIER_LAYOUT_PRESENT = BarrierLayout.COMMON;

bitstruct BarrierSync : uint
{
    bool none                                             : 0;
    bool all                                              : 1;
    bool draw                                             : 2;
    bool indexInput                                       : 3;
    bool vertexShading                                    : 4;
    bool pixelShading                                     : 5;
    bool depthStencil                                     : 6;
    bool renderTarget                                     : 7;
    bool computeShading                                   : 8;
    bool raytracing                                       : 9;
    bool copy                                             : 10;
    bool resolve                                          : 11;
    bool executeIndirect                                  : 12;
    bool allShading                                       : 13;
    bool nonPixelShading                                  : 14;
    bool emitRaytracingAccelerationStructurePostbuildInfo : 15;
    bool clearUnorderedAccessView                         : 16;
    uint __unused0                                        : 17..19;
    bool videoDecode                                      : 20;
    bool videoProcess                                     : 21;
    bool videoEncode                                      : 22;
    bool buildRaytracingAccelerationStructure             : 23;
    bool copyRaytracingAccelerationStructure              : 24;
    uint __unused1                                        : 25..30;
    bool split                                            : 31..31;
}

const BarrierSync BARRIER_SYNC_PREDICATION = { .executeIndirect };

bitstruct BarrierAccess : uint
{
    bool common                               : 0;
    bool vertexBuffer                         : 1;
    bool constantBuffer                       : 2;
    bool indexBuffer                          : 3;
    bool renderTarget                         : 4;
    bool unorderedAccess                      : 5;
    bool depthStencilWrite                    : 6;
    bool depthStencilRead                     : 7;
    bool shaderResource                       : 8;
    bool streamOutput                         : 9;
    bool indirectArgument                     : 10;
    bool copyDest                             : 11;
    bool copySource                           : 12;
    bool resolveDest                          : 13;
    bool resolveSource                        : 14;
    bool raytracingAccelerationStructureRead  : 15;
    bool raytracingAccelerationStructureWrite : 16;
    bool shadingRateSource                    : 17;
    bool videoDecodeRead                      : 18;
    bool videoDecodeWrite                     : 19;
    bool videoProcessRead                     : 20;
    bool videoProcessWrite                    : 21;
    bool videoEncodeRead                      : 22;
    bool videoEncodeWrite                     : 23;
    uint __unused0                            : 24..30;
    bool noAccess                             : 31..31;
}

const BarrierAccess BARRIER_ACCESS_PREDICATION = { .indirectArgument };

enum BarrierType : int
{
    GLOBAL,
    TEXTURE,
    BUFFER,
}

bitstruct TextureBarrierFlags : uint
{
    bool discard   : 0;
    uint __unused0 : 1..31;
}

struct BarrierSubresourceRange
{
    uint indexOrFirstMipLevel;
    uint numMipLevels;
    uint firstArraySlice;
    uint numArraySlices;
    uint firstPlane;
    uint numPlanes;
}

struct GlobalBarrier
{
    BarrierSync syncBefore;
    BarrierSync syncAfter;
    BarrierAccess accessBefore;
    BarrierAccess accessAfter;
}

struct TextureBarrier
{
    BarrierSync syncBefore;
    BarrierSync syncAfter;
    BarrierAccess accessBefore;
    BarrierAccess accessAfter;
    BarrierLayout layoutBefore;
    BarrierLayout layoutAfter;
    IResource* pResource;
    BarrierSubresourceRange subresources;
    TextureBarrierFlags flags;
}

struct BufferBarrier
{
    BarrierSync syncBefore;
    BarrierSync syncAfter;
    BarrierAccess accessBefore;
    BarrierAccess accessAfter;
    IResource* pResource;
    ulong offset;
    ulong size;
}

struct BarrierGroup
{
    BarrierType type;
    uint numBarriers;
    union
    {
        GlobalBarrier* pGlobalBarriers;
        TextureBarrier* pTextureBarriers;
        BufferBarrier* pBufferBarriers;
    }
}

// =============================================================================
// IShaderCacheSession
// =============================================================================

const ISHADER_CACHE_SESSION_UUID_STRING = "28e2495d-0f64-4ae4-a6ec-129255dc49a8";
const Win32_GUID ISHADER_CACHE_SESSION_UUID = {
    0x28e2495d, 0x0f64, 0x4ae4, { 0xa6, 0xec, 0x12, 0x92, 0x55, 0xdc, 0x49, 0xa8 } };

struct IShaderCacheSession
{
    IShaderCacheSessionVTable* vtbl;
}

alias IShaderCacheSession_FindValueFn = fn Win32_HRESULT (
    void* self,
    void* pKey,
    uint keySize,
    void* pValue,
    uint *pValueSize);

alias IShaderCacheSession_StoreValueFn = fn Win32_HRESULT (
    void* self,
    void* pKey,
    uint keySize,
    void* pValue,
    uint valueSize);

alias IShaderCacheSession_SetDeleteOnDestroyFn = fn void (void* self);

alias IShaderCacheSession_GetDescFn = fn ShaderCacheSessionDesc* (
    void* self,
    ShaderCacheSessionDesc* retVal);

struct IShaderCacheSessionVTable
{
    inline IDeviceChildVTable _base;
    IShaderCacheSession_FindValueFn findValue;
    IShaderCacheSession_StoreValueFn storeValue;
    IShaderCacheSession_SetDeleteOnDestroyFn setDeleteOnDestroy;
    IShaderCacheSession_GetDescFn getDesc;
}

// Functions of IUnknown

fn Win32_HRESULT IShaderCacheSession.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IShaderCacheSession.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IShaderCacheSession.release(&self) @inline => self.vtbl.release(self);

// Functions of IObject

fn Win32_HRESULT IShaderCacheSession.getPrivateData(
    &self,
    Win32_GUID* guid,
    uint* pDataSize,
    void* pData
) @inline =>
    self.vtbl.getPrivateData(self, guid, pDataSize, pData);

fn Win32_HRESULT IShaderCacheSession.setPrivateData(
    &self,
    Win32_GUID* guid,
    uint dataSize,
    void* pData
) @inline =>
    self.vtbl.setPrivateData(self, guid, dataSize, pData);

fn Win32_HRESULT IShaderCacheSession.setPrivateDataInterface(
    &self,
    Win32_GUID* guid,
    IUnknown* pData
) @inline =>
    self.vtbl.setPrivateDataInterface(self, guid, pData);

fn Win32_HRESULT IShaderCacheSession.setName(
    &self,
    Win32_LPCWSTR name
) @inline =>
    self.vtbl.setName(self, name);

// Functions of IDeviceChild

fn Win32_HRESULT IShaderCacheSession.getDevice(
    &self,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.getDevice(self, riid, ppvDevice);

// Functions of IShaderCacheSession

fn Win32_HRESULT IShaderCacheSession.findValue(
    &self,
    void* pKey,
    uint keySize,
    void* pValue,
    uint *pValueSize
) @inline =>
    self.vtbl.findValue(self, pKey, keySize, pValue, pValueSize);

fn Win32_HRESULT IShaderCacheSession.storeValue(
    &self,
    void* pKey,
    uint keySize,
    void* pValue,
    uint valueSize
) @inline =>
    self.vtbl.storeValue(self, pKey, keySize, pValue, valueSize);

fn void IShaderCacheSession.setDeleteOnDestroy(&self) @inline =>
    self.vtbl.setDeleteOnDestroy(self);

fn ShaderCacheSessionDesc* IShaderCacheSession.getDesc(
    &self,
    ShaderCacheSessionDesc* retVal
) @inline =>
    self.vtbl.getDesc(self, retVal);

// ---

bitstruct ShaderCacheKindFlags : uint
{
    bool implicitD3DCacheForDriver : 0;
    bool implicitD3DConversions    : 1;
    bool implicitDriverManaged     : 2;
    bool applicationManaged        : 3;
    uint __unused0                 : 4..31;
}

bitstruct ShaderCacheControlFlags : uint
{
    bool disable   : 0;
    bool enable    : 1;
    bool clear     : 2;
    uint __unused0 : 3..31;
}

// =============================================================================
// IVirtualizationGuestDevice
// =============================================================================

const IVIRTUALIZATION_GUEST_DEVICE_UUID_STRING = "bc66d368-7373-4943-8757-fc87dc79e476";
const Win32_GUID IVIRTUALIZATION_GUEST_DEVICE_UUID = {
    0xbc66d368, 0x7373, 0x4943, { 0x87, 0x57, 0xfc, 0x87, 0xdc, 0x79, 0xe4, 0x76 } };

struct IVirtualizationGuestDevice
{
    IVirtualizationGuestDeviceVTable* vtbl;
}

alias IVirtualizationGuestDevice_ShareWithHostFn = fn Win32_HRESULT (
    void* self,
    IDeviceChild* pObject,
    Win32_HANDLE* pHandle);

alias IVirtualizationGuestDevice_CreateFenceFdFn = fn Win32_HRESULT (
    void* self,
    IFence* pFence,
    ulong fenceValue,
    int* pFenceFd);

struct IVirtualizationGuestDeviceVTable
{
    inline IUnknownVTable _base;
    IVirtualizationGuestDevice_ShareWithHostFn shareWithHost;
    IVirtualizationGuestDevice_CreateFenceFdFn createFenceFd;
}

// Functions of IUnknown

fn Win32_HRESULT IVirtualizationGuestDevice.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IVirtualizationGuestDevice.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IVirtualizationGuestDevice.release(&self) @inline => self.vtbl.release(self);

// Functions of IUnknown IVirtualizationGuestDevice

fn Win32_HRESULT IVirtualizationGuestDevice.shareWithHost(
    &self,
    IDeviceChild* pObject,
    Win32_HANDLE* pHandle
) @inline =>
    self.vtbl.shareWithHost(self, pObject, pHandle);

fn Win32_HRESULT IVirtualizationGuestDevice.createFenceFd(
    &self,
    IFence* pFence,
    ulong fenceValue,
    int* pFenceFd
) @inline =>
    self.vtbl.createFenceFd(self, pFence, fenceValue, pFenceFd);

// =============================================================================
// ITools
// =============================================================================

const ITOOLS_UUID_STRING = "7071e1f0-e84b-4b33-974f-12fa49de65c5";
const Win32_GUID ITOOLS_UUID = {
    0x7071e1f0, 0xe84b, 0x4b33, { 0x97, 0x4f, 0x12, 0xfa, 0x49, 0xde, 0x65, 0xc5 } };

const ITOOLS1_UUID_STRING = "e4fbc019-dd3c-43e1-8f32-7f649575f0a0";
const Win32_GUID ITOOLS1_UUID = {
    0xe4fbc019, 0xdd3c, 0x43e1, { 0x8f, 0x32, 0x7f, 0x64, 0x95, 0x75, 0xf0, 0xa0 } };

struct ITools
{
    IToolsVTable* vtbl;
}

typedef ITools1 = inline ITools;

// Function poineters of ITools

alias ITools_EnableShaderInstrumentationFn = fn void (
    void* self,
    Bool bEnable);

alias ITools_ShaderInstrumentationEnabledFn = fn Bool (void* self);

// Function poineters of ITools1

alias ITools1_ReserveGPUVARangesAtCreateFn = fn Win32_HRESULT (
    void* self,
    GpuVirtualAddressRange* pRanges,
    uint uiNumRanges);

alias ITools1_ClearReservedGPUVARangesListFn = fn void (void* self);

struct IToolsVTable
{
    inline IUnknownVTable _base;

    // ITools
    ITools_EnableShaderInstrumentationFn enableShaderInstrumentation;
    ITools_ShaderInstrumentationEnabledFn shaderInstrumentationEnabled;

    // ITools1
    ITools1_ReserveGPUVARangesAtCreateFn reserveGPUVARangesAtCreate;
    ITools1_ClearReservedGPUVARangesListFn clearReservedGPUVARangesList;
}

// Functions of IUnknown

fn Win32_HRESULT ITools.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ITools.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ITools.release(&self) @inline => self.vtbl.release(self);

// Function poineters of ITools

fn void ITools.enableShaderInstrumentation(
    &self,
    Bool bEnable
) @inline =>
    self.vtbl.enableShaderInstrumentation(self, bEnable);

fn Bool ITools.shaderInstrumentationEnabled(&self) @inline =>
    self.vtbl.shaderInstrumentationEnabled(self);

// Function poineters of ITools1

fn Win32_HRESULT ITools.reserveGPUVARangesAtCreate(
    &self,
    GpuVirtualAddressRange* pRanges,
    uint uiNumRanges
) @inline =>
    self.vtbl.reserveGPUVARangesAtCreate(self, pRanges, uiNumRanges);

fn void ITools.clearReservedGPUVARangesList(&self) @inline =>
    self.vtbl.clearReservedGPUVARangesList(self);

// =============================================================================
// IPageableTools
// =============================================================================

const IPAGEABLE_TOOLS_UUID_STRING = "8f1359db-d8d1-42f9-b5cf-79f4cbad0d3d";
const Win32_GUID IPAGEABLE_TOOLS_UUID = {
    0x8f1359db, 0xd8d1, 0x42f9, { 0xb5, 0xcf, 0x79, 0xf4, 0xcb, 0xad, 0x0d, 0x3d } };


struct IPageableTools
{
    IPageableToolsVTable* vtbl;
}

alias IPageableTools_GetAllocationFn = fn Win32_HRESULT (
    void* self,
    GpuVirtualAddressRange* pAllocation);

struct IPageableToolsVTable
{
    inline IUnknownVTable _base;
    IPageableTools_GetAllocationFn getAllocation;
}

// Functions of IUnknown

fn Win32_HRESULT IPageableTools.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IPageableTools.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IPageableTools.release(&self) @inline => self.vtbl.release(self);

// Functions of IPageableTools

fn Win32_HRESULT IPageableTools.getAllocation(
    &self,
    GpuVirtualAddressRange* pAllocation
) @inline =>
    self.vtbl.getAllocation(self, pAllocation);

// =============================================================================
// IDeviceTools
// =============================================================================

const IDEVICE_TOOLS_UUID_STRING = "2ea68e9c-19c3-4e47-a109-6cdadff0aca9";
const Win32_GUID IDEVICE_TOOLS_UUID = {
    0x2ea68e9c, 0x19c3, 0x4e47, { 0xa1, 0x09, 0x6c, 0xda, 0xdf, 0xf0, 0xac, 0xa9 } };

struct IDeviceTools
{
    IDeviceToolsVTable* vtbl;
}

alias IDeviceTools_SetNextAllocationAddressFn = fn void (
    void* self,
    GpuVirtualAddress nextAllocationVirtualAddress);

struct IDeviceToolsVTable
{
    inline IUnknownVTable _base;
    IDeviceTools_SetNextAllocationAddressFn setNextAllocationAddress;
}

// Functions of IUnknown

fn Win32_HRESULT IDeviceTools.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDeviceTools.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDeviceTools.release(&self) @inline => self.vtbl.release(self);

// Functions of IDeviceTools

fn void IDeviceTools.setNextAllocationAddress(
    &self,
    GpuVirtualAddress nextAllocationVirtualAddress
) @inline =>
    self.vtbl.setNextAllocationAddress(self, nextAllocationVirtualAddress);

// --

struct SubresourceData
{
    void* pData;
    Win32_LONG_PTR rowPitch;
    Win32_LONG_PTR slicePitch;
}

struct MemcpyDest
{
    void* pData;
    Win32_SIZE_T rowPitch;
    Win32_SIZE_T slicePitch;
}

alias PFN_CreateDevice = fn Win32_HRESULT (IUnknown*, FeatureLevel, Win32_GUID*, void**);

extern fn Win32_HRESULT createDevice(
    IUnknown* pAdapter,
    FeatureLevel minimumFeatureLevel,
    Win32_GUID* riid,
    void** ppDevice
) @extern("D3D12CreateDevice");

alias PFN_GetDebugInterface = fn Win32_HRESULT(Win32_GUID*, void**);

extern fn Win32_HRESULT getDebugInterface(
    Win32_GUID* riid,
    void** ppvDebug
)  @extern("D3D12GetDebugInterface");

extern fn Win32_HRESULT enableExperimentalFeatures(
    uint numFeatures,
    Win32_GUID* pIIDs,
    void* pConfigurationStructs,
    uint* pConfigurationStructSizes
) @extern("D3D12EnableExperimentalFeatures");

const Win32_GUID EXPERIMENTAL_SHADER_MODELS = {
    0x76f5573e, 0xf13a, 0x40f5, { 0xb2, 0x97, 0x81, 0xce, 0x9e, 0x18, 0x93, 0x3f } };

const Win32_GUID TILED_RESOURCE_TIER4 = {
    0xc9c4725f, 0xa81a, 0x4f56, { 0x8c, 0x5b, 0xc5, 0x10, 0x39, 0xd6, 0x94, 0xfb } };

const Win32_GUID GPU_UPLOAD_HEAPS_ON_UNSUPPORTED_OS = {
    0x45dc51f3, 0x767f, 0x4588, { 0xb2, 0x06, 0x0b, 0xaa, 0x2b, 0x16, 0xfb, 0xae } };

const Win32_GUID CLSID_DEBUG = {
    0xf2352aeb, 0xdd84, 0x49fe, { 0xb9, 0x7b, 0xa9, 0xdc, 0xfd, 0xcc, 0x1b, 0x4f } };

const Win32_GUID CLSID_TOOLS = {
    0xe38216b1, 0x3c8c, 0x4833, { 0xaa, 0x09, 0x0a, 0x06, 0xb6, 0x5d, 0x96, 0xc8 } };

const Win32_GUID CLSID_DEVICE_REMOVED_EXTENDED_DATA = {
    0x4a75bbc4, 0x9ff4, 0x4ad8, { 0x9f, 0x18, 0xab, 0xae, 0x84, 0xdc, 0x5f, 0xf2 } };

const Win32_GUID CLSID_SDK_CONFIGURATION = {
    0x7cda6aca, 0xa03e, 0x49c8, { 0x94, 0x58, 0x03, 0x34, 0xd2, 0x0e, 0x07, 0xce } };

const Win32_GUID CLSID_DEVICE_FACTORY = {
    0x114863bf, 0xc386, 0x4aee, { 0xb3, 0x9d, 0x8f, 0x0b, 0xbb, 0x06, 0x29, 0x55 } };

const Win32_GUID CLSID_DSR_DEVICE_FACTORY = {
    0xbb6dd27e, 0x94a9, 0x41a6, { 0x9f, 0x1b, 0x13, 0x37, 0x72, 0x17, 0x24, 0x28 } };

alias PFN_GetInterface = fn Win32_HRESULT (Win32_GUID*, Win32_GUID*, void**);

extern fn Win32_HRESULT getInterface(
    Win32_GUID* rclsid,
    Win32_GUID* riid,
    void** ppvDebug
) @extern("D3D12GetInterface");

// =============================================================================
// ISDKConfiguration
// =============================================================================

const ISDK_CONFIGURATION_UUID_STRING = "e9eb5314-33aa-42b2-a718-d77f58b1f1c7";
const Win32_GUID ISDK_CONFIGURATION_UUID = {
    0xe9eb5314, 0x33aa, 0x42b2, { 0xa7, 0x18, 0xd7, 0x7f, 0x58, 0xb1, 0xf1, 0xc7 } };

const ISDK_CONFIGURATION1_UUID_STRING = "8aaf9303-ad25-48b9-9a57-d9c37e009d9f";
const Win32_GUID ISDK_CONFIGURATION1_UUID = {
    0x8aaf9303, 0xad25, 0x48b9, { 0x9a, 0x57, 0xd9, 0xc3, 0x7e, 0x00, 0x9d, 0x9f } };

struct ISDKConfiguration
{
    ISDKConfigurationVTable* vtbl;
}

typedef ISDKConfiguration1 = inline ISDKConfiguration;

// Function pointers of ISDKConfiguration

alias ISDKConfiguration_SetSDKVersionFn = fn Win32_HRESULT (
    void* self,
    uint sdkVersion,
    ZString sdkPath);

// Function pointers of ISDKConfiguration1

alias ISDKConfiguration1_CreateDeviceFactoryFn = fn Win32_HRESULT (
    void* self,
    uint sdkVersion,
    ZString sdkPath,
    Win32_GUID* riid,
    void** ppvFactory);

alias ISDKConfiguration1_FreeUnusedSDKsFn = fn void (void* self);

struct ISDKConfigurationVTable
{
    inline IUnknownVTable _base;

    // ISDKConfiguration
    ISDKConfiguration_SetSDKVersionFn setSDKVersion;

    // ISDKConfiguration1
    ISDKConfiguration1_CreateDeviceFactoryFn createDeviceFactory;
    ISDKConfiguration1_FreeUnusedSDKsFn freeUnusedSDKs;
}

// Functions of IUnknown

fn Win32_HRESULT ISDKConfiguration.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ISDKConfiguration.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ISDKConfiguration.release(&self) @inline => self.vtbl.release(self);

// Function of ISDKConfiguration

fn Win32_HRESULT ISDKConfiguration.setSDKVersion(
    &self,
    uint sdkVersion,
    ZString sdkPath
) @inline =>
    self.vtbl.setSDKVersion(self, sdkVersion, sdkPath);

// Function of ISDKConfiguration1

fn Win32_HRESULT ISDKConfiguration.createDeviceFactory(
    &self,
    uint sdkVersion,
    ZString sdkPath,
    Win32_GUID* riid,
    void** ppvFactory
) @inline =>
    self.vtbl.createDeviceFactory(self, sdkVersion, sdkPath, riid, ppvFactory);

fn void ISDKConfiguration.freeUnusedSDKs(&self) @inline =>
    self.vtbl.freeUnusedSDKs(self);

// ---

bitstruct DeviceFactoryFlags : uint
{
    bool allowReturningExistingDevice             : 0;
    bool allowReturningIncompatibleExistingDevice : 1;
    bool disallowStoringNewDeviceAsSingleton      : 2;
    uint __unused0                                : 3..31;
}

const DeviceFactoryFlags DEVICE_FACTORY_FLAGS_NONE = {};

// =============================================================================
// IDeviceFactory
// =============================================================================

const IDEVICE_FACTORY_UUID_STRING = "61f307d3-d34e-4e7c-8374-3ba4de23cccb";
const Win32_GUID IDEVICE_FACTORY_UUID = {
    0x61f307d3, 0xd34e, 0x4e7c, { 0x83, 0x74, 0x3b, 0xa4, 0xde, 0x23, 0xcc, 0xcb } };

struct IDeviceFactory
{
    IDeviceFactoryVTable* vtbl;
}

alias IDeviceFactory_InitializeFromGlobalStateFn = fn Win32_HRESULT (void* self);

alias IDeviceFactory_ApplyToGlobalStateFn = fn Win32_HRESULT (void* self);

alias IDeviceFactory_SetFlagsFn = fn Win32_HRESULT (
    void* self,
    DeviceFactoryFlags flags);

alias IDeviceFactory_GetFlagsFn = fn DeviceFactoryFlags (void* self);

alias IDeviceFactory_GetConfigurationInterfaceFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* clsid,
    Win32_GUID* iid,
    void** ppv);

alias IDeviceFactory_EnableExperimentalFeaturesFn = fn Win32_HRESULT (
    void* self,
    uint numFeatures,
    Win32_GUID* pIIDs,
    void* pConfigurationStructs,
    uint* pConfigurationStructSizes);

alias IDeviceFactory_CreateDeviceFn = fn Win32_HRESULT (
    void* self,
    IUnknown* adapter,
    FeatureLevel featureLevel,
    Win32_GUID* riid,
    void** ppvDevice);

struct IDeviceFactoryVTable
{
    inline IUnknownVTable _base;
    IDeviceFactory_InitializeFromGlobalStateFn initializeFromGlobalState;
    IDeviceFactory_ApplyToGlobalStateFn applyToGlobalState;
    IDeviceFactory_SetFlagsFn setFlags;
    IDeviceFactory_GetFlagsFn getFlags;
    IDeviceFactory_GetConfigurationInterfaceFn getConfigurationInterface;
    IDeviceFactory_EnableExperimentalFeaturesFn enableExperimentalFeatures;
    IDeviceFactory_CreateDeviceFn createDevice;
}

// Functions of IUnknown

fn Win32_HRESULT IDeviceFactory.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDeviceFactory.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDeviceFactory.release(&self) @inline => self.vtbl.release(self);

// Functions of IDeviceFactory

fn Win32_HRESULT IDeviceFactory.initializeFromGlobalState(&self) @inline =>
    self.vtbl.initializeFromGlobalState(self);

fn Win32_HRESULT IDeviceFactory.applyToGlobalState(&self) @inline =>
    self.vtbl.applyToGlobalState(self);

fn Win32_HRESULT IDeviceFactory.setFlags(
    &self,
    DeviceFactoryFlags flags
) @inline =>
    self.vtbl.setFlags(self, flags);

fn DeviceFactoryFlags IDeviceFactory.getFlags(&self) @inline =>
    self.vtbl.getFlags(self);

fn Win32_HRESULT IDeviceFactory.getConfigurationInterface(
    &self,
    Win32_GUID* clsid,
    Win32_GUID* iid,
    void** ppv
) @inline =>
    self.vtbl.getConfigurationInterface(self, clsid, iid, ppv);

fn Win32_HRESULT IDeviceFactory.enableExperimentalFeatures(
    &self,
    uint numFeatures,
    Win32_GUID* pIIDs,
    void* pConfigurationStructs,
    uint* pConfigurationStructSizes
) @inline =>
    self.vtbl.enableExperimentalFeatures(
        self,
        numFeatures,
        pIIDs,
        pConfigurationStructs,
        pConfigurationStructSizes);

fn Win32_HRESULT IDeviceFactory.createDevice(
    &self,
    IUnknown* adapter,
    FeatureLevel featureLevel,
    Win32_GUID* riid,
    void** ppvDevice
) @inline =>
    self.vtbl.createDevice(self, adapter, featureLevel, riid, ppvDevice);

// ---

bitstruct DeviceFlags : uint
{
    bool debugLayerEnabled                          : 0;
    bool gpuBasedValidationEnabled                  : 1;
    bool synchronizedCommandQueueValidationDisabled : 2;
    bool dredAutoBreadcrumbsEnabled                 : 3;
    bool dredPageFaultReportingEnabled              : 4;
    bool dredWatsonReportingEnabled                 : 5;
    bool dredBreadcrumbContextEnabled               : 6;
    bool dredUseMarkersOnlyBreadcrumbs              : 7;
    bool shaderInstrumentationEnabled               : 8;
    bool autoDebugNameEnabled                       : 9;
    bool forceLegacyStateValidation                 : 10;
    uint __unused0                                  : 11..31;
}

const DeviceFlags DEVICE_FLAGS_NONE = {};

struct DeviceConfigurationDesc
{
    DeviceFlags flags;
    uint gpuBasedValidationFlags;
    uint sdkVersion;
    uint numEnabledExperimentalFeatures;
}

// =============================================================================
// IDeviceConfiguration
// =============================================================================

const IDEVICE_CONFIGURATION_UUID_STRING = "78dbf87b-f766-422b-a61c-c8c446bdb9ad";
const Win32_GUID IDEVICE_CONFIGURATION_UUID = {
    0x78dbf87b, 0xf766, 0x422b, { 0xa6, 0x1c, 0xc8, 0xc4, 0x46, 0xbd, 0xb9, 0xad } };

const IDEVICE_CONFIGURATION1_UUID_STRING = "ed342442-6343-4e16-bb82-a3a577874e56";
const Win32_GUID IDEVICE_CONFIGURATION1_UUID = {
    0xed342442, 0x6343, 0x4e16, { 0xbb, 0x82, 0xa3, 0xa5, 0x77, 0x87, 0x4e, 0x56 } };

struct IDeviceConfiguration
{
    IDeviceConfigurationVTable* vtbl;
}

typedef IDeviceConfiguration1 = inline IDeviceConfiguration;

// Functions pointers of IUnknown IDeviceConfiguration

alias IDeviceConfiguration_GetDescFn = fn DeviceConfigurationDesc* (
    void* self,
    DeviceConfigurationDesc* retVal);

alias IDeviceConfiguration_GetEnabledExperimentalFeaturesFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID* pGuids,
    uint numGuids);

alias IDeviceConfiguration_SerializeVersionedRootSignatureFn = fn Win32_HRESULT (
    void* self,
    VersionedRootSignatureDesc* pDesc,
    IBlob** ppResult,
    IBlob** ppError);

alias IDeviceConfiguration_CreateVersionedRootSignatureDeserializerFn = fn Win32_HRESULT (
    void* self,
    void* pBlob,
    Win32_SIZE_T size,
    Win32_GUID* riid,
    void** ppvDeserializer);

// Functions pointers of IUnknown IDeviceConfiguration1

alias IDeviceConfiguration1_CreateVersionedRootSignatureDeserializerFromSubobjectInLibraryFn =
    fn Win32_HRESULT (
        void* self,
        void* pLibraryBlob,
        Win32_SIZE_T size,
        Win32_LPCWSTR rootSignatureSubobjectName,
        Win32_GUID* riid,
        void** ppvDeserializer);

struct IDeviceConfigurationVTable
{
    inline IUnknownVTable _base;

    // IDeviceConfiguration
    IDeviceConfiguration_GetDescFn getDesc;
    IDeviceConfiguration_GetEnabledExperimentalFeaturesFn  getEnabledExperimentalFeatures;
    IDeviceConfiguration_SerializeVersionedRootSignatureFn  serializeVersionedRootSignature;
    IDeviceConfiguration_CreateVersionedRootSignatureDeserializerFn
        createVersionedRootSignatureDeserializer;

    // IDeviceConfiguration1
    IDeviceConfiguration1_CreateVersionedRootSignatureDeserializerFromSubobjectInLibraryFn
        createVersionedRootSignatureDeserializerFromSubobjectInLibrary;
}

// Functions of IUnknown

fn Win32_HRESULT IDeviceConfiguration.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDeviceConfiguration.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDeviceConfiguration.release(&self) @inline => self.vtbl.release(self);

// Functions pointers of IUnknown IDeviceConfiguration

fn DeviceConfigurationDesc* IDeviceConfiguration.getDesc(
    &self,
    DeviceConfigurationDesc* retVal
) @inline =>
    self.vtbl.getDesc(self, retVal);

fn Win32_HRESULT IDeviceConfiguration.getEnabledExperimentalFeatures(
    &self,
    Win32_GUID* pGuids,
    uint numGuids
) @inline =>
    self.vtbl.getEnabledExperimentalFeatures(self, pGuids, numGuids);

fn Win32_HRESULT IDeviceConfiguration.serializeVersionedRootSignature(
    &self,
    VersionedRootSignatureDesc* pDesc,
    IBlob** ppResult,
    IBlob** ppError
) @inline =>
    self.vtbl.serializeVersionedRootSignature(self, pDesc, ppResult, ppError);

fn Win32_HRESULT IDeviceConfiguration.createVersionedRootSignatureDeserializer(
    &self,
    void* pBlob,
    Win32_SIZE_T size,
    Win32_GUID* riid,
    void** ppvDeserializer
) @inline =>
    self.vtbl.createVersionedRootSignatureDeserializer(self, pBlob, size, riid, ppvDeserializer);

// Functions pointers of IUnknown IDeviceConfiguration1

fn Win32_HRESULT
IDeviceConfiguration.createVersionedRootSignatureDeserializerFromSubobjectInLibrary(
    &self,
    void* pLibraryBlob,
    Win32_SIZE_T size,
    Win32_LPCWSTR rootSignatureSubobjectName,
    Win32_GUID* riid,
    void** ppvDeserializer
) @inline =>
    self.vtbl.createVersionedRootSignatureDeserializerFromSubobjectInLibrary(
        self,
        pLibraryBlob,
        size,
        rootSignatureSubobjectName,
        riid,
        ppvDeserializer);

// ---

enum AxisShadingRate
{
    RATE_1X,
    RATE_2X,
    RATE_4X,
}

const SHADING_RATE_X_AXIS_SHIFT = 2;
const SHADING_RATE_VALID_MASK = 3;
macro makeCoarseShadingRate($x, $y) => (($x) << SHADING_RATE_X_AXIS_SHIFT | ($y));
macro getCoarseShadingRateXAxis($x) =>
    ((($x) >> SHADING_RATE_X_AXIS_SHIFT) & SHADING_RATE_VALID_MASK);
macro getCoarseShadingRateYAxis($y) => (($y) & SHADING_RATE_VALID_MASK);

enum ShadingRate : int
{
    RATE_1X1,
    RATE_1X2,
    __UNUSED0,
    __UNUSED1,
    RATE_2X1,
    RATE_2X2,
    RATE_2X4,
    __UNUSED2,
    __UNUSED3,
    RATE_4X2,
    RATE_4X4,
}

enum ShadingRateCombiner : int
{
    PASSTHROUGH,
    OVERRIDE,
    MIN,
    MAX,
    SUM,
}

struct DispatchMeshArguments
{
    uint threadGroupCountX;
    uint threadGroupCountY;
    uint threadGroupCountZ;
}

// =============================================================================
// IDSRDeviceFactory
// =============================================================================

const ISR_DEVICE_FACTORY_UUID_STRING = "f343d1a0-afe3-439f-b13d-cd87a43b70ca";
const Win32_GUID ISR_DEVICE_FACTORY_UUID = {
    0xf343d1a0, 0xafe3, 0x439f, { 0xb1, 0x3d, 0xcd, 0x87, 0xa4, 0x3b, 0x70, 0xca } };

struct IDSRDeviceFactory
{
    IDSRDeviceFactoryVTable* vtbl;
}

// Function pointers of IDSRDeviceFactory

alias IDSRDeviceFactory_CreateDSRDeviceFn = fn Win32_HRESULT (
    void* self,
    IDevice* pD3D12Device,
    uint nodeMask,
    Win32_GUID* riid,
    void** ppvDSRDevice);

struct IDSRDeviceFactoryVTable
{
    inline IUnknownVTable _base;
    IDSRDeviceFactory_CreateDSRDeviceFn createDSRDevice;
}

// Functions of IUnknown

fn Win32_HRESULT IDSRDeviceFactory.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDSRDeviceFactory.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDSRDeviceFactory.release(&self) @inline => self.vtbl.release(self);

// Functions of IDSRDeviceFactory

fn Win32_HRESULT IDSRDeviceFactory.createDSRDevice(
    &self,
    IDevice* pD3D12Device,
    uint nodeMask,
    Win32_GUID* riid,
    void** ppvDSRDevice
) @inline =>
    self.vtbl.createDSRDevice(self, pD3D12Device, nodeMask, riid, ppvDSRDevice);

// =============================================================================
// IGBVDiagnostics
// =============================================================================

const IGBV_DIAGNOSTICS_UUID_STRING = "597985ab-9b75-4dbb-be23-0761195bebee";
const Win32_GUID IGBV_DIAGNOSTICS_UUID = {
    0x597985ab, 0x9b75, 0x4dbb, { 0xbe, 0x23, 0x07, 0x61, 0x19, 0x5b, 0xeb, 0xee } };

struct IGBVDiagnostics
{
    IGBVDiagnosticsVTable* vtbl;
}

alias IGBVDiagnostics_GetGBVEntireSubresourceStatesDataFn = fn Win32_HRESULT (
    void* self,
    IResource* pResource,
    int* pData,
    uint dataSize);

alias IGBVDiagnostics_GetGBVSubresourceStateFn = fn Win32_HRESULT (
    void* self,
    IResource* pResource,
    uint subresource,
    int* pData);

alias IGBVDiagnostics_GetGBVResourceUniformStateFn = fn Win32_HRESULT (
    void* self,
    IResource* pResource,
    int* pData);

alias IGBVDiagnostics_GetGBVResourceInfoFn = fn Win32_HRESULT (
    void* self,
    IResource* pResource,
    ResourceDesc* pResourceDesc,
    uint* pResourceHash,
    uint* pSubresourceStatesByteOffset);

alias IGBVDiagnostics_GBVReserved0Fn = fn void (void* self);

alias IGBVDiagnostics_GBVReserved1Fn = fn void (void* self);

struct IGBVDiagnosticsVTable
{
    inline IUnknownVTable _base;
    IGBVDiagnostics_GetGBVEntireSubresourceStatesDataFn getGBVEntireSubresourceStatesData;
    IGBVDiagnostics_GetGBVSubresourceStateFn getGBVSubresourceState;
    IGBVDiagnostics_GetGBVResourceUniformStateFn getGBVResourceUniformState;
    IGBVDiagnostics_GetGBVResourceInfoFn getGBVResourceInfo;
    IGBVDiagnostics_GBVReserved0Fn gBVReserved0;
    IGBVDiagnostics_GBVReserved1Fn gBVReserved1;
}

// Functions of IUnknown

fn Win32_HRESULT IGBVDiagnostics.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IGBVDiagnostics.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IGBVDiagnostics.release(&self) @inline => self.vtbl.release(self);

// Functions of IGBVDiagnostics

fn Win32_HRESULT IGBVDiagnostics.getGBVEntireSubresourceStatesData(
    &self,
    IResource* pResource,
    int* pData,
    uint dataSize
) @inline =>
    self.vtbl.getGBVEntireSubresourceStatesData(self, pResource, pData, dataSize);

fn Win32_HRESULT IGBVDiagnostics.getGBVSubresourceState(
    &self,
    IResource* pResource,
    uint subresource,
    int* pData
) @inline =>
    self.vtbl.getGBVSubresourceState(self, pResource, subresource, pData);

fn Win32_HRESULT IGBVDiagnostics.getGBVResourceUniformState(
    &self,
    IResource* pResource,
    int* pData
) @inline =>
    self.vtbl.getGBVResourceUniformState(self, pResource, pData);

fn Win32_HRESULT IGBVDiagnostics.getGBVResourceInfo(
    &self,
    IResource* pResource,
    ResourceDesc* pResourceDesc,
    uint* pResourceHash,
    uint* pSubresourceStatesByteOffset
) @inline =>
    self.vtbl.getGBVResourceInfo(
        self,
        pResource,
        pResourceDesc,
        pResourceHash,
        pSubresourceStatesByteOffset);

fn void IGBVDiagnostics.gBVReserved0(&self) @inline =>
    self.vtbl.gBVReserved0(self);

fn void IGBVDiagnostics.gBVReserved1(&self) @inline =>
    self.vtbl.gBVReserved1(self);
