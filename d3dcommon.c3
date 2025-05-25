module directx::d3d12;

import std::os::win32;
import std::io;
import directx::dxgi;

enum DriverType : int
{
    UNKNOWN,
    HARDWARE,
    REFERENCE,
    NULL,
    SOFTWARE,
    WARP,
}

typedef FeatureLevel = int;
const FeatureLevel FEATURE_LEVEL_1_0_GENERIC = 0x100;
const FeatureLevel FEATURE_LEVEL_1_0_CORE    = 0x1000;
const FeatureLevel FEATURE_LEVEL_9_1         = 0x9100;
const FeatureLevel FEATURE_LEVEL_9_2         = 0x9200;
const FeatureLevel FEATURE_LEVEL_9_3         = 0x9300;
const FeatureLevel FEATURE_LEVEL_10_0        = 0xa000;
const FeatureLevel FEATURE_LEVEL_10_1        = 0xa100;
const FeatureLevel FEATURE_LEVEL_11_0        = 0xb000;
const FeatureLevel FEATURE_LEVEL_11_1        = 0xb100;
const FeatureLevel FEATURE_LEVEL_12_0        = 0xc000;
const FeatureLevel FEATURE_LEVEL_12_1        = 0xc100;
const FeatureLevel FEATURE_LEVEL_12_2        = 0xc200;

enum PrimitiveTopology : int
{
    UNDEFINED,
    POINTLIST,
    LINELIST,
    LINESTRIP,
    TRIANGLELIST,
    TRIANGLESTRIP,
    TRIANGLEFAN,
    __UNUSED0,
    __UNUSED1,
    __UNUSED2,
    LINELIST_ADJ,
    LINESTRIP_ADJ,
    TRIANGLELIST_ADJ,
    TRIANGLESTRIP_ADJ,
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
    __UNUSED19,
    __UNUSED20,
    __UNUSED21,
    PATCHLIST_1_CONTROL_POINT,
    PATCHLIST_2_CONTROL_POINT,
    PATCHLIST_3_CONTROL_POINT,
    PATCHLIST_4_CONTROL_POINT,
    PATCHLIST_5_CONTROL_POINT,
    PATCHLIST_6_CONTROL_POINT,
    PATCHLIST_7_CONTROL_POINT,
    PATCHLIST_8_CONTROL_POINT,
    PATCHLIST_9_CONTROL_POINT,
    PATCHLIST_10_CONTROL_POINT,
    PATCHLIST_11_CONTROL_POINT,
    PATCHLIST_12_CONTROL_POINT,
    PATCHLIST_13_CONTROL_POINT,
    PATCHLIST_14_CONTROL_POINT,
    PATCHLIST_15_CONTROL_POINT,
    PATCHLIST_16_CONTROL_POINT,
    PATCHLIST_17_CONTROL_POINT,
    PATCHLIST_18_CONTROL_POINT,
    PATCHLIST_19_CONTROL_POINT,
    PATCHLIST_20_CONTROL_POINT,
    PATCHLIST_21_CONTROL_POINT,
    PATCHLIST_22_CONTROL_POINT,
    PATCHLIST_23_CONTROL_POINT,
    PATCHLIST_24_CONTROL_POINT,
    PATCHLIST_25_CONTROL_POINT,
    PATCHLIST_26_CONTROL_POINT,
    PATCHLIST_27_CONTROL_POINT,
    PATCHLIST_28_CONTROL_POINT,
    PATCHLIST_29_CONTROL_POINT,
    PATCHLIST_30_CONTROL_POINT,
    PATCHLIST_31_CONTROL_POINT,
    PATCHLIST_32_CONTROL_POINT
}

enum Primitive : int
{
    UNDEFINED,
    POINT,
    LINE,
    TRIANGLE,
    __UNUSED0,
    __UNUSED1,
    LINE_ADJ,
    TRIANGLE_ADJ,
    POINT_PATCH_1_CONTROL,
    POINT_PATCH_2_CONTROL,
    POINT_PATCH_3_CONTROL,
    POINT_PATCH_4_CONTROL,
    POINT_PATCH_5_CONTROL,
    POINT_PATCH_6_CONTROL,
    POINT_PATCH_7_CONTROL,
    POINT_PATCH_8_CONTROL,
    POINT_PATCH_9_CONTROL,
    POINT_PATCH_10_CONTROL,
    POINT_PATCH_11_CONTROL,
    POINT_PATCH_12_CONTROL,
    POINT_PATCH_13_CONTROL,
    POINT_PATCH_14_CONTROL,
    POINT_PATCH_15_CONTROL,
    POINT_PATCH_16_CONTROL,
    POINT_PATCH_17_CONTROL,
    POINT_PATCH_18_CONTROL,
    POINT_PATCH_19_CONTROL,
    POINT_PATCH_20_CONTROL,
    POINT_PATCH_21_CONTROL,
    POINT_PATCH_22_CONTROL,
    POINT_PATCH_23_CONTROL,
    POINT_PATCH_24_CONTROL,
    POINT_PATCH_25_CONTROL,
    POINT_PATCH_26_CONTROL,
    POINT_PATCH_27_CONTROL,
    POINT_PATCH_28_CONTROL,
    POINT_PATCH_29_CONTROL,
    POINT_PATCH_30_CONTROL,
    POINT_PATCH_31_CONTROL,
    POINT_PATCH_32_CONTROL,
}

enum SrvDimension : int
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
    TEXTURECUBE,
    TEXTURECUBEARRAY,
    BUFFEREX,
}

const SrvDimension SRV_DIMENSION_RAYTRACING_ACCELERATION_STRUCTURE = SrvDimension.from_ordinal(11);

struct ShaderMacro
{
    ZString name;
    ZString definition;
}

typedef LPShaderMacro = ShaderMacro*;

// =============================================================================
// IBlob
// =============================================================================

const IBLOB_UUID_STRING = "8BA5FB08-5195-40e2-AC58-0D989C3A0102";
const Win32_GUID IBLOB_UUID = {
    0x8ba5fb08, 0x5195, 0x40e2, { 0xac, 0x58, 0xd, 0x98, 0x9c, 0x3a, 0x1, 0x2 } };

struct IBlob
{
    IBlobVTable* vtbl;
}

alias LPBlob = IBlob*;

alias IBlob_GetBufferPointerFn = fn Win32_LPVOID (void* self);
alias IBlob_GetBufferSizeFn = fn Win32_SIZE_T (void* self);

struct IBlobVTable
{
    inline IUnknownVTable _base;
    IBlob_GetBufferPointerFn getBufferPointer;
    IBlob_GetBufferSizeFn getBufferSize;
}

// Functions of IUnknown

fn Win32_HRESULT IBlob.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IBlob.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IBlob.release(&self) @inline => self.vtbl.release(self);

// Functions of IBlob

fn Win32_LPVOID IBlob.getBufferPointer(&self) @inline =>
    self.vtbl.getBufferPointer(self);

fn Win32_SIZE_T IBlob.getBufferSize(&self) @inline =>
    self.vtbl.getBufferSize(self);

// ---

alias PFN_DestructionCallback = fn void (void *pData);

// =============================================================================
// IDestructionNotifier
// =============================================================================

const IDESTRUCTION_NOTIFIER_UUID_STRING = "a06eb39a-50da-425b-8c31-4eecd6c270f3";

struct IDestructionNotifier
{
    IDestructionNotifierVTable* vtbl;
}

alias IDestructionNotifier_RegisterDestructionCallbackFn = fn Win32_HRESULT (
    void* self,
    PFN_DestructionCallback callbackFn,
    void* pData,
    uint* pCallbackID);

alias IDestructionNotifier_UnregisterDestructionCallbackFn = fn Win32_HRESULT (
    void* self,
    uint callbackID);

struct IDestructionNotifierVTable
{
    inline IUnknownVTable _base;
    IDestructionNotifier_RegisterDestructionCallbackFn registerDestructionCallback;
    IDestructionNotifier_UnregisterDestructionCallbackFn unregisterDestructionCallback;
}

// Functions of IUnknown

fn Win32_HRESULT IDestructionNotifier.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDestructionNotifier.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDestructionNotifier.release(&self) @inline => self.vtbl.release(self);

// Functions of IDestructionNotifier

fn Win32_HRESULT IDestructionNotifier.registerDestructionCallback(
    &self,
    PFN_DestructionCallback callbackFn,
    void* pData,
    uint* pCallbackID
) @inline =>
    self.vtbl.registerDestructionCallback(
        self,
        callbackFn,
        pData,
        pCallbackID);

fn Win32_HRESULT IDestructionNotifier.unregisterDestructionCallback(
    &self,
    uint callbackID
) @inline =>
    self.vtbl.unregisterDestructionCallback(self, callbackID);

// ---

enum IncludeType : int
{
    INCLUDE_LOCAL,
    INCLUDE_SYSTEM,
}

// =============================================================================
// ID3DInclude
// =============================================================================

struct ID3DInclude
{
    ID3DIncludeVTable* vtbl;
}

alias LPD3DInclude = ID3DInclude*;

alias ID3DInclude_OpenFn = fn Win32_HRESULT (
    void* self,
    IncludeType includeType,
    ZString pFileName,
    Win32_LPCVOID pParentData,
    Win32_LPCVOID* ppData,
    uint* pBytes);

alias ID3DInclude_CloseFn = fn Win32_HRESULT (
    void* self,
    Win32_LPCVOID pData);

struct ID3DIncludeVTable
{
    ID3DInclude_OpenFn open;
    ID3DInclude_CloseFn close;
}

fn Win32_HRESULT ID3DInclude.open(
    &self,
    IncludeType includeType,
    ZString pFileName,
    Win32_LPCVOID pParentData,
    Win32_LPCVOID* ppData,
    uint* pBytes
) @inline =>
    self.vtbl.open(
        self,
        includeType,
        pFileName,
        pParentData,
        ppData,
        pBytes);

fn Win32_HRESULT ID3DInclude.close(
    &self, Win32_LPCVOID pData
) @inline =>
    self.vtbl.close(self, pData);

// ---

enum ShaderVariableClass : int
{
    SCALAR,
    VECTOR,
    MATRIX_ROWS,
    MATRIX_COLUMNS,
    OBJECT,
    STRUCT,
    INTERFACE_CLASS,
    INTERFACE_POINTER,
}

bitstruct ShaderVariableFlags : uint
{
    bool userpacked         : 0;
    bool used               : 1;
    bool interfacePointer   : 2;
    bool interfaceParameter : 3;
    uint __unused0          : 4..31;
}

enum ShaderVariableType : int
{
    VOID,
    BOOL,
    INT,
    FLOAT,
    STRING,
    TEXTURE,
    TEXTURE1D,
    TEXTURE2D,
    TEXTURE3D,
    TEXTURECUBE,
    SAMPLER,
    SAMPLER1D,
    SAMPLER2D,
    SAMPLER3D,
    SAMPLERCUBE,
    PIXELSHADER,
    VERTEXSHADER,
    PIXELFRAGMENT,
    VERTEXFRAGMENT,
    UINT,
    UINT8,
    GEOMETRYSHADER,
    RASTERIZER,
    DEPTHSTENCIL,
    BLEND,
    BUFFER,
    CBUFFER,
    TBUFFER,
    TEXTURE1DARRAY,
    TEXTURE2DARRAY,
    RENDERTARGETVIEW,
    DEPTHSTENCILVIEW,
    TEXTURE2DMS,
    TEXTURE2DMSARRAY,
    TEXTURECUBEARRAY,
    HULLSHADER,
    DOMAINSHADER,
    INTERFACE_POINTER,
    COMPUTESHADER,
    DOUBLE,
    RWTEXTURE1D,
    RWTEXTURE1DARRAY,
    RWTEXTURE2D,
    RWTEXTURE2DARRAY,
    RWTEXTURE3D,
    RWBUFFER,
    BYTEADDRESS_BUFFER,
    RWBYTEADDRESS_BUFFER,
    STRUCTURED_BUFFER,
    RWSTRUCTURED_BUFFER,
    APPEND_STRUCTURED_BUFFER,
    CONSUME_STRUCTURED_BUFFER,
    MIN8FLOAT,
    MIN10FLOAT,
    MIN16FLOAT,
    MIN12INT,
    MIN16INT,
    MIN16UINT,
    INT16,
    UINT16,
    FLOAT16,
    INT64,
    UINT64,
}

bitstruct ShaderInputFlags : uint
{
    bool userpacked         : 0;
    bool comparisonSampler  : 1;
    bool textureComponent_0 : 2;
    bool textureComponent_1 : 3;
    bool unused             : 4;
    uint __unused0          : 5..31;
}

const ShaderInputFlags SHADER_INPUT_FLAGS_TEXTURE_COMPONENTS =
    { .textureComponent_0, . textureComponent_1 };

enum ShaderInputType : int
{
    CBUFFER,
    TBUFFER,
    TEXTURE,
    SAMPLER,
    UAV_RWTYPED,
    STRUCTURED,
    UAV_RWSTRUCTURED,
    BYTEADDRESS,
    UAV_RWBYTEADDRESS,
    UAV_APPEND_STRUCTURED,
    UAV_CONSUME_STRUCTURED,
    UAV_RWSTRUCTURED_WITH_COUNTER,
    RTACCELERATIONSTRUCTURE,
    UAV_FEEDBACKTEXTURE,
}

bitstruct ShaderCBufferFlags : uint
{
    bool userpacked : 0;
    uint __unused0  : 1..31;
}

const ShaderCBufferFlags SHADER_CBUFFER_FLAGS_D3D10_USERPACKED = { .userpacked };

enum CBufferType : int
{
    CBUFFER,
    TBUFFER,
    INTERFACE_POINTERS,
    RESOURCE_BIND_INFO,
}

enum Name : int
{
    UNDEFINED,
    POSITION,
    CLIP_DISTANCE,
    CULL_DISTANCE,
    RENDER_TARGET_ARRAY_INDEX,
    VIEWPORT_ARRAY_INDEX,
    VERTEX_ID,
    PRIMITIVE_ID,
    INSTANCE_ID,
    IS_FRONT_FACE,
    SAMPLE_INDEX,
    FINAL_QUAD_EDGE_TESSFACTOR,
    FINAL_QUAD_INSIDE_TESSFACTOR,
    FINAL_TRI_EDGE_TESSFACTOR,
    FINAL_TRI_INSIDE_TESSFACTOR,
    FINAL_LINE_DETAIL_TESSFACTOR,
    FINAL_LINE_DENSITY_TESSFACTOR,
    __UNUSED0,
    __UNUSED1,
    __UNUSED2,
    __UNUSED3,
    __UNUSED4,
    __UNUSED5,
    BARYCENTRICS,
    SHADINGRATE,
    CULLPRIMITIVE,
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
    __UNUSED19,
    __UNUSED20,
    __UNUSED21,
    __UNUSED22,
    __UNUSED23,
    __UNUSED24,
    __UNUSED25,
    __UNUSED26,
    __UNUSED27,
    __UNUSED28,
    __UNUSED29,
    __UNUSED30,
    __UNUSED31,
    __UNUSED32,
    __UNUSED33,
    __UNUSED34,
    __UNUSED35,
    __UNUSED36,
    __UNUSED37,
    __UNUSED38,
    __UNUSED39,
    __UNUSED40,
    __UNUSED41,
    __UNUSED42,
    __UNUSED43,
    __UNUSED44,
    __UNUSED45,
    __UNUSED46,
    __UNUSED47,
    __UNUSED48,
    __UNUSED49,
    __UNUSED50,
    __UNUSED51,
    __UNUSED52,
    __UNUSED53,
    __UNUSED54,
    __UNUSED55,
    __UNUSED56,
    __UNUSED57,
    __UNUSED58,
    __UNUSED59,
    __UNUSED60,
    __UNUSED61,
    __UNUSED62,
    __UNUSED63,
    TARGET,
    DEPTH,
    COVERAGE,
    DEPTH_GREATER_EQUAL,
    DEPTH_LESS_EQUAL,
    STENCIL_REF,
    INNER_COVERAGE,
}

enum ResourceReturnType : int
{
    __UNUSED0,
    UNORM,
    SNORM,
    SINT,
    UINT,
    FLOAT,
    MIXED,
    DOUBLE,
    CONTINUED,
}

enum RegisterComponentType : int
{
    UNKNOWN,
    UINT32,
    SINT32,
    FLOAT32,
    UINT16,
    SINT16,
    FLOAT16,
    UINT64,
    SINT64,
    FLOAT64,
}

enum TessellatorDomain : int
{
    UNDEFINED,
    ISOLINE,
    TRI,
    QUAD,
}

enum TessellatorPartitioning : int
{
    UNDEFINED,
    INTEGER,
    POW2,
    FRACTIONAL_ODD,
    FRACTIONAL_EVEN,
}

enum TessellatorOutputPrimitive : int
{
    UNDEFINED,
    POINT,
    LINE,
    TRIANGLE_CW,
    TRIANGLE_CCW,
}

typedef MinPrecision = int;
const MinPrecision MIN_PRECISION_DEFAULT   = 0;
const MinPrecision MIN_PRECISION_FLOAT_16  = 1;
const MinPrecision MIN_PRECISION_FLOAT_2_8 = 2;
const MinPrecision MIN_PRECISION_RESERVED  = 3;
const MinPrecision MIN_PRECISION_SINT_16   = 4;
const MinPrecision MIN_PRECISION_UINT_16   = 5;
const MinPrecision MIN_PRECISION_ANY_16    = 0xf0;
const MinPrecision MIN_PRECISION_ANY_10    = 0xf1;

enum InterpolationMode : int
{
    UNDEFINED,
    CONSTANT,
    LINEAR,
    LINEAR_CENTROID,
    LINEAR_NOPERSPECTIVE,
    LINEAR_NOPERSPECTIVE_CENTROID,
    LINEAR_SAMPLE,
    LINEAR_NOPERSPECTIVE_SAMPLE,
}

bitstruct ParameterFlags : uint
{
    bool in        : 0;
    bool out       : 1;
    uint __unused0 : 2..31;
}

const ParameterFlags PARAMETER_FLAGS_NONE = {};

typedef FormatLayout = int;
const FormatLayout FL_STANDARD = 0;
const FormatLayout FL_CUSTOM   = -1;

typedef FormatTypeLevel = int;
const FormatTypeLevel FTL_NO_TYPE      = 0;
const FormatTypeLevel FTL_PARTIAL_TYPE = -2;
const FormatTypeLevel FTL_FULL_TYPE    = -1;

typedef FormatComponentName = int;
const FormatComponentName FCN_R = -4;
const FormatComponentName FCN_G = -3;
const FormatComponentName FCN_B = -2;
const FormatComponentName FCN_A = -1;
const FormatComponentName FCN_D = 0;
const FormatComponentName FCN_S = 1;
const FormatComponentName FCN_X = 2;

typedef FormatComponentInterpretation = int;
const FormatComponentInterpretation FCI_TYPELESS         = 0;
const FormatComponentInterpretation FCI_FLOAT            = -4;
const FormatComponentInterpretation FCI_SNORM            = -3;
const FormatComponentInterpretation FCI_UNORM            = -2;
const FormatComponentInterpretation FCI_SINT             = -1;
const FormatComponentInterpretation FCI_UINT             = 1;
const FormatComponentInterpretation FCI_UNORM_SRGB       = 2;
const FormatComponentInterpretation FCI_BIASED_FIXED_2_8 = 3;

const Win32_GUID WKPDI_DEBUG_OBJECT_NAME_UUID = {
    0x429b8c22, 0x9188, 0x4b0c, { 0x87, 0x42, 0xac, 0xb0, 0xbf, 0x85, 0xc2, 0x00 } };

const Win32_GUID WKPDI_DEBUG_OBJECT_NAMEW_UUID = {
    0x4cca5fd8, 0x921f, 0x42c8, { 0x85, 0x66, 0x70, 0xca, 0xf2, 0xa9, 0xb7, 0x41 } };

const Win32_GUID WKPDID_COMMENT_STRINGW_UUID = {
    0xd0149dc0, 0x90e8, 0x4ec8, { 0x81,  0x44,  0xe9,  0x00,  0xad,  0x26,  0x6b,  0xb2 } };

const Win32_GUID WKPDID_UNIQUE_OBJECT_ID_UUID = {
    0x1b39de15,  0xec04,  0x4bae, {  0xba,  0x4d,  0x8c,  0xef,  0x79,  0xfc,  0x04,  0xc1 } };

const Win32_GUID TEXTURE_LAYOUT_ROW_MAJOR_UUID = {
    0xb5dc234f, 0x72bb, 0x4bec, { 0x97, 0x05, 0x8c, 0xf2, 0x58, 0xdf, 0x6b, 0x6c } };

const Win32_GUID TEXTURE_LAYOUT_64KB_STANDARD_SWIZZLE_UUID = {
    0x4c0f29e3, 0x3f5f, 0x4d35, { 0x84, 0xc9, 0xbc, 0x09, 0x83, 0xb6, 0x2c, 0x28 } };
