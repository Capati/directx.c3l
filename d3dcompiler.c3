module directx::d3dc;

import std::os::win32;
import directx::d3d12;
import directx::dxgi;

const D3DCOMPILER_DLL_W = "d3dcompiler_47.dll";
const D3DCOMPILER_DLL_A = "d3dcompiler_47.dll";

const COMPILER_VERSION = 47;

alias ID3DBlob = ID3D10Blob;

extern fn Win32_HRESULT readFileToBlob(
    Win32_LPCWSTR pFileName,
    ID3DBlob** ppContents
) @extern("D3DReadFileToBlob");

extern fn Win32_HRESULT writeBlobToFile(
    ID3DBlob* pBlob,
    Win32_LPCWSTR pFileName,
    Bool bOverwrite
) @extern("D3DWriteBlobToFile");

bitstruct CompileFlags : uint
{
    bool debug                           : 0;
    bool skipValidation                  : 1;
    bool skipOptimization                : 2;
    bool packMatrixRowMajor              : 3;
    bool packMatrixColumnMajor           : 4;
    bool partialPrecision                : 5;
    bool forceVsSoftwareNoOpt            : 6;
    bool forcePsSoftwareNoOpt            : 7;
    bool noPreshader                     : 8;
    bool avoidFlowControl                : 9;
    bool preferFlowControl               : 10;
    bool enableStrictness                : 11;
    bool enableBackwardsCompatibility    : 12;
    bool ieeeStrictness                  : 13;
    bool optimizationLevel0              : 14;
    bool optimizationLevel3              : 15;
    bool reserved16                      : 16;
    bool reserved17                      : 17;
    bool warningsAreErrors               : 18;
    bool resourcesMayAlias               : 19;
    bool enableUnboundedDescriptorTables : 20;
    bool allResourcesBound               : 21;
    bool debugNameForSource              : 22;
    bool debugNameForBinary              : 23;
    uint __unused0                       : 24..31;
}

alias Compile = CompileFlags;

const CompileFlags COMPILE_FLAGS_OPTIMIZATION_NONE = {};
const CompileFlags COMPILE_FLAGS_OPTIMIZATION_LEVEL0 = { .optimizationLevel0 };
const CompileFlags COMPILE_FLAGS_OPTIMIZATION_LEVEL1 = {};
const CompileFlags COMPILE_FLAGS_OPTIMIZATION_LEVEL2 = {
    .optimizationLevel0, .optimizationLevel3
};
const CompileFlags COMPILE_FLAGS_OPTIMIZATION_LEVEL3 = { .optimizationLevel3 };

bitstruct EffectFlags : uint
{
    bool childEffect  : 0;
    bool allowSlowOps : 1;
    uint __unused0    : 2..31;
}

alias CompileEffect = EffectFlags;

bitstruct Flags2 : uint
{
    bool forceRootSignatureLatest : 0;
    bool forceRootSignature_1_0   : 1;
    bool forceRootSignature_1_1   : 2;
    uint __unused0                : 3..31;
}

alias CompileFlags2 = Flags2;

extern fn Win32_HRESULT compile (
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    ZString pSourceName,
    ShaderMacro* pDefines,
    ID3DInclude* pInclude,
    ZString pEntrypoint,
    ZString pTarget,
    CompileFlags flags1,
    uint flags2,
    ID3DBlob** ppCode,
    ID3DBlob** ppErrorMsgs
) @extern("D3DCompile");

alias PCompile = fn Win32_HRESULT (
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    ZString pFileName,
    ShaderMacro* pDefines,
    ID3DInclude* pInclude,
    ZString pEntrypoint,
    ZString pTarget,
    uint flags1,
    uint flags2,
    ID3DBlob** ppCode,
    ID3DBlob** ppErrorMsgs);
alias PD3DCompile = PCompile;

const SECDATA_MERGE_UAV_SLOTS         = 0x00000001;
const SECDATA_PRESERVE_TEMPLATE_SLOTS = 0x00000002;
const SECDATA_REQUIRE_TEMPLATE_MATCH  = 0x00000004;

extern fn Win32_HRESULT compile2 (
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    ZString pSourceName,
    ShaderMacro* pDefines,
    ID3DInclude* pInclude,
    ZString pEntrypoint,
    ZString pTarget,
    uint flags1,
    uint flags2,
    uint secondaryDataFlags,
    Win32_LPCVOID pSecondaryData,
    Win32_SIZE_T secondaryDataSize,
    ID3DBlob** ppCode,
    ID3DBlob** ppErrorMsgs
) @extern("D3DCompile2");

extern fn Win32_HRESULT compileFromFile (
    Win32_LPCWSTR pFileName,
    ShaderMacro* pDefines,
    ID3DInclude* pInclude,
    ZString pEntrypoint,
    ZString pTarget,
    uint flags1,
    uint flags2,
    ID3DBlob** ppCode,
    ID3DBlob** ppErrorMsgs
) @extern("D3DCompileFromFile");

extern fn Win32_HRESULT preprocess (
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    ZString pSourceName,
    ShaderMacro* pDefines,
    ID3DInclude* pInclude,
    ID3DBlob** ppCodeText,
    ID3DBlob** ppErrorMsgs
) @extern("Win32_HRESULTD3DPreprocess");

alias PPreprocess = fn Win32_HRESULT (
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    ZString pFileName,
    ShaderMacro* pDefines,
    ID3DInclude* pInclude,
    ID3DBlob** ppCodeText,
    ID3DBlob** ppErrorMsgs);
alias PD3DPreprocess = PPreprocess;

extern fn Win32_HRESULT getDebugInfo (
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    ID3DBlob** ppDebugInfo
) @extern("D3DGetDebugInfo");

extern fn Win32_HRESULT reflect (
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    Win32_GUID* pInterface,
    void** ppReflector
)  @extern("D3DReflect");

extern fn Win32_HRESULT reflectLibrary(
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    Win32_GUID* riid,
    Win32_LPVOID* ppReflector
) @extern("D3DReflectLibrary");

const DISASM_ENABLE_COLOR_CODE            = 0x00000001;
const DISASM_ENABLE_DEFAULT_VALUE_PRINTS  = 0x00000002;
const DISASM_ENABLE_INSTRUCTION_NUMBERING = 0x00000004;
const DISASM_ENABLE_INSTRUCTION_CYCLE     = 0x00000008;
const DISASM_DISABLE_DEBUG_INFO           = 0x00000010;
const DISASM_ENABLE_INSTRUCTION_OFFSET    = 0x00000020;
const DISASM_INSTRUCTION_ONLY             = 0x00000040;
const DISASM_PRINT_HEX_LITERALS           = 0x00000080;

extern fn Win32_HRESULT disassemble (
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    uint flags,
    ZString szComments,
    ID3DBlob** ppDisassembly
) @extern("D3DDisassemble");

alias PDisassemble = fn Win32_HRESULT (
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    uint flags,
    ZString szComments,
    ID3DBlob** ppDisassembly);

alias PD3DDisassemble = PDisassemble;

extern fn Win32_HRESULT disassembleRegion (
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    uint flags,
    ZString szComments,
    Win32_SIZE_T startByteOffset,
    Win32_SIZE_T numInsts,
    Win32_SIZE_T* pFinishByteOffset,
    ID3DBlob** ppDisassembly
) @extern("D3DDisassembleRegion");

extern fn Win32_HRESULT createLinker(ILinker** ppLinker) @extern("D3DCreateLinker");

extern fn Win32_HRESULT loadModule(
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T cbSrcDataSize,
    IModule** ppModule
) @extern("D3DLoadModule");

extern fn Win32_HRESULT createFunctionLinkingGraph(
    uint uFlags,
    IFunctionLinkingGraph** ppFunctionLinkingGraph
) @extern("D3DCreateFunctionLinkingGraph");

const GET_INST_OFFSETS_INCLUDE_NON_EXECUTABLE = 0x00000001;

extern fn Win32_HRESULT getTraceInstructionOffsets(
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    uint flags,
    Win32_SIZE_T startInstIndex,
    Win32_SIZE_T numInsts,
    Win32_SIZE_T* pOffsets,
    Win32_SIZE_T* pTotalInsts
) @extern("D3DGetTraceInstructionOffsets");

extern fn Win32_HRESULT getInputSignatureBlob(
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    ID3DBlob** ppSignatureBlob
) @extern("D3DGetInputSignatureBlob");

extern fn Win32_HRESULT getOutputSignatureBlob(
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    ID3DBlob** ppSignatureBlob
) @extern("D3DGetOutputSignatureBlob");

extern fn Win32_HRESULT getInputAndOutputSignatureBlob(
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    ID3DBlob** ppSignatureBlob
) @extern("D3DGetInputAndOutputSignatureBlob");

bitstruct StripFlags : uint
{
    bool reflectionData : 0;
    bool debugInfo      : 1;
    bool testBlobs      : 2;
    bool privateData    : 3;
    bool rootSignature  : 4;
    uint __unused0      : 5..31;
}

extern fn Win32_HRESULT stripShader(
    Win32_LPCVOID pShaderBytecode,
    Win32_SIZE_T bytecodeLength,
    StripFlags uStripFlags,
    ID3DBlob** ppStrippedBlob
) @extern("D3DStripShader");

enum BlobPart : int (int value)
{
    INPUT_SIGNATURE_BLOB            = 0,
    OUTPUT_SIGNATURE_BLOB           = 1,
    INPUT_AND_OUTPUT_SIGNATURE_BLOB = 2,
    PATCH_CONSTANT_SIGNATURE_BLOB   = 3,
    ALL_SIGNATURE_BLOB              = 4,
    DEBUG_INFO                      = 5,
    LEGACY_SHADER                   = 6,
    XNA_PREPASS_SHADER              = 7,
    XNA_SHADER                      = 8,
    PDB                             = 9,
    PRIVATE_DATA                    = 10,
    ROOT_SIGNATURE                  = 11,
    DEBUG_NAME                      = 12,
    TEST_ALTERNATE_SHADER           = 0x8000,
    TEST_COMPILE_DETAILS            = 0x8001,
    TEST_COMPILE_PERF               = 0x8002,
    TEST_COMPILE_REPORT             = 0x8003,
}

extern fn Win32_HRESULT _getBlobPart(
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    int part,
    uint flags,
    ID3DBlob** ppPart
) @local @extern("D3DGetBlobPart");
fn Win32_HRESULT getBlobPart(
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    BlobPart part,
    uint flags,
    ID3DBlob** ppPart
) @inline =>
    _getBlobPart(pSrcData, srcDataSize, part.value, flags, ppPart);

extern fn Win32_HRESULT _setBlobPart(
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    int part,
    uint flags,
    Win32_LPCVOID pPart,
    Win32_SIZE_T partSize,
    ID3DBlob** ppNewShader
) @local @extern("D3DSetBlobPart");
fn Win32_HRESULT setBlobPart(
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    BlobPart part,
    uint flags,
    Win32_LPCVOID pPart,
    Win32_SIZE_T partSize,
    ID3DBlob** ppNewShader
) @inline =>
    _setBlobPart(pSrcData, srcDataSize, part.value, flags, pPart, partSize, ppNewShader);

extern fn Win32_HRESULT createBlob(
    Win32_SIZE_T size,
    ID3DBlob** ppBlob
) @extern("D3DCreateBlob");

struct ShaderData
{
    Win32_LPCVOID pBytecode;
    Win32_SIZE_T bytecodeLength;
}

const COMPRESS_SHADER_KEEP_ALL_PARTS = 0x00000001;

extern fn Win32_HRESULT compressShaders(
    uint uNumShaders,
    ShaderData* pShaderData,
    uint uFlags,
    ID3DBlob** ppCompressedData
) @extern("D3DCompressShaders");

extern fn Win32_HRESULT decompressShaders(
    Win32_LPCVOID pSrcData,
    Win32_SIZE_T srcDataSize,
    uint uNumShaders,
    uint uStartIndex,
    uint* pIndices,
    uint uFlags,
    ID3DBlob** ppShaders,
    uint* pTotalShaders
) @extern("D3DDecompressShaders");

// extern fn Win32_HRESULT disassemble10Effect(
//     ID3D10Effect* pEffect,
//     uint flags,
//     ID3DBlob** ppDisassembly
// ) @extern("D3DDisassemble10Effect");

// =============================================================================
// d3d12shader
// =============================================================================

enum ShaderVersionType : uint
{
    PIXEL_SHADER,
    VERTEX_SHADER,
    GEOMETRY_SHADER,
    HULL_SHADER,
    DOMAIN_SHADER,
    COMPUTE_SHADER,
    LIBRARY,
    RAY_GENERATION_SHADER,
    INTERSECTION_SHADER,
    ANY_HIT_SHADER,
    CLOSEST_HIT_SHADER,
    MISS_SHADER,
    CALLABLE_SHADER,
    MESH_SHADER,
    AMPLIFICATION_SHADER,
    SHVER_NODE_SHADER,
}

macro ShaderVersionType shverGetType($version) =>
    ShaderVersionType.from_ordinal((($version) >> 16) & 0xffff);
macro shverGetMajor($version) => ((($version) >> 4) & 0xf);
macro shverGetMinor($version) => ((($version) >> 0) & 0xf);

const RETURN_PARAMETER_INDEX = -1;

struct SignatureParameterDesc
{
    ZString semanticName;
    uint semanticIndex;
    uint register;
    Name systemValueType;
    RegisterComponentType componentType;
    char mask;
    char readWriteMask;
    uint stream;
    MinPrecision minPrecision;
}

struct ShaderBufferDesc
{
    ZString name;
    CBufferType type;
    uint variables;
    uint size;
    ShaderCBufferFlags uFlags;
}

struct ShaderVariableDesc
{
    ZString name;
    uint startOffset;
    uint size;
    ShaderVariableFlags uFlags;
    Win32_LPVOID defaultValue;
    uint startTexture;
    uint textureSize;
    uint startSampler;
    uint samplerSize;
}

struct ShaderTypeDesc
{
    ShaderVariableClass class;
    ShaderVariableType type;
    uint rows;
    uint columns;
    uint elements;
    uint members;
    uint offset;
    ZString name;
}

struct ShaderDesc
{
    uint version;
    ZString creator;
    uint flags;
    uint constantBuffers;
    uint boundResources;
    uint inputParameters;
    uint outputParameters;
    uint instructionCount;
    uint tempRegisterCount;
    uint tempArrayCount;
    uint defCount;
    uint dclCount;
    uint textureNormalInstructions;
    uint textureLoadInstructions;
    uint textureCompInstructions;
    uint textureBiasInstructions;
    uint textureGradientInstructions;
    uint floatInstructionCount;
    uint intInstructionCount;
    uint uintInstructionCount;
    uint staticFlowControlCount;
    uint dynamicFlowControlCount;
    uint macroInstructionCount;
    uint arrayInstructionCount;
    uint cutInstructionCount;
    uint emitInstructionCount;
    PrimitiveTopology gSOutputTopology;
    uint gSMaxOutputVertexCount;
    Primitive inputPrimitive;
    uint patchConstantParameters;
    uint cGSInstanceCount;
    uint cControlPoints;
    TessellatorOutputPrimitive hSOutputPrimitive;
    TessellatorPartitioning hSPartitioning;
    TessellatorDomain tessellatorDomain;
    uint cBarrierInstructions;
    uint cInterlockedInstructions;
    uint cTextureStoreInstructions;
}

struct ShaderInputBindDesc
{
    ZString name;
    ShaderInputType type;
    uint bindPoint;
    uint bindCount;
    ShaderInputFlags uFlags;
    ResourceReturnType returnType;
    SrvDimension dimension;
    uint numSamples;
    uint space;
    uint uID;
}

bitstruct ShaderRequiresFlags : ulong
{
    bool doubles                                               : 0;
    bool earlyDepthStencil                                     : 1;
    bool uavsAtEveryStage                                      : 2;
    bool uavs64                                                : 3;
    bool minimumPrecision                                      : 4;
    bool doubleExtensions11_1                                  : 5;
    bool shaderExtensions11_1                                  : 6;
    bool level9ComparisonFiltering                             : 7;
    bool tiledResources                                        : 8;
    bool stencilRef                                            : 9;
    bool innerCoverage                                         : 10;
    bool typedUavLoadAdditionalFormats                         : 11;
    bool rovs                                                  : 12;
    bool viewportAndRtArrayIndexFromAnyShaderFeedingRasterizer : 13;
    bool waveOps                                               : 14;
    bool int64Ops                                              : 15;
    bool viewId                                                : 16;
    bool barycentrics                                          : 17;
    bool native16BitOps                                        : 18;
    bool shadingRate                                           : 19;
    bool raytracingTier1_1                                     : 20;
    bool samplerFeedback                                       : 21;
    bool atomicInt64OnTypedResource                            : 22;
    bool atomicInt64OnGroupShared                              : 23;
    bool derivativesInMeshAndAmplificationShaders              : 24;
    bool resourceDescriptorHeapIndexing                        : 25;
    bool samplerDescriptorHeapIndexing                         : 26;
    bool waveMma                                               : 27;
    bool atomicInt64OnDescriptorHeapResource                   : 28;
    bool advancedTextureOps                                    : 29;
    bool writeableMsaaTextures                                 : 30;
    bool sampleCmpGradientOrBias                               : 31;
    bool extendedCommandInfo                                   : 32;
    uint __unused0                                             : 33..63;
}

struct LibraryDesc
{
    ZString creator;
    uint flags;
    uint functionCount;
}

struct FunctionDesc
{
    uint version;
    ZString creator;
    uint flags;
    uint constantBuffers;
    uint boundResources;
    uint instructionCount;
    uint tempRegisterCount;
    uint tempArrayCount;
    uint defCount;
    uint dclCount;
    uint textureNormalInstructions;
    uint textureLoadInstructions;
    uint textureCompInstructions;
    uint textureBiasInstructions;
    uint textureGradientInstructions;
    uint floatInstructionCount;
    uint intInstructionCount;
    uint uintInstructionCount;
    uint staticFlowControlCount;
    uint dynamicFlowControlCount;
    uint macroInstructionCount;
    uint arrayInstructionCount;
    uint movInstructionCount;
    uint movcInstructionCount;
    uint conversionInstructionCount;
    uint bitwiseInstructionCount;
    FeatureLevel minFeatureLevel;
    ulong requiredFeatureFlags;
    ZString name;
    int functionParameterCount;
    Bool hasReturn;
    Bool has10Level9VertexShader;
    Bool has10Level9PixelShader;
}

struct ParameterDesc
{
    ZString name;
    ZString semanticName;
    ShaderVariableType type;
    ShaderVariableClass class;
    uint rows;
    uint columns;
    InterpolationMode interpolationMode;
    ParameterFlags flags;
    uint firstInRegister;
    uint firstInComponent;
    uint firstOutRegister;
    uint firstOutComponent;
}

// =============================================================================
// IShaderReflectionType
// =============================================================================

const ISHADER_REFLECTION_TYPE_UUID_STRING = "E913C351-783D-48CA-A1D1-4F306284AD56";
const Win32_GUID ISHADER_REFLECTION_TYPE_UUID =
    { 0xe913c351, 0x783d, 0x48ca, { 0xa1, 0xd1, 0x4f, 0x30, 0x62, 0x84, 0xad, 0x56 } };

struct IShaderReflectionType
{
    IShaderReflectionTypeVTable* vtbl;
}

alias IShaderReflectionType_GetDescFn = fn Win32_HRESULT (
    void* self,
    ShaderTypeDesc* pDesc);

alias IShaderReflectionType_GetMemberTypeByIndexFn = fn IShaderReflectionType* (
    void* self,
    uint index);

alias IShaderReflectionType_GetMemberTypeByNameFn = fn IShaderReflectionType* (
    void* self,
    ZString name);

alias IShaderReflectionType_GetMemberTypeNameFn = fn ZString (
    void* self,
    uint index);

alias IShaderReflectionType_IsEqualFn = fn Win32_HRESULT (
    void* self,
    IShaderReflectionType* pType);

alias IShaderReflectionType_GetSubTypeFn = fn IShaderReflectionType* (void* self);

alias IShaderReflectionType_GetBaseClassFn = fn IShaderReflectionType* (void* self);

alias IShaderReflectionType_GetNumInterfacesFn = fn uint (void* self);

alias IShaderReflectionType_GetInterfaceByIndexFn = fn IShaderReflectionType* (
    void* self,
    uint uIndex);

alias IShaderReflectionType_IsOfTypeFn = fn Win32_HRESULT (
    void* self,
    IShaderReflectionType* pType);

alias IShaderReflectionType_ImplementsInterfaceFn = fn Win32_HRESULT (
    void* self,
    IShaderReflectionType* pBase);

struct IShaderReflectionTypeVTable
{
    IShaderReflectionType_GetDescFn getDesc;
    IShaderReflectionType_GetMemberTypeByIndexFn getMemberTypeByIndex;
    IShaderReflectionType_GetMemberTypeByNameFn getMemberTypeByName;
    IShaderReflectionType_GetMemberTypeNameFn getMemberTypeName;
    IShaderReflectionType_IsEqualFn isEqual;
    IShaderReflectionType_GetSubTypeFn getSubType;
    IShaderReflectionType_GetBaseClassFn getBaseClass;
    IShaderReflectionType_GetNumInterfacesFn getNumInterfaces;
    IShaderReflectionType_GetInterfaceByIndexFn getInterfaceByIndex;
    IShaderReflectionType_IsOfTypeFn isOfType;
    IShaderReflectionType_ImplementsInterfaceFn implementsInterface;
}

fn Win32_HRESULT IShaderReflectionType.getDesc(
    &self,
    ShaderTypeDesc* pDesc
) @inline =>
    self.vtbl.getDesc(self, pDesc);

fn IShaderReflectionType* IShaderReflectionType.getMemberTypeByIndex(
    &self,
    uint index
) @inline =>
    self.vtbl.getMemberTypeByIndex(self, index);

fn IShaderReflectionType* IShaderReflectionType.getMemberTypeByName(
    &self,
    ZString name
) @inline =>
    self.vtbl.getMemberTypeByName(self, name);

fn ZString IShaderReflectionType.getMemberTypeName(
    &self,
    uint index
) @inline =>
    self.vtbl.getMemberTypeName(self, index);

fn Win32_HRESULT IShaderReflectionType.isEqual(
    &self,
    IShaderReflectionType* pType
) @inline =>
    self.vtbl.isEqual(self, pType);

fn IShaderReflectionType* IShaderReflectionType.getSubType(&self) @inline =>
    self.vtbl.getSubType(self);

fn IShaderReflectionType* IShaderReflectionType.getBaseClass(&self) @inline =>
    self.vtbl.getBaseClass(self);

fn uint IShaderReflectionType.getNumInterfaces(&self) @inline =>
    self.vtbl.getNumInterfaces(self);

fn IShaderReflectionType* IShaderReflectionType.getInterfaceByIndex(
    &self,
    uint uIndex
) @inline =>
    self.vtbl.getInterfaceByIndex(self, uIndex);

fn Win32_HRESULT IShaderReflectionType.isOfType(
    &self,
    IShaderReflectionType* pType
) @inline =>
    self.vtbl.isOfType(self, pType);

fn Win32_HRESULT IShaderReflectionType.implementsInterface(
    &self,
    IShaderReflectionType* pBase
) @inline =>
    self.vtbl.implementsInterface(self, pBase);


// =============================================================================
// IShaderReflectionVariable
// =============================================================================

const ISHADER_REFLECTION_VARIABLE_UUID_STRING = "8337A8A6-A216-444A-B2F4-314733A73AEA";
const Win32_GUID ISHADER_REFLECTION_VARIABLE_UUID =
    { 0x8337a8a6, 0xa216, 0x444a, { 0xb2, 0xf4, 0x31, 0x47, 0x33, 0xa7, 0x3a, 0xea } };

struct IShaderReflectionVariable
{
    IShaderReflectionVariableVTable* vtbl;
}

alias IShaderReflectionVariable_GetDescFn = fn Win32_HRESULT (
    void* self,
    ShaderVariableDesc* pDesc);

alias IShaderReflectionVariable_GetTypeFn = fn IShaderReflectionType* (void* self);

alias IShaderReflectionVariable_GetBufferFn = fn IShaderReflectionConstantBuffer* (void* self);

alias IShaderReflectionVariable_GetInterfaceSlotFn = fn uint (
    void* self,
    uint uArrayIndex);

struct IShaderReflectionVariableVTable
{
    IShaderReflectionVariable_GetDescFn getDesc;
    IShaderReflectionVariable_GetTypeFn getType;
    IShaderReflectionVariable_GetBufferFn getBuffer;
    IShaderReflectionVariable_GetInterfaceSlotFn getInterfaceSlot;
}

fn Win32_HRESULT IShaderReflectionVariable.getDesc(
    &self,
    ShaderVariableDesc* pDesc
) @inline =>
    self.vtbl.getDesc(self, pDesc);

fn IShaderReflectionType* IShaderReflectionVariable.getType(&self) @inline =>
    self.vtbl.getType(self);

fn IShaderReflectionConstantBuffer* IShaderReflectionVariable.getBuffer(&self) @inline =>
    self.vtbl.getBuffer(self);

fn uint IShaderReflectionVariable.getInterfaceSlot(
    &self,
    uint uArrayIndex
) @inline =>
    self.vtbl.getInterfaceSlot(self, uArrayIndex);

// =============================================================================
// IShaderReflectionConstantBuffer
// =============================================================================

const ISHADER_REFLECTION_CONSTANT_BUFFER_UUID_STRING = "C59598B4-48B3-4869-B9B1-B1618B14A8B7";
const Win32_GUID ISHADER_REFLECTION_CONSTANT_BUFFER_UUID =
    { 0xc59598b4, 0x48b3, 0x4869, { 0xb9, 0xb1, 0xb1, 0x61, 0x8b, 0x14, 0xa8, 0xb7 } };

struct IShaderReflectionConstantBuffer
{
    IShaderReflectionConstantBufferVTable* vtbl;
}

alias IShaderReflectionConstantBuffer_GetDescFn = fn Win32_HRESULT (
    void* self,
    ShaderBufferDesc* pDesc);

alias IShaderReflectionConstantBuffer_GetVariableByIndexFn = fn IShaderReflectionVariable* (
    void* self,
    uint index);

alias IShaderReflectionConstantBuffer_GetVariableByNameFn = fn IShaderReflectionVariable* (
    void* self,
    ZString name);

struct IShaderReflectionConstantBufferVTable
{
    IShaderReflectionConstantBuffer_GetDescFn getDesc;
    IShaderReflectionConstantBuffer_GetVariableByIndexFn getVariableByIndex;
    IShaderReflectionConstantBuffer_GetVariableByNameFn getVariableByName;
}

fn Win32_HRESULT IShaderReflectionConstantBuffer.getDesc(
    &self,
    ShaderBufferDesc* pDesc
) @inline =>
    self.vtbl.getDesc(self, pDesc);

fn IShaderReflectionVariable* IShaderReflectionConstantBuffer.getVariableByIndex(
    &self,
    uint index
) @inline =>
    self.vtbl.getVariableByIndex(self, index);

fn IShaderReflectionVariable* IShaderReflectionConstantBuffer.getVariableByName(
    &self,
    ZString name
) @inline =>
    self.vtbl.getVariableByName(self, name);

// =============================================================================
// IShaderReflection
// =============================================================================

const ISHADER_REFLECTION_UUID_STRING = "5A58797D-A72C-478D-8BA2-EFC6B0EFE88E";
const Win32_GUID ISHADER_REFLECTION_UUID =
    { 0x5a58797d, 0xa72c, 0x478d, { 0x8b, 0xa2, 0xef, 0xc6, 0xb0, 0xef, 0xe8, 0x8e } };

struct IShaderReflection
{
    IShaderReflectionVTable* vtbl;
}

alias IShaderReflection_GetDescFn = fn Win32_HRESULT(
    void* self,
    ShaderDesc* pDesc);

alias IShaderReflection_GetConstantBufferByIndexFn =
    fn IShaderReflectionConstantBuffer* (
        void* self,
        uint index);

alias IShaderReflection_GetConstantBufferByNameFn = fn IShaderReflectionConstantBuffer* (
    void* self,
    ZString name);

alias IShaderReflection_GetResourceBindingDescFn = fn Win32_HRESULT(
    void* self,
    uint resourceIndex,
    ShaderInputBindDesc* pDesc);

alias IShaderReflection_GetInputParameterDescFn = fn Win32_HRESULT(
    void* self,
    uint parameterIndex,
    SignatureParameterDesc* pDesc);

alias IShaderReflection_GetOutputParameterDescFn = fn Win32_HRESULT(
    void* self,
    uint parameterIndex,
    SignatureParameterDesc* pDesc);

alias IShaderReflection_GetPatchConstantParameterDescFn = fn Win32_HRESULT(
    void* self,
    uint parameterIndex,
    SignatureParameterDesc* pDesc);

alias IShaderReflection_GetVariableByNameFn = fn IShaderReflectionVariable* (
    void* self,
    ZString name);

alias IShaderReflection_GetResourceBindingDescByNameFn = fn Win32_HRESULT(
    void* self,
    ZString name,
    ShaderInputBindDesc* pDesc);

alias IShaderReflection_GetMovInstructionCountFn = fn uint (void* self);

alias IShaderReflection_GetMovcInstructionCountFn = fn uint (void* self);

alias IShaderReflection_GetConversionInstructionCountFn = fn uint (void* self);

alias IShaderReflection_GetBitwiseInstructionCountFn = fn uint (void* self);

alias IShaderReflection_GetGSInputPrimitiveFn = fn Primitive (void* self);

alias IShaderReflection_IsSampleFrequencyShaderFn = fn Bool (void* self);

alias IShaderReflection_GetNumInterfaceSlotsFn = fn uint (void* self);

alias IShaderReflection_GetMinFeatureLevelFn = fn Win32_HRESULT(
    void* self,
    FeatureLevel* pLevel);

alias IShaderReflection_GetThreadGroupSizeFn = fn uint (
    void* self,
    uint* pSizeX,
    uint* pSizeY,
    uint* pSizeZ);

alias IShaderReflection_GetRequiresFlagsFn = fn ShaderRequiresFlags (void* self);

struct IShaderReflectionVTable
{
    inline IUnknownVTable _base;
    IShaderReflection_GetDescFn getDesc;
    IShaderReflection_GetConstantBufferByIndexFn getConstantBufferByIndex;
    IShaderReflection_GetConstantBufferByNameFn getConstantBufferByName;
    IShaderReflection_GetResourceBindingDescFn getResourceBindingDesc;
    IShaderReflection_GetInputParameterDescFn getInputParameterDesc;
    IShaderReflection_GetOutputParameterDescFn getOutputParameterDesc;
    IShaderReflection_GetPatchConstantParameterDescFn getPatchConstantParameterDesc;
    IShaderReflection_GetVariableByNameFn getVariableByName;
    IShaderReflection_GetResourceBindingDescByNameFn getResourceBindingDescByName;
    IShaderReflection_GetMovInstructionCountFn getMovInstructionCount;
    IShaderReflection_GetMovcInstructionCountFn getMovcInstructionCount;
    IShaderReflection_GetConversionInstructionCountFn getConversionInstructionCount;
    IShaderReflection_GetBitwiseInstructionCountFn getBitwiseInstructionCount;
    IShaderReflection_GetGSInputPrimitiveFn getGSInputPrimitive;
    IShaderReflection_IsSampleFrequencyShaderFn isSampleFrequencyShader;
    IShaderReflection_GetNumInterfaceSlotsFn getNumInterfaceSlots;
    IShaderReflection_GetMinFeatureLevelFn getMinFeatureLevel;
    IShaderReflection_GetThreadGroupSizeFn getThreadGroupSize;
    IShaderReflection_GetRequiresFlagsFn getRequiresFlags;
}

// Functions of IUnknown

fn Win32_HRESULT IShaderReflection.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IShaderReflection.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IShaderReflection.release(&self) @inline => self.vtbl.release(self);

// Functions of IShaderReflection

fn Win32_HRESULT IShaderReflection.getDesc(
    &self,
    ShaderDesc* pDesc
) @inline =>
    self.vtbl.getDesc(self, pDesc);

fn IShaderReflectionConstantBuffer* IShaderReflection.getConstantBufferByIndex(
    &self,
    uint index
) @inline =>
    self.vtbl.getConstantBufferByIndex(self, index);

fn IShaderReflectionConstantBuffer* IShaderReflection.getConstantBufferByName(
    &self,
    ZString name
) @inline =>
    self.vtbl.getConstantBufferByName(self, name);

fn Win32_HRESULT IShaderReflection.getResourceBindingDesc(
    &self,
    uint resourceIndex,
    ShaderInputBindDesc* pDesc
) @inline =>
    self.vtbl.getResourceBindingDesc(self, resourceIndex, pDesc);

fn Win32_HRESULT IShaderReflection.getInputParameterDesc(
    &self,
    uint parameterIndex,
    SignatureParameterDesc* pDesc
) @inline =>
    self.vtbl.getInputParameterDesc(self, parameterIndex, pDesc);

fn Win32_HRESULT IShaderReflection.getOutputParameterDesc(
    &self,
    uint parameterIndex,
    SignatureParameterDesc* pDesc
) @inline =>
    self.vtbl.getOutputParameterDesc(self, parameterIndex, pDesc);

fn Win32_HRESULT IShaderReflection.getPatchConstantParameterDesc(
    &self,
    uint parameterIndex,
    SignatureParameterDesc* pDesc
) @inline =>
    self.vtbl.getPatchConstantParameterDesc(self, parameterIndex, pDesc);

fn IShaderReflectionVariable* IShaderReflection.getVariableByName(
    &self,
    ZString name
) @inline =>
    self.vtbl.getVariableByName(self, name);

fn Win32_HRESULT IShaderReflection.getResourceBindingDescByName(
    &self,
    ZString name,
    ShaderInputBindDesc* pDesc
) @inline =>
    self.vtbl.getResourceBindingDescByName(self, name, pDesc);

fn uint IShaderReflection.getMovInstructionCount(&self) @inline =>
    self.vtbl.getMovInstructionCount(self);

fn uint IShaderReflection.getMovcInstructionCount(&self) @inline =>
    self.vtbl.getMovcInstructionCount(self);

fn uint IShaderReflection.getConversionInstructionCount(&self) @inline =>
    self.vtbl.getConversionInstructionCount(self);

fn uint IShaderReflection.getBitwiseInstructionCount(&self) @inline =>
    self.vtbl.getBitwiseInstructionCount(self);

fn Primitive IShaderReflection.getGSInputPrimitive(&self) @inline =>
    self.vtbl.getGSInputPrimitive(self);

fn Bool IShaderReflection.isSampleFrequencyShader(&self) @inline =>
    self.vtbl.isSampleFrequencyShader(self);

fn uint IShaderReflection.getNumInterfaceSlots(&self) @inline =>
    self.vtbl.getNumInterfaceSlots(self);

fn Win32_HRESULT IShaderReflection.getMinFeatureLevel(
    &self,
    FeatureLevel* pLevel
) @inline =>
    self.vtbl.getMinFeatureLevel(self, pLevel);

fn uint IShaderReflection.getThreadGroupSize(
    &self,
    uint* pSizeX,
    uint* pSizeY,
    uint* pSizeZ
) @inline =>
    self.vtbl.getThreadGroupSize(self, pSizeX, pSizeY, pSizeZ);

fn ShaderRequiresFlags IShaderReflection.getRequiresFlags(&self) @inline =>
    self.vtbl.getRequiresFlags(self);

// =============================================================================
// ILibraryReflection
// =============================================================================

const ILIBRARY_REFLECTION_UUID_STRING = "8E349D19-54DB-4A56-9DC9-119D87BDB804";
const Win32_GUID ILIBRARY_REFLECTION_UUID =
    { 0x8e349d19, 0x54db, 0x4a56, { 0x9d, 0xc9, 0x11, 0x9d, 0x87, 0xbd, 0xb8, 0x4 } };

struct ILibraryReflection
{
    ILibraryReflectionVTable* vtbl;
}

alias ILibraryReflection_GetDescFn = fn Win32_HRESULT (
    void* self,
    LibraryDesc*  pDesc);

alias ILibraryReflection_GetFunctionByIndexFn = fn IFunctionReflection* (
    void* self,
    int functionIndex);

struct ILibraryReflectionVTable
{
    inline IUnknownVTable _base;
    ILibraryReflection_GetDescFn getDesc;
    ILibraryReflection_GetFunctionByIndexFn getFunctionByIndex;
}

// Functions of IUnknown

fn Win32_HRESULT ILibraryReflection.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ILibraryReflection.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ILibraryReflection.release(&self) @inline => self.vtbl.release(self);

// Functions of ILibraryReflection

fn Win32_HRESULT ILibraryReflection.getDesc(
    &self,
    LibraryDesc* pDesc
) @inline =>
    self.vtbl.getDesc(self, pDesc);

fn IFunctionReflection* ILibraryReflection.getFunctionByIndex(
    &self,
    int functionIndex
) @inline =>
    self.vtbl.getFunctionByIndex(self, functionIndex);

// =============================================================================
// IFunctionParameterReflection
// =============================================================================

const IFUNCTION_PARAMETER_REFLECTION_UUID_STRING = "EC25F42D-7006-4F2B-B33E-02CC3375733F";
const Win32_GUID IFUNCTION_PARAMETER_REFLECTION_UUID =
    { 0xec25f42d, 0x7006, 0x4f2b, { 0xb3, 0x3e, 0x2, 0xcc, 0x33, 0x75, 0x73, 0x3f } };

struct IFunctionParameterReflection
{
    IFunctionParameterReflectionVTable* vtbl;
}

alias IFunctionParameterReflection_GetDescFn = fn Win32_HRESULT (
    void* self,
    ParameterDesc* pDesc);

struct IFunctionParameterReflectionVTable
{
    IFunctionParameterReflection_GetDescFn getDesc;
}

fn Win32_HRESULT IFunctionParameterReflection.getDesc(
    &self,
    ParameterDesc* pDesc
) @inline =>
    self.vtbl.getDesc(self, pDesc);

// =============================================================================
// IFunctionReflection
// =============================================================================

const ID3_D11FUNCTION_REFLECTION_UUID_STRING = "207BCECB-D683-4A06-A8A3-9B149B9F73A4";
const Win32_GUID ID3_D11FUNCTION_REFLECTION_UUID =
    { 0x207bcecb, 0xd683, 0x4a06, { 0xa8, 0xa3, 0x9b, 0x14, 0x9b, 0x9f, 0x73, 0xa4 } };

struct IFunctionReflection
{
    IFunctionReflectionVTable* vtbl;
}

alias IFunctionReflection_GetDescFn = fn Win32_HRESULT (
    void* self,
    FunctionDesc* pDesc);

alias IFunctionReflection_GetConstantBufferByIndexFn = fn IShaderReflectionConstantBuffer* (
    void* self,
    uint bufferIndex);

alias IFunctionReflection_GetConstantBufferByNameFn = fn IShaderReflectionConstantBuffer* (
    void* self,
    ZString name);

alias IFunctionReflection_GetResourceBindingDescFn = fn Win32_HRESULT (
    void* self,
    uint resourceIndex,
    ShaderInputBindDesc * pDesc);

alias IFunctionReflection_GetVariableByNameFn = fn IShaderReflectionVariable* (
    void* self,
    ZString name);

alias IFunctionReflection_GetResourceBindingDescByNameFn = fn Win32_HRESULT (
    void* self,
    ZString name,
    ShaderInputBindDesc* pDesc);

alias IFunctionReflection_GetFunctionParameterFn = fn IFunctionParameterReflection* (
    void* self,
    int parameterIndex);

struct IFunctionReflectionVTable
{
    IFunctionReflection_GetDescFn getDesc;
    IFunctionReflection_GetConstantBufferByIndexFn getConstantBufferByIndex;
    IFunctionReflection_GetConstantBufferByNameFn getConstantBufferByName;
    IFunctionReflection_GetResourceBindingDescFn getResourceBindingDesc;
    IFunctionReflection_GetVariableByNameFn getVariableByName;
    IFunctionReflection_GetResourceBindingDescByNameFn getResourceBindingDescByName;
    IFunctionReflection_GetFunctionParameterFn getFunctionParameter;
}

fn Win32_HRESULT IFunctionReflection.getDesc(
    &self,
    FunctionDesc* pDesc
) @inline =>
    self.vtbl.getDesc(self, pDesc);

fn IShaderReflectionConstantBuffer* IFunctionReflection.getConstantBufferByIndex(
    &self,
    uint bufferIndex
) @inline =>
    self.vtbl.getConstantBufferByIndex(self, bufferIndex);

fn IShaderReflectionConstantBuffer* IFunctionReflection.getConstantBufferByName(
    &self,
    ZString name
) @inline =>
    self.vtbl.getConstantBufferByName(self, name);

fn Win32_HRESULT IFunctionReflection.getResourceBindingDesc(
    &self,
    uint resourceIndex,
    ShaderInputBindDesc * pDesc
) @inline =>
    self.vtbl.getResourceBindingDesc(self, resourceIndex, pDesc);

fn IShaderReflectionVariable* IFunctionReflection.getVariableByName(
    &self,
    ZString name
) @inline =>
    self.vtbl.getVariableByName(self, name);

fn Win32_HRESULT IFunctionReflection.getResourceBindingDescByName(
    &self,
    ZString name,
    ShaderInputBindDesc* pDesc
) @inline =>
    self.vtbl.getResourceBindingDescByName(self, name, pDesc);

fn IFunctionParameterReflection* IFunctionReflection.getFunctionParameter(
    &self,
    int parameterIndex
) @inline =>
    self.vtbl.getFunctionParameter(self, parameterIndex);

// =============================================================================
// IModuleInstance
// =============================================================================

const IMODULE_INSTANCE_UUID_STRING = "469E07F7-045A-48D5-AA12-68A478CDF75D";
const Win32_GUID I_MODULE_INSTANCE_UUID =
    { 0x469e07f7, 0x45a, 0x48d5, { 0xaa, 0x12, 0x68, 0xa4, 0x78, 0xcd, 0xf7, 0x5d } };

struct IModuleInstance
{
    IModuleInstanceVTable* vtbl;
}

alias IModuleInstance_BindConstantBufferFn = fn Win32_HRESULT (
    void* self,
    uint uSrcSlot,
    uint uDstSlot,
    uint cbDstOffset);

alias IModuleInstance_BindConstantBufferByNameFn = fn Win32_HRESULT (
    void* self,
    ZString pName,
    uint uDstSlot,
    uint cbDstOffset);

alias IModuleInstance_BindResourceFn = fn Win32_HRESULT (
    void* self,
    uint uSrcSlot,
    uint uDstSlot,
    uint uCount);

alias IModuleInstance_BindResourceByNameFn = fn Win32_HRESULT (
    void* self,
    ZString pName,
    uint uDstSlot,
    uint uCount);

alias IModuleInstance_BindSamplerFn = fn Win32_HRESULT (
    void* self,
    uint uSrcSlot,
    uint uDstSlot,
    uint uCount);

alias IModuleInstance_BindSamplerByNameFn = fn Win32_HRESULT (
    void* self,
    ZString pName,
    uint uDstSlot,
    uint uCount);

alias IModuleInstance_BindUnorderedAccessViewFn = fn Win32_HRESULT (
    void* self,
    uint uSrcSlot,
    uint uDstSlot,
    uint uCount);

alias IModuleInstance_BindUnorderedAccessViewByNameFn = fn Win32_HRESULT (
    void* self,
    ZString pName,
    uint uDstSlot,
    uint uCount);

alias IModuleInstance_BindResourceAsUnorderedAccessViewFn = fn Win32_HRESULT (
    void* self,
    uint uSrcSrvSlot,
    uint uDstUavSlot,
    uint uCount);

alias IModuleInstance_BindResourceAsUnorderedAccessViewByNameFn = fn Win32_HRESULT (
    void* self,
    ZString pSrvName,
    uint uDstUavSlot,
    uint uCount);

struct IModuleInstanceVTable
{
    inline IUnknownVTable _base;
    IModuleInstance_BindConstantBufferFn bindConstantBuffer;
    IModuleInstance_BindConstantBufferByNameFn bindConstantBufferByName;
    IModuleInstance_BindResourceFn bindResource;
    IModuleInstance_BindResourceByNameFn bindResourceByName;
    IModuleInstance_BindSamplerFn bindSampler;
    IModuleInstance_BindSamplerByNameFn bindSamplerByName;
    IModuleInstance_BindUnorderedAccessViewFn bindUnorderedAccessView;
    IModuleInstance_BindUnorderedAccessViewByNameFn bindUnorderedAccessViewByName;
    IModuleInstance_BindResourceAsUnorderedAccessViewFn bindResourceAsUnorderedAccessView;
    IModuleInstance_BindResourceAsUnorderedAccessViewByNameFn bindResourceAsUnorderedAccessViewByName;
}

// Functions of IUnknown

fn Win32_HRESULT IModuleInstance.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IModuleInstance.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IModuleInstance.release(&self) @inline => self.vtbl.release(self);

// Functions of IModuleInstance

fn Win32_HRESULT IModuleInstance.bindConstantBuffer(
    &self,
    uint uSrcSlot,
    uint uDstSlot,
    uint cbDstOffset
) @inline =>
    self.vtbl.bindConstantBuffer(self, uSrcSlot, uDstSlot, cbDstOffset);

fn Win32_HRESULT IModuleInstance.bindConstantBufferByName(
    &self,
    ZString pName,
    uint uDstSlot,
    uint cbDstOffset
) @inline =>
    self.vtbl.bindConstantBufferByName(self, pName, uDstSlot, cbDstOffset);

fn Win32_HRESULT IModuleInstance.bindResource(
    &self,
    uint uSrcSlot,
    uint uDstSlot,
    uint uCount
) @inline =>
    self.vtbl.bindResource(self, uSrcSlot, uDstSlot, uCount);

fn Win32_HRESULT IModuleInstance.bindResourceByName(
    &self,
    ZString pName,
    uint uDstSlot,
    uint uCount
) @inline =>
    self.vtbl.bindResourceByName(self, pName, uDstSlot, uCount);

fn Win32_HRESULT IModuleInstance.bindSampler(
    &self,
    uint uSrcSlot,
    uint uDstSlot,
    uint uCount
) @inline =>
    self.vtbl.bindSampler(self, uSrcSlot, uDstSlot, uCount);

fn Win32_HRESULT IModuleInstance.bindSamplerByName(
    &self,
    ZString pName,
    uint uDstSlot,
    uint uCount
) @inline =>
    self.vtbl.bindSamplerByName(self, pName, uDstSlot, uCount);

fn Win32_HRESULT IModuleInstance.bindUnorderedAccessView(
    &self,
    uint uSrcSlot,
    uint uDstSlot,
    uint uCount
) @inline =>
    self.vtbl.bindUnorderedAccessView(self, uSrcSlot, uDstSlot, uCount);

fn Win32_HRESULT IModuleInstance.bindUnorderedAccessViewByName(
    &self,
    ZString pName,
    uint uDstSlot,
    uint uCount
) @inline =>
    self.vtbl.bindUnorderedAccessViewByName(self, pName, uDstSlot, uCount);

fn Win32_HRESULT IModuleInstance.bindResourceAsUnorderedAccessView(
    &self,
    uint uSrcSrvSlot,
    uint uDstUavSlot,
    uint uCount
) @inline =>
    self.vtbl.bindResourceAsUnorderedAccessView(self, uSrcSrvSlot, uDstUavSlot, uCount);

fn Win32_HRESULT IModuleInstance.bindResourceAsUnorderedAccessViewByName(
    &self,
    ZString pSrvName,
    uint uDstUavSlot,
    uint uCount
) @inline =>
    self.vtbl.bindResourceAsUnorderedAccessViewByName(self, pSrvName, uDstUavSlot, uCount);

// =============================================================================
// IModule
// =============================================================================

const IMODULE_UUID_STRING = "CAC701EE-80FC-4122-8242-10B39C8CEC34";
const Win32_GUID IMODULE_UUID = {
    0xcac701ee, 0x80fc, 0x4122, { 0x82, 0x42, 0x10, 0xb3, 0x9c, 0x8c, 0xec, 0x34 } };

struct IModule
{
    IModuleVTable* vtbl;
}

// Function pointers of IModule

alias IModule_CreateInstanceFn = fn Win32_HRESULT (
    void* self,
    ZString pNamespace,
    IModuleInstance** ppModuleInstance);

struct IModuleVTable
{
    inline IUnknownVTable _base;
    IModule_CreateInstanceFn createInstance;
}

// Functions of IUnknown

fn Win32_HRESULT IModule.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IModule.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IModule.release(&self) @inline => self.vtbl.release(self);

// Functions of IModule

fn Win32_HRESULT IModule.createInstance(
    &self,
    ZString pNamespace,
    IModuleInstance** ppModuleInstance
) @inline =>
    self.vtbl.createInstance(self, pNamespace, ppModuleInstance);

// =============================================================================
// ILinker
// =============================================================================

const ILINKER_UUID_STRING = "59A6CD0E-E10D-4C1F-88C0-63ABA1DAF30E";
const Win32_GUID ILINKER_UUID = {
    0x59a6cd0e, 0xe10d, 0x4c1f, { 0x88, 0xc0, 0x63, 0xab, 0xa1, 0xda, 0xf3, 0xe } };

struct ILinker
{
    ILinkerVTable* vtbl;
}

// Function pointers of ILinker

alias ILinker_LinkFn = fn Win32_HRESULT (
    void* self,
    IModuleInstance*  pEntry,
    ZString pEntryName,
    ZString pTargetName,
    uint uFlags,
    ID3DBlob** ppShaderBlob,
    ID3DBlob** ppErrorBuffer);

alias ILinker_UseLibraryFn = fn Win32_HRESULT (
    void* self,
    IModuleInstance* pLibraryMI);

alias ILinker_AddClipPlaneFromCBufferFn = fn Win32_HRESULT (
    void* self,
    uint uCBufferSlot,
    uint uCBufferEntry);

struct ILinkerVTable
{
    inline IUnknownVTable _base;
    ILinker_LinkFn link;
    ILinker_UseLibraryFn useLibrary;
    ILinker_AddClipPlaneFromCBufferFn addClipPlaneFromCBuffer;
}

// Functions of IUnknown

fn Win32_HRESULT ILinker.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ILinker.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ILinker.release(&self) @inline => self.vtbl.release(self);

// Functions of ILinker

fn Win32_HRESULT ILinker.link(
    &self,
    IModuleInstance*  pEntry,
    ZString pEntryName,
    ZString pTargetName,
    uint uFlags,
    ID3DBlob** ppShaderBlob,
    ID3DBlob** ppErrorBuffer
) @inline =>
    (self.vtbl.link(
        self,
        pEntry,
        pEntryName,
        pTargetName,
        uFlags,
        ppShaderBlob,
        ppErrorBuffer));

fn Win32_HRESULT ILinker.useLibrary(
    &self,
    IModuleInstance* pLibraryMI
) @inline =>
    self.vtbl.useLibrary(self, pLibraryMI);

fn Win32_HRESULT ILinker.addClipPlaneFromCBuffer(
    &self,
    uint uCBufferSlot,
    uint uCBufferEntry
) @inline =>
    self.vtbl.addClipPlaneFromCBuffer(self, uCBufferSlot, uCBufferEntry);

// =============================================================================
// ILinkingNode
// =============================================================================

const ILINKING_NODE_UUID_STRING = "D80DD70C-8D2F-4751-94A1-03C79B3556DB";
const Win32_GUID I_LINKING_NODE_UUID = {
    0xd80dd70c, 0x8d2f, 0x4751,{ 0x94, 0xa1, 0x3, 0xc7, 0x9b, 0x35, 0x56, 0xdb } };

struct ILinkingNode
{
    ILinkingNodeVTable* vtbl;
}

struct ILinkingNodeVTable
{
    inline IUnknownVTable _base;
}

// Functions of IUnknown

fn Win32_HRESULT ILinkingNode.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ILinkingNode.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ILinkingNode.release(&self) @inline => self.vtbl.release(self);

// =============================================================================
// IFunctionLinkingGraph
// =============================================================================

const IFUNCTION_LINKING_GRAPH_UUID_STRING = "54133220-1CE8-43D3-8236-9855C5CEECFF";
const Win32_GUID I_FUNCTION_LINKING_GRAPH_UUID_UUID = {
    0x54133220, 0x1ce8, 0x43d3, { 0x82, 0x36, 0x98, 0x55, 0xc5, 0xce, 0xec, 0xff } };

struct IFunctionLinkingGraph
{
    IFunctionLinkingGraphVTable* vtbl;
}

// Function pointers of IFunctionLinkingGraph

alias IFunctionLinkingGraph_CreateModuleInstanceFn = fn Win32_HRESULT (
    void* self,
    IModuleInstance** ppModuleInstance,
    ID3DBlob** ppErrorBuffer);

alias IFunctionLinkingGraph_SetInputSignatureFn = fn Win32_HRESULT (
    void* self,
    ParameterDesc* pInputParameters,
    uint cInputParameters,
    ILinkingNode** ppInputNode);

alias IFunctionLinkingGraph_SetOutputSignatureFn = fn Win32_HRESULT (
    void* self,
    ParameterDesc* pOutputParameters,
    uint cOutputParameters,
    ILinkingNode** ppOutputNode);

alias IFunctionLinkingGraph_CallFunctionFn = fn Win32_HRESULT (
    void* self,
    ZString pModuleInstanceNamespace,
    IModule* pModuleWithFunctionPrototype,
    ZString pFunctionName,
    ILinkingNode** ppCallNode);

alias IFunctionLinkingGraph_PassValueFn = fn Win32_HRESULT (
    void* self,
    ILinkingNode* pSrcNode,
    int srcParameterIndex,
    ILinkingNode* pDstNode,
    int dstParameterIndex);

alias IFunctionLinkingGraph_PassValueWithSwizzleFn = fn Win32_HRESULT (
    void* self,
    ILinkingNode* pSrcNode,
    int srcParameterIndex,
    ZString pSrcSwizzle,
    ILinkingNode* pDstNode,
    int dstParameterIndex,
    ZString pDstSwizzle);

alias IFunctionLinkingGraph_GetLastErrorFn = fn Win32_HRESULT (
    void* self,
    ID3DBlob** ppErrorBuffer);

alias IFunctionLinkingGraph_GenerateHlslFn = fn Win32_HRESULT (
    void* self,
    uint uFlags,
    ID3DBlob** ppBuffer);

struct IFunctionLinkingGraphVTable
{
    inline IUnknownVTable _base;
    IFunctionLinkingGraph_CreateModuleInstanceFn createModuleInstance;
    IFunctionLinkingGraph_SetInputSignatureFn setInputSignature;
    IFunctionLinkingGraph_SetOutputSignatureFn setOutputSignature;
    IFunctionLinkingGraph_CallFunctionFn callFunction;
    IFunctionLinkingGraph_PassValueFn passValue;
    IFunctionLinkingGraph_PassValueWithSwizzleFn passValueWithSwizzle;
    IFunctionLinkingGraph_GetLastErrorFn getLastError;
    IFunctionLinkingGraph_GenerateHlslFn generateHlsl;
}

// Functions of IUnknown

fn Win32_HRESULT IFunctionLinkingGraph.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IFunctionLinkingGraph.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IFunctionLinkingGraph.release(&self) @inline => self.vtbl.release(self);

// Functions of IFunctionLinkingGraph

fn Win32_HRESULT IFunctionLinkingGraph.createModuleInstance(
    &self,
    IModuleInstance** ppModuleInstance,
    ID3DBlob** ppErrorBuffer
) @inline =>
    self.vtbl.createModuleInstance(self, ppModuleInstance, ppErrorBuffer);

fn Win32_HRESULT IFunctionLinkingGraph.setInputSignature(
    &self,
    ParameterDesc* pInputParameters,
    uint cInputParameters,
    ILinkingNode** ppInputNode
) @inline =>
    self.vtbl.setInputSignature(self, pInputParameters, cInputParameters, ppInputNode);

fn Win32_HRESULT IFunctionLinkingGraph.setOutputSignature(
    &self,
    ParameterDesc* pOutputParameters,
    uint cOutputParameters,
    ILinkingNode** ppOutputNode
) @inline =>
    self.vtbl.setOutputSignature(self, pOutputParameters, cOutputParameters, ppOutputNode);

fn Win32_HRESULT IFunctionLinkingGraph.callFunction(
    &self,
    ZString pModuleInstanceNamespace,
    IModule* pModuleWithFunctionPrototype,
    ZString pFunctionName,
    ILinkingNode** ppCallNode
) @inline =>
    self.vtbl.callFunction(
        self,
        pModuleInstanceNamespace,
        pModuleWithFunctionPrototype,
        pFunctionName,
        ppCallNode
    );

fn Win32_HRESULT IFunctionLinkingGraph.passValue(
    &self,
    ILinkingNode* pSrcNode,
    int srcParameterIndex,
    ILinkingNode* pDstNode,
    int dstParameterIndex
) @inline =>
    self.vtbl.passValue(self, pSrcNode, srcParameterIndex, pDstNode, dstParameterIndex);

fn Win32_HRESULT IFunctionLinkingGraph.passValueWithSwizzle(
    &self,
    ILinkingNode* pSrcNode,
    int srcParameterIndex,
    ZString pSrcSwizzle,
    ILinkingNode* pDstNode,
    int dstParameterIndex,
    ZString pDstSwizzle
) @inline =>
    self.vtbl.passValueWithSwizzle(
        self,
        pSrcNode,
        srcParameterIndex,
        pSrcSwizzle,
        pDstNode,
        dstParameterIndex,
        pDstSwizzle
    );

fn Win32_HRESULT IFunctionLinkingGraph.getLastError(
    &self,
    ID3DBlob** ppErrorBuffer
) @inline =>
    self.vtbl.getLastError(self, ppErrorBuffer);

fn Win32_HRESULT IFunctionLinkingGraph.generateHlsl(
    &self,
    uint uFlags,
    ID3DBlob** ppBuffer
) @inline =>
    self.vtbl.generateHlsl(self, uFlags, ppBuffer);
