module directx::d3d12;

import std::os::win32;
import directx::dxgi;

// =============================================================================
// IDebug
// =============================================================================

const IDEBUG_UUID_STRING = "344488b7-6846-474b-b989-f027448245e0";
const Win32_GUID IDEBUG_UUID = {
    0x344488b7, 0x6846, 0x474b, { 0xb9, 0x89, 0xf0, 0x27, 0x44, 0x82, 0x45, 0xe0 } };

struct IDebug
{
    IDebugVTable* vtbl;
}

typedef IDebug3 = inline IDebug;
const IDEBUG3_UUID_STRING = "5cf4e58f-f671-4ff1-a542-3686e3d153d1";
const Win32_GUID IDEBUG3_UUID = {
    0x5cf4e58f, 0xf671, 0x4ff1, { 0xa5, 0x42, 0x36, 0x86, 0xe3, 0xd1, 0x53, 0xd1 } };

typedef IDebug4 = inline IDebug;
const IDEBUG4_UUID_STRING = "014b816e-9ec5-4a2f-a845-ffbe441ce13a";
const Win32_GUID IDEBUG4_UUID = {
    0x014b816e, 0x9ec5, 0x4a2f, { 0xa8, 0x45, 0xff, 0xbe, 0x44, 0x1c, 0xe1, 0x3a } };

typedef IDebug5 = inline IDebug;
const IDEBUG5_UUID_STRING = "548d6b12-09fa-40e0-9069-5dcd589a52c9";
const Win32_GUID IDEBUG5_UUID = {
    0x548d6b12, 0x09fa, 0x40e0, { 0x90, 0x69, 0x5d, 0xcd, 0x58, 0x9a, 0x52, 0xc9 } };

typedef IDebug6 = inline IDebug;
const IDEBUG6_UUID_STRING = "82a816d6-5d01-4157-97d0-4975463fd1ed";
const Win32_GUID IDEBUG6_UUID = {
    0x82a816d6, 0x5d01, 0x4157, { 0x97, 0xd0, 0x49, 0x75, 0x46, 0x3f, 0xd1, 0xed } };

// Function pointers of IDebug

alias IDebug_EnableDebugLayerFn = fn void (void* self);

// Function pointers of IDebug3

alias IDebug3_SetEnableGPUBasedValidationFn = fn void (
    void* self,
    Bool enable);

alias IDebug3_SetEnableSynchronizedCommandQueueValidationFn = fn void (
    void* self,
    Bool enable);

alias IDebug3_SetGPUBasedValidationFlagsFn = fn void (
    void* self,
    GpuBasedValidationFlags flags);

// Function pointers of IDebug4

alias IDebug4_DisableDebugLayerFn = fn void (void* self);

// Function pointers of IDebug5

alias IDebug5_SetEnableAutoNameFn = fn void (
    void* self,
    Bool enable);

// Function pointers of IDebug6

alias IDebug6_SetForceLegacyBarrierValidationFn = fn void (
    void* self,
    Bool enable);

struct IDebugVTable
{
    inline IUnknownVTable _base;

    // IDebug
    IDebug_EnableDebugLayerFn enableDebugLayer;

    // IDebug3
    IDebug3_SetEnableGPUBasedValidationFn setEnableGPUBasedValidation;
    IDebug3_SetEnableSynchronizedCommandQueueValidationFn
        setEnableSynchronizedCommandQueueValidation;
    IDebug3_SetGPUBasedValidationFlagsFn setGPUBasedValidationFlags;

    // IDebug4
    IDebug4_DisableDebugLayerFn disableDebugLayer;

    // IDebug5
    IDebug5_SetEnableAutoNameFn setEnableAutoName;

    // IDebug6
    IDebug6_SetForceLegacyBarrierValidationFn setForceLegacyBarrierValidation;
}

// Functions of IUnknown

fn Win32_HRESULT IDebug.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDebug.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDebug.release(&self) @inline => self.vtbl.release(self);

// Functions of IDebug

fn void IDebug.enableDebugLayer(&self) @inline => self.vtbl.enableDebugLayer(self);

// Function of IDebug3

fn void IDebug.setEnableGPUBasedValidation(
    &self,
    Bool enable
) @inline =>
    self.vtbl.setEnableGPUBasedValidation(self, enable);

fn void IDebug.setEnableSynchronizedCommandQueueValidation(
    &self,
    Bool enable
) @inline =>
    self.vtbl.setEnableSynchronizedCommandQueueValidation(self, enable);

fn void IDebug.setGPUBasedValidationFlags(
    &self,
    GpuBasedValidationFlags flags
) @inline =>
    self.vtbl.setGPUBasedValidationFlags(self, flags);

// Function of IDebug4

fn void IDebug.disableDebugLayer(&self) @inline =>
    self.vtbl.disableDebugLayer(self);

// Function of IDebug5

fn void IDebug.setEnableAutoName(
    &self,
    Bool enable
) @inline =>
    self.vtbl.setEnableAutoName(self, enable);

// Function of IDebug6

fn void IDebug.setForceLegacyBarrierValidation(
    &self,
    Bool enable
) @inline =>
    self.vtbl.setForceLegacyBarrierValidation(self, enable);

// ---

bitstruct GpuBasedValidationFlags : uint
{
    bool disableStateTracking : 0;
    uint __unused0            : 1..31;
}

const GpuBasedValidationFlags GPU_BASED_VALIDATION_FLAGS_NONE = {};

// =============================================================================
// IDebug1
// =============================================================================

const IDEBUG1_UUID_STRING = "affaa4ca-63fe-4d8e-b8ad-159000af4304";
const Win32_GUID IDEBUG1_UUID = {
    0xaffaa4ca, 0x63fe, 0x4d8e, { 0xb8, 0xad, 0x15, 0x90, 0x00, 0xaf, 0x43, 0x04 } };

struct IDebug1
{
    IDebug1VTable* vtbl;
}

// Function pointers of IDebug1

alias IDebug1_EnableDebugLayerFn = fn void (void* self);

alias IDebug1_SetEnableGPUBasedValidationFn = fn void (
    void* self,
    Bool enable);

alias IDebug1_SetenableSynchronizedCommandQueueValidationFn = fn void (
    void* self,
    Bool enable);

struct IDebug1VTable
{
    inline IUnknownVTable _base;
    IDebug1_EnableDebugLayerFn enableDebugLayer;
    IDebug1_SetEnableGPUBasedValidationFn setEnableGPUBasedValidation;
    IDebug1_SetenableSynchronizedCommandQueueValidationFn setenableSynchronizedCommandQueueValidation;
}

// Functions of IUnknown

fn Win32_HRESULT IDebug1.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDebug1.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDebug1.release(&self) @inline => self.vtbl.release(self);

// Functions of IDebug1

fn void IDebug1.enableDebugLayer(&self) @inline =>
    self.vtbl.enableDebugLayer(self);

fn void IDebug1.setEnableGPUBasedValidation(
    &self,
    Bool enable
) @inline =>
    self.vtbl.setEnableGPUBasedValidation(self, enable);

fn void IDebug1.setenableSynchronizedCommandQueueValidation(
    &self,
    Bool enable
) @inline =>
    self.vtbl.setenableSynchronizedCommandQueueValidation(self, enable);

// =============================================================================
// IDebug2
// =============================================================================

const IDEBUG2_UUID_STRING = "93a665c4-a3b2-4e5d-b692-a26ae14e3374";
const Win32_GUID IDEBUG2_UUID = {
    0x93a665c4, 0xa3b2, 0x4e5d, { 0xb6, 0x92, 0xa2, 0x6a, 0xe1, 0x4e, 0x33, 0x74 } };

struct IDebug2
{
    IDebug2VTable* vtbl;
}

// Function pointers of IDebug2

alias IDebug2_SetGPUBasedValidationFlagsFn = fn void (
    void* self,
    GpuBasedValidationFlags flags);

struct IDebug2VTable
{
    inline IUnknownVTable _base;
    IDebug2_SetGPUBasedValidationFlagsFn setGPUBasedValidationFlags;
}

// Functions of IUnknown

fn Win32_HRESULT IDebug2.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDebug2.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDebug2.release(&self) @inline => self.vtbl.release(self);

// Function of IDebug2

fn void IDebug2.setGPUBasedValidationFlags(
    &self,
    GpuBasedValidationFlags flags
) @inline =>
    self.vtbl.setGPUBasedValidationFlags(self, flags);

// ---

const Win32_GUID WKPDID_AUTO_DEBUG_OBJECT_NAMEW = {
    0xd4902e36, 0x757a, 0x4942, { 0x95, 0x94, 0xb6, 0x76, 0x9a, 0xfa, 0x43, 0xcd } };

bitstruct RldoFlags : uint
{
    bool summary : 0;
    bool detail : 1;
    bool ignoreInternal : 2;
    uint __unused0 : 3..31;
}

enum DebugDeviceParameterType : int
{
    FEATURE_FLAGS,
    GPU_BASED_VALIDATION_SETTINGS,
    GPU_SLOWDOWN_PERFORMANCE_FACTOR,
}

bitstruct DebugFeature : uint
{
    bool allowBehaviorChangingDebugAids      : 0;
    bool conservativeResourceStateTracking   : 1;
    bool disableVirtualizedBundlesValidation : 2;
    bool emulateWindows7                     : 3;
    uint __unused0                           : 4..31;
}

enum GpuBasedValidationShaderPatchMode : int
{
    NONE,
    STATE_TRACKING_ONLY,
    UNGUARDED_VALIDATION,
    GUARDED_VALIDATION,
}

const NUM_GPU_BASED_VALIDATION_SHADER_PATCH_MODES = GpuBasedValidationShaderPatchMode.len;

bitstruct GpuBasedValidationPipelineStateCreateFlags : uint
{
    bool frontLoadCreateTrackingOnlyShaders : 0;
    bool frontLoadCreateUnguardedValidationShaders : 1;
    bool frontLoadCreateGuardedValidationShaders : 2;
    uint __unused0 : 3..31;
}

const GpuBasedValidationPipelineStateCreateFlags
 GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS_NONE = {};

const GpuBasedValidationPipelineStateCreateFlags
 GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS_VALID_MASK = {
    .frontLoadCreateTrackingOnlyShaders,
    .frontLoadCreateUnguardedValidationShaders,
    .frontLoadCreateGuardedValidationShaders,
 };

struct DebugDeviceGpuBasedValidationSettings
{
    uint maxMessagesPerCommandList;
    GpuBasedValidationShaderPatchMode defaultShaderPatchMode;
    GpuBasedValidationPipelineStateCreateFlags pipelineStateCreateFlags;
}

struct DebugDeviceGpuSlowdownPerformanceFactor
{
    float slowdownFactor;
}

// =============================================================================
// IDebugDevice
// =============================================================================

const IDEBUG_DEVICE_UUID_STRING = "3febd6dd-4973-4787-8194-e45f9e28923e";
const Win32_GUID IDEBUG_DEVICE_UUID = {
    0x3febd6dd, 0x4973, 0x4787, { 0x81, 0x94, 0xe4, 0x5f, 0x9e, 0x28, 0x92, 0x3e } };

struct IDebugDevice
{
    IDebugDeviceVTable* vtbl;
}

typedef IDebugDevice2 = inline IDebugDevice;
const IDEBUG_DEVICE2_UUID_STRING = "60eccbc1-378d-4df1-894c-f8ac5ce4d7dd";
const Win32_GUID IDEBUG_DEVICE2_UUID = {
    0x60eccbc1, 0x378d, 0x4df1, { 0x89, 0x4c, 0xf8, 0xac, 0x5c, 0xe4, 0xd7, 0xdd } };

// Function pointers of IDebugDevice

alias IDebugDevice_SetFeatureMaskFn = fn Win32_HRESULT (
    void* self,
    DebugFeature mask);

alias IDebugDevice_GetFeatureMaskFn = fn DebugFeature (void* self);

alias IDebugDevice_ReportLiveDeviceObjectsFn = fn Win32_HRESULT (
    void* self,
    RldoFlags flags);

// Function pointers of IDebugDevice2

alias IDebugDevice2_SetDebugParameterFn = fn Win32_HRESULT (
    void* self,
    DebugDeviceParameterType type,
    void*  pData,
    uint dataSize);

alias IDebugDevice2_GetDebugParameterFn = fn Win32_HRESULT (
    void* self,
    DebugDeviceParameterType type,
    void* pData,
    uint dataSize);

struct IDebugDeviceVTable
{
    inline IUnknownVTable _base;

    // IDebugDevice
    IDebugDevice_SetFeatureMaskFn setFeatureMask;
    IDebugDevice_GetFeatureMaskFn getFeatureMask;
    IDebugDevice_ReportLiveDeviceObjectsFn reportLiveDeviceObjects;

    // IDebugDevice2
    IDebugDevice2_SetDebugParameterFn setDebugParameter;
    IDebugDevice2_GetDebugParameterFn getDebugParameter;
}

// Function pointers of IUnknown

fn Win32_HRESULT IDebugDevice.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDebugDevice.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDebugDevice.release(&self) @inline => self.vtbl.release(self);

// Function pointers of IDebugDevice

fn Win32_HRESULT IDebugDevice.setFeatureMask(
    &self,
    DebugFeature mask
) @inline =>
    self.vtbl.setFeatureMask(self, mask);

fn DebugFeature IDebugDevice.getFeatureMask(&self) @inline =>
    self.vtbl.getFeatureMask(self);

fn Win32_HRESULT IDebugDevice.reportLiveDeviceObjects(
    &self,
    RldoFlags flags
) @inline =>
    self.vtbl.reportLiveDeviceObjects(self, flags);

// Function pointers of IDebugDevice2

fn Win32_HRESULT IDebugDevice2.setDebugParameter(
    &self,
    DebugDeviceParameterType type,
    void*  pData,
    uint dataSize
) @inline =>
    self.vtbl.setDebugParameter(self, type, pData, dataSize);

fn Win32_HRESULT IDebugDevice2.getDebugParameter(
    &self,
    DebugDeviceParameterType type,
    void* pData,
    uint dataSize
) @inline =>
    self.vtbl.getDebugParameter(self, type, pData, dataSize);

// =============================================================================
// IDebugDevice1
// =============================================================================

const IDEBUG_DEVICE1_UUID_STRING = "a9b71770-d099-4a65-a698-3dee10020f88";
const Win32_GUID IDEBUG_DEVICE1_UUID = {
    0xa9b71770, 0xd099, 0x4a65, { 0xa6, 0x98, 0x3d, 0xee, 0x10, 0x02, 0x0f, 0x88 } };

struct IDebugDevice1
{
    IDebugDevice1VTable* vtbl;
}

// Function pointers of IDebugDevice1

alias IDebugDevice1_SetDebugParameterFn = fn Win32_HRESULT (
    void* self,
    DebugDeviceParameterType type,
    void* pData,
    uint dataSize);

alias IDebugDevice1_GetDebugParameterFn = fn Win32_HRESULT (
    void* self,
    DebugDeviceParameterType type,
    void* pData,
    uint dataSize);

alias IDebugDevice1_ReportLiveDeviceObjectsFn = fn Win32_HRESULT (
    void* self,
    RldoFlags flags);

struct IDebugDevice1VTable
{
    inline IUnknownVTable _base;
    IDebugDevice1_SetDebugParameterFn setDebugParameter;
    IDebugDevice1_GetDebugParameterFn getDebugParameter;
    IDebugDevice1_ReportLiveDeviceObjectsFn reportLiveDeviceObjects;
}

// Function of IUnknown

fn Win32_HRESULT IDebugDevice1.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDebugDevice1.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDebugDevice1.release(&self) @inline => self.vtbl.release(self);

// Function of IDebugDevice1

fn Win32_HRESULT IDebugDevice1.setDebugParameter(
    &self,
    DebugDeviceParameterType type,
    void* pData,
    uint dataSize
) @inline =>
    self.vtbl.setDebugParameter(self, type, pData, dataSize);

fn Win32_HRESULT IDebugDevice1.getDebugParameter(
    &self,
    DebugDeviceParameterType type,
    void* pData,
    uint dataSize
) @inline =>
    self.vtbl.getDebugParameter(self, type, pData, dataSize);

fn Win32_HRESULT IDebugDevice1.reportLiveDeviceObjects(
    &self,
    RldoFlags flags
) @inline =>
    self.vtbl.reportLiveDeviceObjects(self, flags);

// ---

const Win32_GUID DXGI_DEBUG_D3D12 = {
    0xcf59a98c, 0xa950, 0x4326, { 0x91, 0xef, 0x9b, 0xba, 0xa1, 0x7b, 0xfd, 0x95 } };

// =============================================================================
// IDebugCommandQueue
// =============================================================================

const IDEBUG_COMMAND_QUEUE_UUID_STRING = "09e0bf36-54ac-484f-8847-4baeeab6053a";
const Win32_GUID IDEBUG_COMMAND_QUEUE_UUID = {
    0x09e0bf36, 0x54ac, 0x484f, { 0x88, 0x47, 0x4b, 0xae, 0xea, 0xb6, 0x05, 0x3a } };

struct IDebugCommandQueue
{
    IDebugCommandQueueVTable* vtbl;
}

typedef IDebugCommandQueue1 = inline IDebugCommandQueue;
const IDEBUG_COMMAND_QUEUE1_UUID_STRING = "16be35a2-bfd6-49f2-bcae-eaae4aff862d";
const Win32_GUID IDEBUG_COMMAND_QUEUE1_UUID = {
    0x16be35a2, 0xbfd6, 0x49f2, { 0xbc, 0xae, 0xea, 0xae, 0x4a, 0xff, 0x86, 0x2d } };

// Function pointers of IDebugCommandQueue

alias IDebugCommandQueue_AssertResourceStateFn = fn Bool (
    void* self,
    IResource* pResource,
    uint subresource,
    uint state);

// Function pointers of IDebugCommandQueue1

alias IDebugCommandQueue1_AssertResourceAccessFn = fn void (
    void* self,
    IResource* pResource,
    uint subresource,
    BarrierAccess access);

alias IDebugCommandQueue1_AssertTextureLayoutFn = fn void (
    void* self,
    IResource* pResource,
    uint subresource,
    BarrierLayout layout);

struct IDebugCommandQueueVTable
{
    inline IUnknownVTable _base;

    // IDebugCommandQueue
    IDebugCommandQueue_AssertResourceStateFn assertResourceState;

    // IDebugCommandQueue1
    IDebugCommandQueue1_AssertResourceAccessFn assertResourceAccess;
    IDebugCommandQueue1_AssertTextureLayoutFn assertTextureLayout;
}

// Function of IUnknown

fn Win32_HRESULT IDebugCommandQueue.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDebugCommandQueue.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDebugCommandQueue.release(&self) @inline => self.vtbl.release(self);

// Function of IDebugCommandQueue

fn Bool IDebugCommandQueue.assertResourceState(
    &self,
    IResource* pResource,
    uint subresource,
    uint state
) @inline =>
    self.vtbl.assertResourceState(self, pResource, subresource, state);

// Function of IDebugCommandQueue1

fn void IDebugCommandQueue.assertResourceAccess(
    &self,
    IResource* pResource,
    uint subresource,
    BarrierAccess access
) @inline =>
    self.vtbl.assertResourceAccess(self, pResource, subresource, access);

fn void IDebugCommandQueue.assertTextureLayout(
    &self,
    IResource* pResource,
    uint subresource,
    BarrierLayout layout
) @inline =>
    self.vtbl.assertTextureLayout(self, pResource, subresource, layout);

// ---

enum DebugCommandListParameterType : int
{
    GPU_BASED_VALIDATION_SETTINGS,
}

struct DebugCommandListGpuBasedValidationSettings
{
    GpuBasedValidationShaderPatchMode shaderPatchMode;
}

// =============================================================================
// IDebugCommandList1
// =============================================================================

const IDEBUG_COMMAND_LIST1_UUID_STRING = "102ca951-311b-4b01-b11f-ecb83e061b37";
const Win32_GUID IDEBUG_COMMAND_LIST1_UUID = {
    0x102ca951, 0x311b, 0x4b01, { 0xb1, 0x1f, 0xec, 0xb8, 0x3e, 0x06, 0x1b, 0x37 } };

struct IDebugCommandList1
{
    IDebugCommandList1VTable* vtbl;
}

// Function pointers of IDebugCommandList1

alias IDebugCommandList1_GetFeatureMaskFn = fn DebugFeature (void* self);

alias IDebugCommandList1_AssertResourceStateFn = fn Bool (
    void* self,
    IResource* pResource,
    uint subresource,
    uint state);

alias IDebugCommandList1_SetDebugParameterFn = fn Win32_HRESULT (
    void* self,
    DebugCommandListParameterType type,
    void* pData,
    uint dataSize);

alias IDebugCommandList1_GetDebugParameterFn = fn Win32_HRESULT (
    void* self,
    DebugCommandListParameterType type,
    void* pData,
    uint dataSize);

struct IDebugCommandList1VTable
{
    inline IUnknownVTable _base;
    IDebugCommandList1_GetFeatureMaskFn getFeatureMask;
    IDebugCommandList1_AssertResourceStateFn assertResourceState;
    IDebugCommandList1_SetDebugParameterFn setDebugParameter;
    IDebugCommandList1_GetDebugParameterFn getDebugParameter;
}

// Function of IUnknown

fn Win32_HRESULT IDebugCommandList1.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDebugCommandList1.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDebugCommandList1.release(&self) @inline => self.vtbl.release(self);

// Function of IDebugCommandList1

fn DebugFeature IDebugCommandList1.getFeatureMask(&self) @inline =>
    self.vtbl.getFeatureMask(self);

fn Bool IDebugCommandList1.assertResourceState(
    &self,
    IResource* pResource,
    uint subresource,
    uint state
) @inline =>
    self.vtbl.assertResourceState(self, pResource, subresource, state);

fn Win32_HRESULT IDebugCommandList1.setDebugParameter(
    &self,
    DebugCommandListParameterType type,
    void* pData,
    uint dataSize
) @inline =>
    self.vtbl.setDebugParameter(self, type, pData, dataSize);

fn Win32_HRESULT IDebugCommandList1.getDebugParameter(
    &self,
    DebugCommandListParameterType type,
    void* pData,
    uint dataSize
) @inline =>
    self.vtbl.getDebugParameter(self, type, pData, dataSize);

// =============================================================================
// IDebugCommandList
// =============================================================================

const IDEBUG_COMMAND_LIST_UUID_STRING = "09e0bf36-54ac-484f-8847-4baeeab6053f";
const Win32_GUID IDEBUG_COMMAND_LIST_UUID = {
    0x09e0bf36, 0x54ac, 0x484f, { 0x88, 0x47, 0x4b, 0xae, 0xea, 0xb6, 0x05, 0x3f } };

struct IDebugCommandList
{
    IDebugCommandListVTable* vtbl;
}

typedef IDebugCommandList2 = inline IDebugCommandList;
const IDEBUG_COMMAND_LIST2_UUID_STRING = "aeb575cf-4e06-48be-ba3b-c450fc96652e";
const Win32_GUID IDEBUG_COMMAND_LIST2_UUID = {
    0xaeb575cf, 0x4e06, 0x48be, { 0xba, 0x3b, 0xc4, 0x50, 0xfc, 0x96, 0x65, 0x2e } };

typedef IDebugCommandList3 = inline IDebugCommandList;
const IDEBUG_COMMAND_LIST3_UUID_STRING = "197d5e15-4d37-4d34-af78-724cd70fdb1f";
const Win32_GUID IDEBUG_COMMAND_LIST3_UUID = {
    0x197d5e15, 0x4d37, 0x4d34, { 0xaf, 0x78, 0x72, 0x4c, 0xd7, 0x0f, 0xdb, 0x1f } };

// Function pointers of IDebugCommandList

alias IDebugCommandList_AssertResourceStateFn = fn Bool (
    void* self,
    IResource* pResource,
    uint subresource,
    uint state);

alias IDebugCommandList_SetFeatureMaskFn = fn Win32_HRESULT (
    void* self,
    DebugFeature mask);

// Function pointers of IDebugCommandList2

alias IDebugCommandList2_SetDebugParameterFn = fn Win32_HRESULT (
    void* self,
    DebugCommandListParameterType type,
    void* pData,
    uint dataSize);

alias IDebugCommandList2_GetDebugParameterFn = fn Win32_HRESULT (
    void* self,
    DebugCommandListParameterType type,
    void* pData,
    uint dataSize);

// Function pointers of IDebugCommandList3

alias IDebugCommandList3_AssertResourceAccessFn = fn void (
    void* self,
    IResource* pResource,
    uint subresource,
    BarrierAccess access);

alias IDebugCommandList3_AssertTextureLayoutFn = fn void (
    void* self,
    IResource* pResource,
    uint subresource,
    BarrierLayout layout);

struct IDebugCommandListVTable
{
    inline IUnknownVTable _base;

    // IDebugCommandList
    IDebugCommandList_AssertResourceStateFn assertResourceState;
    IDebugCommandList_SetFeatureMaskFn setFeatureMask;

    // IDebugCommandList2
    IDebugCommandList2_SetDebugParameterFn setDebugParameter;
    IDebugCommandList2_GetDebugParameterFn getDebugParameter;

    // IDebugCommandList3
    IDebugCommandList3_AssertResourceAccessFn assertResourceAccess;
    IDebugCommandList3_AssertTextureLayoutFn assertTextureLayout;
}

// Function of IUnknown

fn Win32_HRESULT IDebugCommandList.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IDebugCommandList.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IDebugCommandList.release(&self) @inline => self.vtbl.release(self);

// Function of IDebugCommandList

fn Bool IDebugCommandList.assertResourceState(
    &self,
    IResource* pResource,
    uint subresource,
    uint state
) @inline =>
    self.vtbl.assertResourceState(self, pResource, subresource, state);

fn Win32_HRESULT IDebugCommandList.setFeatureMask(
    &self,
    DebugFeature mask
) @inline =>
    self.vtbl.setFeatureMask(self, mask);

// Function of IDebugCommandList2

fn Win32_HRESULT IDebugCommandList.setDebugParameter(
    &self,
    DebugCommandListParameterType type,
    void* pData,
    uint dataSize
) @inline =>
    self.vtbl.setDebugParameter(self, type, pData, dataSize);

fn Win32_HRESULT IDebugCommandList.getDebugParameter(
    &self,
    DebugCommandListParameterType type,
    void* pData,
    uint dataSize
) @inline =>
    self.vtbl.getDebugParameter(self, type, pData, dataSize);

// Function of IDebugCommandList3

fn void IDebugCommandList.assertResourceAccess(
    &self,
    IResource* pResource,
    uint subresource,
    BarrierAccess access
) @inline =>
    self.vtbl.assertResourceAccess(self, pResource, subresource, access);

fn void IDebugCommandList.assertTextureLayout(
    &self,
    IResource* pResource,
    uint subresource,
    BarrierLayout layout
) @inline =>
    self.vtbl.assertTextureLayout(self, pResource, subresource, layout);

// =============================================================================
// ISharingContract
// =============================================================================

struct ISharingContract
{
    ISharingContractVTable* vtbl;
}

const ISHARING_CONTRACT_UUID_STRING = "0adf7d52-929c-4e61-addb-ffed30de66ef";
const Win32_GUID ISHARING_CONTRACT_UUID = {
    0x0adf7d52, 0x929c, 0x4e61, { 0xad, 0xdb, 0xff, 0xed, 0x30, 0xde, 0x66, 0xef } };

alias ISharingContract_PresentFn = fn void (
    void* self,
    IResource* pResource,
    uint subresource,
    Win32_HWND window);

alias ISharingContract_SharedFenceSignalFn = fn void (
    void* self,
    IFence* pFence,
    ulong fenceValue);

alias ISharingContract_BeginCapturableWorkFn = fn void (
    void* self,
    Win32_GUID* guid);

alias ISharingContract_EndCapturableWorkFn = fn void (
    void* self,
    Win32_GUID* guid);

struct ISharingContractVTable
{
    inline IUnknownVTable _base;
    ISharingContract_PresentFn present;
    ISharingContract_SharedFenceSignalFn sharedFenceSignal;
    ISharingContract_BeginCapturableWorkFn beginCapturableWork;
    ISharingContract_EndCapturableWorkFn endCapturableWork;
}

// Functions of IUnknown

fn Win32_HRESULT ISharingContract.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD ISharingContract.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD ISharingContract.release(&self) @inline => self.vtbl.release(self);

// Functions of ISharingContract

fn void ISharingContract.present(
    &self,
    IResource* pResource,
    uint subresource,
    Win32_HWND window
) @inline =>
    self.vtbl.present(self,pResource, subresource, window);

fn void ISharingContract.sharedFenceSignal(
    &self,
    IFence* pFence,
    ulong fenceValue
) @inline =>
    self.vtbl.sharedFenceSignal(self, pFence, fenceValue);

fn void ISharingContract.beginCapturableWork(
    &self,
    Win32_GUID* guid
) @inline =>
    self.vtbl.beginCapturableWork(self, guid);

fn void ISharingContract.endCapturableWork(
    &self,
    Win32_GUID* guid
) @inline =>
    self.vtbl.endCapturableWork(self, guid);

// =============================================================================
// IManualWriteTrackingResource
// =============================================================================

const IMANUAL_WRITE_TRACKING_RESOURCE_UUID_STRING = "86ca3b85-49ad-4b6e-aed5-eddb18540f41";
const Win32_GUID IMANUAL_WRITE_TRACKING_RESOURCE_UUID = {
    0x86ca3b85, 0x49ad, 0x4b6e, { 0xae, 0xd5, 0xed, 0xdb, 0x18, 0x54, 0x0f, 0x41 } };

struct IManualWriteTrackingResource
{
    IManualWriteTrackingResourceVTable* vtbl;
}

alias IManualWriteTrackingResource_TrackWriteFn = fn void (
    void* self,
    uint subresource,
    Range* pWrittenRange);

struct IManualWriteTrackingResourceVTable
{
    inline IUnknownVTable _base;
    IManualWriteTrackingResource_TrackWriteFn trackWrite;
}

// Functions of IUnknown

fn Win32_HRESULT IManualWriteTrackingResource.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IManualWriteTrackingResource.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IManualWriteTrackingResource.release(&self) @inline => self.vtbl.release(self);

// Functions of IManualWriteTrackingResource

fn void IManualWriteTrackingResource.trackWrite(
    &self,
    uint subresource,
    Range* pWrittenRange
) @inline =>
    self.vtbl.trackWrite(self, subresource, pWrittenRange);

// ---

enum MessageCategory : int
{
    APPLICATION_DEFINED,
    MISCELLANEOUS,
    INITIALIZATION,
    CLEANUP,
    COMPILATION,
    STATE_CREATION,
    STATE_SETTING,
    STATE_GETTING,
    RESOURCE_MANIPULATION,
    EXECUTION,
    SHADER,
}

enum MessageSeverity : int
{
    CORRUPTION,
    ERROR,
    WARNING,
    INFO,
    MESSAGE,
}

enum MessageId : int
{
    UNKNOWN,
    STRING_FROM_APPLICATION,
    CORRUPTED_THIS,
    CORRUPTED_PARAMETER1,
    CORRUPTED_PARAMETER2,
    CORRUPTED_PARAMETER3,
    CORRUPTED_PARAMETER4,
    CORRUPTED_PARAMETER5,
    CORRUPTED_PARAMETER6,
    CORRUPTED_PARAMETER7,
    CORRUPTED_PARAMETER8,
    CORRUPTED_PARAMETER9,
    CORRUPTED_PARAMETER10,
    CORRUPTED_PARAMETER11,
    CORRUPTED_PARAMETER12,
    CORRUPTED_PARAMETER13,
    CORRUPTED_PARAMETER14,
    CORRUPTED_PARAMETER15,
    CORRUPTED_MULTITHREADING,
    MESSAGE_REPORTING_OUTOFMEMORY,
    GETPRIVATEDATA_MOREDATA,
    SETPRIVATEDATA_INVALIDFREEDATA,
    __UNUSED_0, // 22
    __UNUSED_1, // 23
    SETPRIVATEDATA_CHANGINGPARAMS,
    SETPRIVATEDATA_OUTOFMEMORY,
    CREATESHADERRESOURCEVIEW_UNRECOGNIZEDFORMAT,
    CREATESHADERRESOURCEVIEW_INVALIDDESC,
    CREATESHADERRESOURCEVIEW_INVALIDFORMAT,
    CREATESHADERRESOURCEVIEW_INVALIDVIDEOPLANESLICE,
    CREATESHADERRESOURCEVIEW_INVALIDPLANESLICE,
    CREATESHADERRESOURCEVIEW_INVALIDDIMENSIONS,
    CREATESHADERRESOURCEVIEW_INVALIDRESOURCE,
    __UNUSED_2, // 32
    __UNUSED_3, // 33
    __UNUSED_4, // 34
    CREATERENDERTARGETVIEW_UNRECOGNIZEDFORMAT,
    CREATERENDERTARGETVIEW_UNSUPPORTEDFORMAT,
    CREATERENDERTARGETVIEW_INVALIDDESC,
    CREATERENDERTARGETVIEW_INVALIDFORMAT,
    CREATERENDERTARGETVIEW_INVALIDVIDEOPLANESLICE,
    CREATERENDERTARGETVIEW_INVALIDPLANESLICE,
    CREATERENDERTARGETVIEW_INVALIDDIMENSIONS,
    CREATERENDERTARGETVIEW_INVALIDRESOURCE,
    __UNUSED_5, // 43
    __UNUSED_6, // 44
    CREATEDEPTHSTENCILVIEW_UNRECOGNIZEDFORMAT,
    CREATEDEPTHSTENCILVIEW_INVALIDDESC,
    CREATEDEPTHSTENCILVIEW_INVALIDFORMAT,
    CREATEDEPTHSTENCILVIEW_INVALIDDIMENSIONS,
    CREATEDEPTHSTENCILVIEW_INVALIDRESOURCE,
    __UNUSED_7, // 50
    __UNUSED_8, // 51
    CREATEINPUTLAYOUT_OUTOFMEMORY,
    CREATEINPUTLAYOUT_TOOMANYELEMENTS,
    CREATEINPUTLAYOUT_INVALIDFORMAT,
    CREATEINPUTLAYOUT_INCOMPATIBLEFORMAT,
    CREATEINPUTLAYOUT_INVALIDSLOT,
    CREATEINPUTLAYOUT_INVALIDINPUTSLOTCLASS,
    CREATEINPUTLAYOUT_STEPRATESLOTCLASSMISMATCH,
    CREATEINPUTLAYOUT_INVALIDSLOTCLASSCHANGE,
    CREATEINPUTLAYOUT_INVALIDSTEPRATECHANGE,
    CREATEINPUTLAYOUT_INVALIDALIGNMENT,
    CREATEINPUTLAYOUT_DUPLICATESEMANTIC,
    CREATEINPUTLAYOUT_UNPARSEABLEINPUTSIGNATURE,
    CREATEINPUTLAYOUT_NULLSEMANTIC,
    CREATEINPUTLAYOUT_MISSINGELEMENT,
    CREATEVERTEXSHADER_OUTOFMEMORY,
    CREATEVERTEXSHADER_INVALIDSHADERBYTECODE,
    CREATEVERTEXSHADER_INVALIDSHADERTYPE,
    CREATEGEOMETRYSHADER_OUTOFMEMORY,
    CREATEGEOMETRYSHADER_INVALIDSHADERBYTECODE,
    CREATEGEOMETRYSHADER_INVALIDSHADERTYPE,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTOFMEMORY,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSHADERBYTECODE,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSHADERTYPE,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDNUMENTRIES,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTPUTSTREAMSTRIDEUNUSED,
    __UNUSED_9, // 77
    __UNUSED_10, // 78
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTPUTSLOT0EXPECTED,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDOUTPUTSLOT,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_ONLYONEELEMENTPERSLOT,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDCOMPONENTCOUNT,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTARTCOMPONENTANDCOMPONENTCOUNT,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDGAPDEFINITION,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_REPEATEDOUTPUT,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDOUTPUTSTREAMSTRIDE,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MISSINGSEMANTIC,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MASKMISMATCH,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_CANTHAVEONLYGAPS,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DECLTOOCOMPLEX,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MISSINGOUTPUTSIGNATURE,
    CREATEPIXELSHADER_OUTOFMEMORY,
    CREATEPIXELSHADER_INVALIDSHADERBYTECODE,
    CREATEPIXELSHADER_INVALIDSHADERTYPE,
    CREATERASTERIZERSTATE_INVALIDFILLMODE,
    CREATERASTERIZERSTATE_INVALIDCULLMODE,
    CREATERASTERIZERSTATE_INVALIDDEPTHBIASCLAMP,
    CREATERASTERIZERSTATE_INVALIDSLOPESCALEDDEPTHBIAS,
    __UNUSED_11, // 99
    CREATEDEPTHSTENCILSTATE_INVALIDDEPTHWRITEMASK,
    CREATEDEPTHSTENCILSTATE_INVALIDDEPTHFUNC,
    CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILFAILOP,
    CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILZFAILOP,
    CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILPASSOP,
    CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILFUNC,
    CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILFAILOP,
    CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILZFAILOP,
    CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILPASSOP,
    CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILFUNC,
    __UNUSED_12, // 110
    CREATEBLENDSTATE_INVALIDSRCBLEND,
    CREATEBLENDSTATE_INVALIDDESTBLEND,
    CREATEBLENDSTATE_INVALIDBLENDOP,
    CREATEBLENDSTATE_INVALIDSRCBLENDALPHA,
    CREATEBLENDSTATE_INVALIDDESTBLENDALPHA,
    CREATEBLENDSTATE_INVALIDBLENDOPALPHA,
    CREATEBLENDSTATE_INVALIDRENDERTARGETWRITEMASK,
    GET_PROGRAM_IDENTIFIER_ERROR,
    GET_WORK_GRAPH_PROPERTIES_ERROR,
    SET_PROGRAM_ERROR,
    __UNUSED_13, // 121
    __UNUSED_14, // 122
    __UNUSED_15, // 123
    __UNUSED_16, // 124
    __UNUSED_17, // 125
    __UNUSED_18, // 126
    __UNUSED_19, // 127
    __UNUSED_20, // 128
    __UNUSED_21, // 129
    __UNUSED_22, // 130
    __UNUSED_23, // 131
    __UNUSED_24, // 132
    __UNUSED_25, // 133
    __UNUSED_26, // 134
    CLEARDEPTHSTENCILVIEW_INVALID,
    __UNUSED_27, // 136
    __UNUSED_28, // 137
    __UNUSED_29, // 138
    __UNUSED_30, // 139
    __UNUSED_31, // 140
    __UNUSED_32, // 141
    __UNUSED_33, // 142
    __UNUSED_34, // 143
    __UNUSED_35, // 144
    __UNUSED_36, // 145
    __UNUSED_37, // 146
    __UNUSED_38, // 147
    __UNUSED_39, // 148
    __UNUSED_40, // 149
    __UNUSED_41, // 150
    __UNUSED_42, // 151
    __UNUSED_43, // 152
    __UNUSED_44, // 153
    __UNUSED_45, // 154
    __UNUSED_46, // 155
    __UNUSED_47, // 156
    __UNUSED_48, // 157
    __UNUSED_49, // 158
    __UNUSED_50, // 159
    __UNUSED_51, // 160
    __UNUSED_52, // 161
    __UNUSED_53, // 162
    __UNUSED_54, // 163
    __UNUSED_55, // 164
    __UNUSED_56, // 165
    __UNUSED_57, // 166
    __UNUSED_58, // 167
    __UNUSED_59, // 168
    __UNUSED_60, // 169
    __UNUSED_61, // 170
    __UNUSED_62, // 171
    __UNUSED_63, // 172
    __UNUSED_64, // 173
    __UNUSED_65, // 174
    __UNUSED_66, // 175
    __UNUSED_67, // 176
    __UNUSED_68, // 177
    __UNUSED_69, // 178
    __UNUSED_70, // 179
    __UNUSED_71, // 180
    __UNUSED_72, // 181
    __UNUSED_73, // 182
    __UNUSED_74, // 183
    __UNUSED_75, // 184
    __UNUSED_76, // 185
    __UNUSED_77, // 186
    __UNUSED_78, // 187
    __UNUSED_79, // 188
    __UNUSED_80, // 189
    __UNUSED_81, // 190
    __UNUSED_82, // 191
    __UNUSED_83, // 192
    __UNUSED_84, // 193
    __UNUSED_85, // 194
    __UNUSED_86, // 195
    __UNUSED_87, // 196
    __UNUSED_88, // 197
    __UNUSED_89, // 198
    __UNUSED_90, // 199
    COMMAND_LIST_DRAW_ROOT_SIGNATURE_NOT_SET,
    COMMAND_LIST_DRAW_ROOT_SIGNATURE_MISMATCH,
    COMMAND_LIST_DRAW_VERTEX_BUFFER_NOT_SET,
    __UNUSED_91, // 203
    __UNUSED_92, // 204
    __UNUSED_93, // 205
    __UNUSED_94, // 206
    __UNUSED_95, // 207
    __UNUSED_96, // 208
    COMMAND_LIST_DRAW_VERTEX_BUFFER_STRIDE_TOO_SMALL,
    COMMAND_LIST_DRAW_VERTEX_BUFFER_TOO_SMALL,
    COMMAND_LIST_DRAW_INDEX_BUFFER_NOT_SET,
    COMMAND_LIST_DRAW_INDEX_BUFFER_FORMAT_INVALID,
    COMMAND_LIST_DRAW_INDEX_BUFFER_TOO_SMALL,
    __UNUSED_97, // 214
    __UNUSED_98, // 215
    __UNUSED_99, // 216
    __UNUSED_100, // 217
    __UNUSED_101, // 218
    COMMAND_LIST_DRAW_INVALID_PRIMITIVETOPOLOGY,
    __UNUSED_102, // 220
    COMMAND_LIST_DRAW_VERTEX_STRIDE_UNALIGNED,
    COMMAND_LIST_DRAW_INDEX_OFFSET_UNALIGNED,
    __UNUSED_103, // 223
    __UNUSED_104, // 224
    __UNUSED_105, // 225
    __UNUSED_106, // 226
    __UNUSED_107, // 227
    __UNUSED_108, // 228
    __UNUSED_109, // 229
    __UNUSED_110, // 230
    __UNUSED_111, // 231
    DEVICE_REMOVAL_PROCESS_AT_FAULT,
    DEVICE_REMOVAL_PROCESS_POSSIBLY_AT_FAULT,
    DEVICE_REMOVAL_PROCESS_NOT_AT_FAULT,
    __UNUSED_112, // 235
    __UNUSED_113, // 236
    __UNUSED_114, // 237
    __UNUSED_115, // 238
    CREATEINPUTLAYOUT_TRAILING_DIGIT_IN_SEMANTIC,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_TRAILING_DIGIT_IN_SEMANTIC,
    __UNUSED_116, // 241
    __UNUSED_117, // 242
    __UNUSED_118, // 243
    __UNUSED_119, // 244
    CREATEINPUTLAYOUT_TYPE_MISMATCH,
    __UNUSED_120, // 246
    __UNUSED_121, // 247
    __UNUSED_122, // 248
    __UNUSED_123, // 249
    __UNUSED_124, // 250
    __UNUSED_125, // 251
    __UNUSED_126, // 252
    CREATEINPUTLAYOUT_EMPTY_LAYOUT,
    __UNUSED_127, // 254
    LIVE_OBJECT_SUMMARY,
    __UNUSED_128, // 256
    __UNUSED_129, // 257
    __UNUSED_130, // 258
    __UNUSED_131, // 259
    __UNUSED_132, // 260
    __UNUSED_133, // 261
    __UNUSED_134, // 262
    __UNUSED_135, // 263
    __UNUSED_136, // 264
    __UNUSED_137, // 265
    __UNUSED_138, // 266
    __UNUSED_139, // 267
    __UNUSED_140, // 268
    __UNUSED_141, // 269
    __UNUSED_142, // 270
    __UNUSED_143, // 271
    __UNUSED_144, // 272
    __UNUSED_145, // 273
    LIVE_DEVICE,
    LIVE_SWAPCHAIN,
    CREATEDEPTHSTENCILVIEW_INVALIDFLAGS,
    CREATEVERTEXSHADER_INVALIDCLASSLINKAGE,
    CREATEGEOMETRYSHADER_INVALIDCLASSLINKAGE,
    __UNUSED_146, // 279
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTREAMTORASTERIZER,
    __UNUSED_147, // 281
    __UNUSED_148, // 282
    CREATEPIXELSHADER_INVALIDCLASSLINKAGE,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTREAM,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDENTRIES,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDSTRIDES,
    CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDNUMSTRIDES,
    __UNUSED_149, // 288
    CREATEHULLSHADER_OUTOFMEMORY,
    CREATEHULLSHADER_INVALIDSHADERBYTECODE,
    CREATEHULLSHADER_INVALIDSHADERTYPE,
    CREATEHULLSHADER_INVALIDCLASSLINKAGE,
    __UNUSED_150, // 293
    CREATEDOMAINSHADER_OUTOFMEMORY,
    CREATEDOMAINSHADER_INVALIDSHADERBYTECODE,
    CREATEDOMAINSHADER_INVALIDSHADERTYPE,
    CREATEDOMAINSHADER_INVALIDCLASSLINKAGE,
    __UNUSED_151, // 298
    __UNUSED_152, // 299
    __UNUSED_153, // 300
    __UNUSED_154, // 301
    __UNUSED_155, // 302
    __UNUSED_156, // 303
    __UNUSED_157, // 304
    __UNUSED_158, // 305
    __UNUSED_159, // 306
    __UNUSED_160, // 307
    __UNUSED_161, // 308
    __UNUSED_162, // 309
    RESOURCE_UNMAP_NOTMAPPED,
    __UNUSED_163, // 311
    __UNUSED_164, // 312
    __UNUSED_165, // 313
    __UNUSED_166, // 314
    __UNUSED_167, // 315
    __UNUSED_168, // 316
    __UNUSED_169, // 317
    DEVICE_CHECKFEATURESUPPORT_MISMATCHED_DATA_SIZE,
    __UNUSED_170, // 319
    __UNUSED_171, // 320
    CREATECOMPUTESHADER_OUTOFMEMORY,
    CREATECOMPUTESHADER_INVALIDSHADERBYTECODE,
    CREATECOMPUTESHADER_INVALIDCLASSLINKAGE,
    __UNUSED_172, // 324
    __UNUSED_173, // 325
    __UNUSED_174, // 326
    __UNUSED_175, // 327
    __UNUSED_176, // 328
    __UNUSED_177, // 329
    __UNUSED_178, // 330
    DEVICE_CREATEVERTEXSHADER_DOUBLEFLOATOPSNOTSUPPORTED,
    DEVICE_CREATEHULLSHADER_DOUBLEFLOATOPSNOTSUPPORTED,
    DEVICE_CREATEDOMAINSHADER_DOUBLEFLOATOPSNOTSUPPORTED,
    DEVICE_CREATEGEOMETRYSHADER_DOUBLEFLOATOPSNOTSUPPORTED,
    DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DOUBLEFLOATOPSNOTSUPPORTED,
    DEVICE_CREATEPIXELSHADER_DOUBLEFLOATOPSNOTSUPPORTED,
    DEVICE_CREATECOMPUTESHADER_DOUBLEFLOATOPSNOTSUPPORTED,
    __UNUSED_179, // 338
    __UNUSED_180, // 339
    CREATEUNORDEREDACCESSVIEW_INVALIDRESOURCE,
    CREATEUNORDEREDACCESSVIEW_INVALIDDESC,
    CREATEUNORDEREDACCESSVIEW_INVALIDFORMAT,
    CREATEUNORDEREDACCESSVIEW_INVALIDVIDEOPLANESLICE,
    CREATEUNORDEREDACCESSVIEW_INVALIDPLANESLICE,
    CREATEUNORDEREDACCESSVIEW_INVALIDDIMENSIONS,
    CREATEUNORDEREDACCESSVIEW_UNRECOGNIZEDFORMAT,
    __UNUSED_181, // 347
    __UNUSED_182, // 348
    __UNUSED_183, // 349
    __UNUSED_184, // 350
    __UNUSED_185, // 351
    __UNUSED_186, // 352
    __UNUSED_187, // 353
    CREATEUNORDEREDACCESSVIEW_INVALIDFLAGS,
    __UNUSED_188, // 355
    __UNUSED_189, // 356
    __UNUSED_190, // 357
    __UNUSED_191, // 358
    __UNUSED_192, // 359
    __UNUSED_193, // 360
    __UNUSED_194, // 361
    __UNUSED_195, // 362
    __UNUSED_196, // 363
    __UNUSED_197, // 364
    __UNUSED_198, // 365
    __UNUSED_199, // 366
    __UNUSED_200, // 367
    __UNUSED_201, // 368
    __UNUSED_202, // 369
    __UNUSED_203, // 370
    __UNUSED_204, // 371
    __UNUSED_205, // 372
    __UNUSED_206, // 373
    __UNUSED_207, // 374
    __UNUSED_208, // 375
    __UNUSED_209, // 376
    __UNUSED_210, // 377
    __UNUSED_211, // 378
    __UNUSED_212, // 379
    __UNUSED_213, // 380
    __UNUSED_214, // 381
    __UNUSED_215, // 382
    __UNUSED_216, // 383
    __UNUSED_217, // 384
    __UNUSED_218, // 385
    __UNUSED_219, // 386
    __UNUSED_220, // 387
    __UNUSED_221, // 388
    __UNUSED_222, // 389
    __UNUSED_223, // 390
    __UNUSED_224, // 391
    __UNUSED_225, // 392
    __UNUSED_226, // 393
    __UNUSED_227, // 394
    __UNUSED_228, // 395
    __UNUSED_229, // 396
    __UNUSED_230, // 397
    __UNUSED_231, // 398
    __UNUSED_232, // 399
    __UNUSED_233, // 400
    CREATERASTERIZERSTATE_INVALIDFORCEDSAMPLECOUNT,
    __UNUSED_234, // 402
    CREATEBLENDSTATE_INVALIDLOGICOPS,
    __UNUSED_235, // 404
    __UNUSED_236, // 405
    __UNUSED_237, // 406
    __UNUSED_238, // 407
    __UNUSED_239, // 408
    __UNUSED_240, // 409
    DEVICE_CREATEVERTEXSHADER_DOUBLEEXTENSIONSNOTSUPPORTED,
    __UNUSED_241, // 411
    DEVICE_CREATEHULLSHADER_DOUBLEEXTENSIONSNOTSUPPORTED,
    __UNUSED_242, // 413
    DEVICE_CREATEDOMAINSHADER_DOUBLEEXTENSIONSNOTSUPPORTED,
    __UNUSED_243, // 415
    DEVICE_CREATEGEOMETRYSHADER_DOUBLEEXTENSIONSNOTSUPPORTED,
    __UNUSED_244, // 417
    DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DOUBLEEXTENSIONSNOTSUPPORTED,
    __UNUSED_245, // 419
    DEVICE_CREATEPIXELSHADER_DOUBLEEXTENSIONSNOTSUPPORTED,
    __UNUSED_246, // 421
    DEVICE_CREATECOMPUTESHADER_DOUBLEEXTENSIONSNOTSUPPORTED,
    __UNUSED_247, // 423
    __UNUSED_248, // 424
    DEVICE_CREATEVERTEXSHADER_UAVSNOTSUPPORTED,
    DEVICE_CREATEHULLSHADER_UAVSNOTSUPPORTED,
    DEVICE_CREATEDOMAINSHADER_UAVSNOTSUPPORTED,
    DEVICE_CREATEGEOMETRYSHADER_UAVSNOTSUPPORTED,
    DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UAVSNOTSUPPORTED,
    DEVICE_CREATEPIXELSHADER_UAVSNOTSUPPORTED,
    DEVICE_CREATECOMPUTESHADER_UAVSNOTSUPPORTED,
    __UNUSED_249, // 432
    __UNUSED_250, // 433
    __UNUSED_251, // 434
    __UNUSED_252, // 435
    __UNUSED_253, // 436
    __UNUSED_254, // 437
    __UNUSED_255, // 438
    __UNUSED_256, // 439
    __UNUSED_257, // 440
    __UNUSED_258, // 441
    __UNUSED_259, // 442
    __UNUSED_260, // 443
    __UNUSED_261, // 444
    __UNUSED_262, // 445
    __UNUSED_263, // 446
    DEVICE_CLEARVIEW_INVALIDSOURCERECT,
    DEVICE_CLEARVIEW_EMPTYRECT,
    __UNUSED_264, // 449
    __UNUSED_265, // 450
    __UNUSED_266, // 451
    __UNUSED_267, // 452
    __UNUSED_268, // 453
    __UNUSED_269, // 454
    __UNUSED_270, // 455
    __UNUSED_271, // 456
    __UNUSED_272, // 457
    __UNUSED_273, // 458
    __UNUSED_274, // 459
    __UNUSED_275, // 460
    __UNUSED_276, // 461
    __UNUSED_277, // 462
    __UNUSED_278, // 463
    __UNUSED_279, // 464
    __UNUSED_280, // 465
    __UNUSED_281, // 466
    __UNUSED_282, // 467
    __UNUSED_283, // 468
    __UNUSED_284, // 469
    __UNUSED_285, // 470
    __UNUSED_286, // 471
    __UNUSED_287, // 472
    __UNUSED_288, // 473
    __UNUSED_289, // 474
    __UNUSED_290, // 475
    __UNUSED_291, // 476
    __UNUSED_292, // 477
    __UNUSED_293, // 478
    __UNUSED_294, // 479
    __UNUSED_295, // 480
    __UNUSED_296, // 481
    __UNUSED_297, // 482
    __UNUSED_298, // 483
    __UNUSED_299, // 484
    __UNUSED_300, // 485
    __UNUSED_301, // 486
    __UNUSED_302, // 487
    __UNUSED_303, // 488
    __UNUSED_304, // 489
    __UNUSED_305, // 490
    __UNUSED_306, // 491
    __UNUSED_307, // 492
    UPDATETILEMAPPINGS_INVALID_PARAMETER,
    COPYTILEMAPPINGS_INVALID_PARAMETER,
    __UNUSED_308, // 495
    __UNUSED_309, // 496
    __UNUSED_310, // 497
    __UNUSED_311, // 498
    __UNUSED_312, // 499
    __UNUSED_313, // 500
    __UNUSED_314, // 501
    __UNUSED_315, // 502
    __UNUSED_316, // 503
    __UNUSED_317, // 504
    __UNUSED_318, // 505
    CREATEDEVICE_INVALIDARGS,
    CREATEDEVICE_WARNING,
    __UNUSED_319, // 508
    __UNUSED_320, // 509
    __UNUSED_321, // 510
    __UNUSED_322, // 511
    __UNUSED_323, // 512
    __UNUSED_324, // 513
    __UNUSED_325, // 514
    __UNUSED_326, // 515
    __UNUSED_327, // 516
    __UNUSED_328, // 517
    __UNUSED_329, // 518
    RESOURCE_BARRIER_INVALID_TYPE,
    RESOURCE_BARRIER_NULL_POINTER,
    RESOURCE_BARRIER_INVALID_SUBRESOURCE,
    RESOURCE_BARRIER_RESERVED_BITS,
    RESOURCE_BARRIER_MISSING_BIND_FLAGS,
    RESOURCE_BARRIER_MISMATCHING_MISC_FLAGS,
    RESOURCE_BARRIER_MATCHING_STATES,
    RESOURCE_BARRIER_INVALID_COMBINATION,
    RESOURCE_BARRIER_BEFORE_AFTER_MISMATCH,
    RESOURCE_BARRIER_INVALID_RESOURCE,
    RESOURCE_BARRIER_SAMPLE_COUNT,
    RESOURCE_BARRIER_INVALID_FLAGS,
    RESOURCE_BARRIER_INVALID_COMBINED_FLAGS,
    RESOURCE_BARRIER_INVALID_FLAGS_FOR_FORMAT,
    RESOURCE_BARRIER_INVALID_SPLIT_BARRIER,
    RESOURCE_BARRIER_UNMATCHED_END,
    RESOURCE_BARRIER_UNMATCHED_BEGIN,
    RESOURCE_BARRIER_INVALID_FLAG,
    RESOURCE_BARRIER_INVALID_COMMAND_LIST_TYPE,
    INVALID_SUBRESOURCE_STATE,
    __UNUSED_330, // 539
    COMMAND_ALLOCATOR_CONTENTION,
    COMMAND_ALLOCATOR_RESET,
    COMMAND_ALLOCATOR_RESET_BUNDLE,
    COMMAND_ALLOCATOR_CANNOT_RESET,
    COMMAND_LIST_OPEN,
    __UNUSED_331, // 545
    INVALID_BUNDLE_API,
    COMMAND_LIST_CLOSED,
    __UNUSED_332, // 548
    WRONG_COMMAND_ALLOCATOR_TYPE,
    __UNUSED_333, // 550
    __UNUSED_334, // 551
    COMMAND_ALLOCATOR_SYNC,
    COMMAND_LIST_SYNC,
    SET_DESCRIPTOR_HEAP_INVALID,
    __UNUSED_335, // 555
    __UNUSED_336, // 556
    CREATE_COMMANDQUEUE,
    CREATE_COMMANDALLOCATOR,
    CREATE_PIPELINESTATE,
    CREATE_COMMANDLIST12,
    __UNUSED_337, // 561
    CREATE_RESOURCE,
    CREATE_DESCRIPTORHEAP,
    CREATE_ROOTSIGNATURE,
    CREATE_LIBRARY,
    CREATE_HEAP,
    CREATE_MONITOREDFENCE,
    CREATE_QUERYHEAP,
    CREATE_COMMANDSIGNATURE,
    LIVE_COMMANDQUEUE,
    LIVE_COMMANDALLOCATOR,
    LIVE_PIPELINESTATE,
    LIVE_COMMANDLIST12,
    __UNUSED_338, // 574
    LIVE_RESOURCE,
    LIVE_DESCRIPTORHEAP,
    LIVE_ROOTSIGNATURE,
    LIVE_LIBRARY,
    LIVE_HEAP,
    LIVE_MONITOREDFENCE,
    LIVE_QUERYHEAP,
    LIVE_COMMANDSIGNATURE,
    DESTROY_COMMANDQUEUE,
    DESTROY_COMMANDALLOCATOR,
    DESTROY_PIPELINESTATE,
    DESTROY_COMMANDLIST12,
    __UNUSED_339, // 587
    DESTROY_RESOURCE,
    DESTROY_DESCRIPTORHEAP,
    DESTROY_ROOTSIGNATURE,
    DESTROY_LIBRARY,
    DESTROY_HEAP,
    DESTROY_MONITOREDFENCE,
    DESTROY_QUERYHEAP,
    DESTROY_COMMANDSIGNATURE,
    __UNUSED_340, // 596
    CREATERESOURCE_INVALIDDIMENSIONS,
    __UNUSED_341, // 598
    CREATERESOURCE_INVALIDMISCFLAGS,
    __UNUSED_342, // 600
    __UNUSED_343, // 601
    CREATERESOURCE_INVALIDARG_RETURN,
    CREATERESOURCE_OUTOFMEMORY_RETURN,
    CREATERESOURCE_INVALIDDESC,
    __UNUSED_344, // 605
    __UNUSED_345, // 606
    POSSIBLY_INVALID_SUBRESOURCE_STATE,
    INVALID_USE_OF_NON_RESIDENT_RESOURCE,
    POSSIBLE_INVALID_USE_OF_NON_RESIDENT_RESOURCE,
    BUNDLE_PIPELINE_STATE_MISMATCH,
    PRIMITIVE_TOPOLOGY_MISMATCH_PIPELINE_STATE,
    __UNUSED_346, // 612
    RENDER_TARGET_FORMAT_MISMATCH_PIPELINE_STATE,
    RENDER_TARGET_SAMPLE_DESC_MISMATCH_PIPELINE_STATE,
    DEPTH_STENCIL_FORMAT_MISMATCH_PIPELINE_STATE,
    DEPTH_STENCIL_SAMPLE_DESC_MISMATCH_PIPELINE_STATE,
    __UNUSED_347, // 617
    __UNUSED_348, // 618
    __UNUSED_349, // 619
    __UNUSED_350, // 620
    __UNUSED_351, // 621
    CREATESHADER_INVALIDBYTECODE,
    CREATEHEAP_NULLDESC,
    CREATEHEAP_INVALIDSIZE,
    CREATEHEAP_UNRECOGNIZEDHEAPTYPE,
    CREATEHEAP_UNRECOGNIZEDCPUPAGEPROPERTIES,
    CREATEHEAP_UNRECOGNIZEDMEMORYPOOL,
    CREATEHEAP_INVALIDPROPERTIES,
    CREATEHEAP_INVALIDALIGNMENT,
    CREATEHEAP_UNRECOGNIZEDMISCFLAGS,
    CREATEHEAP_INVALIDMISCFLAGS,
    CREATEHEAP_INVALIDARG_RETURN,
    CREATEHEAP_OUTOFMEMORY_RETURN,
    CREATERESOURCEANDHEAP_NULLHEAPPROPERTIES,
    CREATERESOURCEANDHEAP_UNRECOGNIZEDHEAPTYPE,
    CREATERESOURCEANDHEAP_UNRECOGNIZEDCPUPAGEPROPERTIES,
    CREATERESOURCEANDHEAP_UNRECOGNIZEDMEMORYPOOL,
    CREATERESOURCEANDHEAP_INVALIDHEAPPROPERTIES,
    CREATERESOURCEANDHEAP_UNRECOGNIZEDHEAPMISCFLAGS,
    CREATERESOURCEANDHEAP_INVALIDHEAPMISCFLAGS,
    CREATERESOURCEANDHEAP_INVALIDARG_RETURN,
    CREATERESOURCEANDHEAP_OUTOFMEMORY_RETURN,
    GETCUSTOMHEAPPROPERTIES_UNRECOGNIZEDHEAPTYPE,
    GETCUSTOMHEAPPROPERTIES_INVALIDHEAPTYPE,
    CREATE_DESCRIPTOR_HEAP_INVALID_DESC,
    INVALID_DESCRIPTOR_HANDLE,
    CREATERASTERIZERSTATE_INVALID_CONSERVATIVERASTERMODE,
    __UNUSED_352, // 648
    CREATE_CONSTANT_BUFFER_VIEW_INVALID_RESOURCE,
    CREATE_CONSTANT_BUFFER_VIEW_INVALID_DESC,
    __UNUSED_353, // 651
    CREATE_UNORDEREDACCESS_VIEW_INVALID_COUNTER_USAGE,
    COPY_DESCRIPTORS_INVALID_RANGES,
    COPY_DESCRIPTORS_WRITE_ONLY_DESCRIPTOR,
    CREATEGRAPHICSPIPELINESTATE_RTV_FORMAT_NOT_UNKNOWN,
    CREATEGRAPHICSPIPELINESTATE_INVALID_RENDER_TARGET_COUNT,
    CREATEGRAPHICSPIPELINESTATE_VERTEX_SHADER_NOT_SET,
    CREATEGRAPHICSPIPELINESTATE_INPUTLAYOUT_NOT_SET,
    CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_HS_DS_SIGNATURE_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_REGISTERINDEX,
    CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_COMPONENTTYPE,
    CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_REGISTERMASK,
    CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_SYSTEMVALUE,
    CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_NEVERWRITTEN_ALWAYSREADS,
    CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_MINPRECISION,
    CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_SEMANTICNAME_NOT_FOUND,
    CREATEGRAPHICSPIPELINESTATE_HS_XOR_DS_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_HULL_SHADER_INPUT_TOPOLOGY_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_HS_DS_CONTROL_POINT_COUNT_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_HS_DS_TESSELLATOR_DOMAIN_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_INVALID_USE_OF_CENTER_MULTISAMPLE_PATTERN,
    CREATEGRAPHICSPIPELINESTATE_INVALID_USE_OF_FORCED_SAMPLE_COUNT,
    CREATEGRAPHICSPIPELINESTATE_INVALID_PRIMITIVETOPOLOGY,
    CREATEGRAPHICSPIPELINESTATE_INVALID_SYSTEMVALUE,
    CREATEGRAPHICSPIPELINESTATE_OM_DUAL_SOURCE_BLENDING_CAN_ONLY_HAVE_RENDER_TARGET_0,
    CREATEGRAPHICSPIPELINESTATE_OM_RENDER_TARGET_DOES_NOT_SUPPORT_BLENDING,
    CREATEGRAPHICSPIPELINESTATE_PS_OUTPUT_TYPE_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_OM_RENDER_TARGET_DOES_NOT_SUPPORT_LOGIC_OPS,
    CREATEGRAPHICSPIPELINESTATE_RENDERTARGETVIEW_NOT_SET,
    CREATEGRAPHICSPIPELINESTATE_DEPTHSTENCILVIEW_NOT_SET,
    CREATEGRAPHICSPIPELINESTATE_GS_INPUT_PRIMITIVE_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_POSITION_NOT_PRESENT,
    CREATEGRAPHICSPIPELINESTATE_MISSING_ROOT_SIGNATURE_FLAGS,
    CREATEGRAPHICSPIPELINESTATE_INVALID_INDEX_BUFFER_PROPERTIES,
    CREATEGRAPHICSPIPELINESTATE_INVALID_SAMPLE_DESC,
    CREATEGRAPHICSPIPELINESTATE_HS_ROOT_SIGNATURE_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_DS_ROOT_SIGNATURE_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_VS_ROOT_SIGNATURE_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_GS_ROOT_SIGNATURE_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_PS_ROOT_SIGNATURE_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_MISSING_ROOT_SIGNATURE,
    EXECUTE_BUNDLE_OPEN_BUNDLE,
    EXECUTE_BUNDLE_DESCRIPTOR_HEAP_MISMATCH,
    EXECUTE_BUNDLE_TYPE,
    DRAW_EMPTY_SCISSOR_RECTANGLE,
    CREATE_ROOT_SIGNATURE_BLOB_NOT_FOUND,
    CREATE_ROOT_SIGNATURE_DESERIALIZE_FAILED,
    CREATE_ROOT_SIGNATURE_INVALID_CONFIGURATION,
    CREATE_ROOT_SIGNATURE_NOT_SUPPORTED_ON_DEVICE,
    CREATERESOURCEANDHEAP_NULLRESOURCEPROPERTIES,
    CREATERESOURCEANDHEAP_NULLHEAP,
    GETRESOURCEALLOCATIONINFO_INVALIDRDESCS,
    MAKERESIDENT_NULLOBJECTARRAY,
    __UNUSED_354, // 704
    EVICT_NULLOBJECTARRAY,
    __UNUSED_355, // 706
    __UNUSED_356, // 707
    SET_DESCRIPTOR_TABLE_INVALID,
    SET_ROOT_CONSTANT_INVALID,
    SET_ROOT_CONSTANT_BUFFER_VIEW_INVALID,
    SET_ROOT_SHADER_RESOURCE_VIEW_INVALID,
    SET_ROOT_UNORDERED_ACCESS_VIEW_INVALID,
    SET_VERTEX_BUFFERS_INVALID_DESC,
    __UNUSED_357, // 714
    SET_INDEX_BUFFER_INVALID_DESC,
    __UNUSED_358, // 716
    SET_STREAM_OUTPUT_BUFFERS_INVALID_DESC,
    CREATERESOURCE_UNRECOGNIZEDDIMENSIONALITY,
    CREATERESOURCE_UNRECOGNIZEDLAYOUT,
    CREATERESOURCE_INVALIDDIMENSIONALITY,
    CREATERESOURCE_INVALIDALIGNMENT,
    CREATERESOURCE_INVALIDMIPLEVELS,
    CREATERESOURCE_INVALIDSAMPLEDESC,
    CREATERESOURCE_INVALIDLAYOUT,
    SET_INDEX_BUFFER_INVALID,
    SET_VERTEX_BUFFERS_INVALID,
    SET_STREAM_OUTPUT_BUFFERS_INVALID,
    SET_RENDER_TARGETS_INVALID,
    CREATEQUERY_HEAP_INVALID_PARAMETERS,
    __UNUSED_359, // 730
    BEGIN_END_QUERY_INVALID_PARAMETERS,
    CLOSE_COMMAND_LIST_OPEN_QUERY,
    RESOLVE_QUERY_DATA_INVALID_PARAMETERS,
    SET_PREDICATION_INVALID_PARAMETERS,
    TIMESTAMPS_NOT_SUPPORTED,
    __UNUSED_360, // 736
    CREATERESOURCE_UNRECOGNIZEDFORMAT,
    CREATERESOURCE_INVALIDFORMAT,
    GETCOPYABLEFOOTPRINTS_INVALIDSUBRESOURCERANGE,
    GETCOPYABLEFOOTPRINTS_INVALIDBASEOFFSET,
    GETCOPYABLELAYOUT_INVALIDSUBRESOURCERANGE,
    GETCOPYABLELAYOUT_INVALIDBASEOFFSET,
    RESOURCE_BARRIER_INVALID_HEAP,
    CREATE_SAMPLER_INVALID,
    CREATECOMMANDSIGNATURE_INVALID,
    EXECUTE_INDIRECT_INVALID_PARAMETERS,
    GETGPUVIRTUALADDRESS_INVALID_RESOURCE_DIMENSION,
    __UNUSED_361, // 746
    __UNUSED_362, // 747
    __UNUSED_363, // 748
    __UNUSED_364, // 749
    __UNUSED_365, // 750
    __UNUSED_366, // 751
    __UNUSED_367, // 752
    __UNUSED_368, // 753
    __UNUSED_369, // 754
    __UNUSED_370, // 755
    __UNUSED_371, // 756
    __UNUSED_372, // 757
    __UNUSED_373, // 758
    __UNUSED_374, // 759
    __UNUSED_375, // 760
    __UNUSED_376, // 761
    __UNUSED_377, // 762
    __UNUSED_378, // 763
    __UNUSED_379, // 764
    __UNUSED_380, // 765
    __UNUSED_381, // 766
    __UNUSED_382, // 767
    __UNUSED_383, // 768
    __UNUSED_384, // 769
    __UNUSED_385, // 770
    __UNUSED_386, // 771
    __UNUSED_387, // 772
    __UNUSED_388, // 773
    __UNUSED_389, // 774
    __UNUSED_390, // 775
    __UNUSED_391, // 776
    __UNUSED_392, // 777
    __UNUSED_393, // 778
    __UNUSED_394, // 779
    __UNUSED_395, // 780
    __UNUSED_396, // 781
    __UNUSED_397, // 782
    __UNUSED_398, // 783
    __UNUSED_399, // 784
    __UNUSED_400, // 785
    __UNUSED_401, // 786
    __UNUSED_402, // 787
    __UNUSED_403, // 788
    __UNUSED_404, // 789
    __UNUSED_405, // 790
    __UNUSED_406, // 791
    __UNUSED_407, // 792
    __UNUSED_408, // 793
    __UNUSED_409, // 794
    __UNUSED_410, // 795
    __UNUSED_411, // 796
    __UNUSED_412, // 797
    __UNUSED_413, // 798
    __UNUSED_414, // 799
    __UNUSED_415, // 800
    __UNUSED_416, // 801
    __UNUSED_417, // 802
    __UNUSED_418, // 803
    __UNUSED_419, // 804
    __UNUSED_420, // 805
    __UNUSED_421, // 806
    __UNUSED_422, // 807
    __UNUSED_423, // 808
    __UNUSED_424, // 809
    __UNUSED_425, // 810
    __UNUSED_426, // 811
    __UNUSED_427, // 812
    __UNUSED_428, // 813
    __UNUSED_429, // 814
    CREATERESOURCE_INVALIDCLEARVALUE,
    CREATERESOURCE_UNRECOGNIZEDCLEARVALUEFORMAT,
    CREATERESOURCE_INVALIDCLEARVALUEFORMAT,
    CREATERESOURCE_CLEARVALUEDENORMFLUSH,
    __UNUSED_430, // 819
    CLEARRENDERTARGETVIEW_MISMATCHINGCLEARVALUE,
    CLEARDEPTHSTENCILVIEW_MISMATCHINGCLEARVALUE,
    MAP_INVALIDHEAP,
    UNMAP_INVALIDHEAP,
    MAP_INVALIDRESOURCE,
    UNMAP_INVALIDRESOURCE,
    MAP_INVALIDSUBRESOURCE,
    UNMAP_INVALIDSUBRESOURCE,
    MAP_INVALIDRANGE,
    UNMAP_INVALIDRANGE,
    __UNUSED_431, // 830
    __UNUSED_432, // 831
    MAP_INVALIDDATAPOINTER,
    MAP_INVALIDARG_RETURN,
    MAP_OUTOFMEMORY_RETURN,
    EXECUTECOMMANDLISTS_BUNDLENOTSUPPORTED,
    EXECUTECOMMANDLISTS_COMMANDLISTMISMATCH,
    EXECUTECOMMANDLISTS_OPENCOMMANDLIST,
    EXECUTECOMMANDLISTS_FAILEDCOMMANDLIST,
    COPYBUFFERREGION_NULLDST,
    COPYBUFFERREGION_INVALIDDSTRESOURCEDIMENSION,
    COPYBUFFERREGION_DSTRANGEOUTOFBOUNDS,
    COPYBUFFERREGION_NULLSRC,
    COPYBUFFERREGION_INVALIDSRCRESOURCEDIMENSION,
    COPYBUFFERREGION_SRCRANGEOUTOFBOUNDS,
    COPYBUFFERREGION_INVALIDCOPYFLAGS,
    COPYTEXTUREREGION_NULLDST,
    COPYTEXTUREREGION_UNRECOGNIZEDDSTTYPE,
    COPYTEXTUREREGION_INVALIDDSTRESOURCEDIMENSION,
    COPYTEXTUREREGION_INVALIDDSTRESOURCE,
    COPYTEXTUREREGION_INVALIDDSTSUBRESOURCE,
    COPYTEXTUREREGION_INVALIDDSTOFFSET,
    COPYTEXTUREREGION_UNRECOGNIZEDDSTFORMAT,
    COPYTEXTUREREGION_INVALIDDSTFORMAT,
    COPYTEXTUREREGION_INVALIDDSTDIMENSIONS,
    COPYTEXTUREREGION_INVALIDDSTROWPITCH,
    COPYTEXTUREREGION_INVALIDDSTPLACEMENT,
    COPYTEXTUREREGION_INVALIDDSTDSPLACEDFOOTPRINTFORMAT,
    COPYTEXTUREREGION_DSTREGIONOUTOFBOUNDS,
    COPYTEXTUREREGION_NULLSRC,
    COPYTEXTUREREGION_UNRECOGNIZEDSRCTYPE,
    COPYTEXTUREREGION_INVALIDSRCRESOURCEDIMENSION,
    COPYTEXTUREREGION_INVALIDSRCRESOURCE,
    COPYTEXTUREREGION_INVALIDSRCSUBRESOURCE,
    COPYTEXTUREREGION_INVALIDSRCOFFSET,
    COPYTEXTUREREGION_UNRECOGNIZEDSRCFORMAT,
    COPYTEXTUREREGION_INVALIDSRCFORMAT,
    COPYTEXTUREREGION_INVALIDSRCDIMENSIONS,
    COPYTEXTUREREGION_INVALIDSRCROWPITCH,
    COPYTEXTUREREGION_INVALIDSRCPLACEMENT,
    COPYTEXTUREREGION_INVALIDSRCDSPLACEDFOOTPRINTFORMAT,
    COPYTEXTUREREGION_SRCREGIONOUTOFBOUNDS,
    COPYTEXTUREREGION_INVALIDDSTCOORDINATES,
    COPYTEXTUREREGION_INVALIDSRCBOX,
    COPYTEXTUREREGION_FORMATMISMATCH,
    COPYTEXTUREREGION_EMPTYBOX,
    COPYTEXTUREREGION_INVALIDCOPYFLAGS,
    RESOLVESUBRESOURCE_INVALID_SUBRESOURCE_INDEX,
    RESOLVESUBRESOURCE_INVALID_FORMAT,
    RESOLVESUBRESOURCE_RESOURCE_MISMATCH,
    RESOLVESUBRESOURCE_INVALID_SAMPLE_COUNT,
    CREATECOMPUTEPIPELINESTATE_INVALID_SHADER,
    CREATECOMPUTEPIPELINESTATE_CS_ROOT_SIGNATURE_MISMATCH,
    CREATECOMPUTEPIPELINESTATE_MISSING_ROOT_SIGNATURE,
    CREATEPIPELINESTATE_INVALIDCACHEDBLOB,
    CREATEPIPELINESTATE_CACHEDBLOBADAPTERMISMATCH,
    CREATEPIPELINESTATE_CACHEDBLOBDRIVERVERSIONMISMATCH,
    CREATEPIPELINESTATE_CACHEDBLOBDESCMISMATCH,
    CREATEPIPELINESTATE_CACHEDBLOBIGNORED,
    WRITETOSUBRESOURCE_INVALIDHEAP,
    WRITETOSUBRESOURCE_INVALIDRESOURCE,
    WRITETOSUBRESOURCE_INVALIDBOX,
    WRITETOSUBRESOURCE_INVALIDSUBRESOURCE,
    WRITETOSUBRESOURCE_EMPTYBOX,
    READFROMSUBRESOURCE_INVALIDHEAP,
    READFROMSUBRESOURCE_INVALIDRESOURCE,
    READFROMSUBRESOURCE_INVALIDBOX,
    READFROMSUBRESOURCE_INVALIDSUBRESOURCE,
    READFROMSUBRESOURCE_EMPTYBOX,
    TOO_MANY_NODES_SPECIFIED,
    INVALID_NODE_INDEX,
    GETHEAPPROPERTIES_INVALIDRESOURCE,
    NODE_MASK_MISMATCH,
    COMMAND_LIST_OUTOFMEMORY,
    COMMAND_LIST_MULTIPLE_SWAPCHAIN_BUFFER_REFERENCES,
    COMMAND_LIST_TOO_MANY_SWAPCHAIN_REFERENCES,
    COMMAND_QUEUE_TOO_MANY_SWAPCHAIN_REFERENCES,
    EXECUTECOMMANDLISTS_WRONGSWAPCHAINBUFFERREFERENCE,
    COMMAND_LIST_SETRENDERTARGETS_INVALIDNUMRENDERTARGETS,
    CREATE_QUEUE_INVALID_TYPE,
    CREATE_QUEUE_INVALID_FLAGS,
    CREATESHAREDRESOURCE_INVALIDFLAGS,
    CREATESHAREDRESOURCE_INVALIDFORMAT,
    CREATESHAREDHEAP_INVALIDFLAGS,
    REFLECTSHAREDPROPERTIES_UNRECOGNIZEDPROPERTIES,
    REFLECTSHAREDPROPERTIES_INVALIDSIZE,
    REFLECTSHAREDPROPERTIES_INVALIDOBJECT,
    KEYEDMUTEX_INVALIDOBJECT,
    KEYEDMUTEX_INVALIDKEY,
    KEYEDMUTEX_WRONGSTATE,
    CREATE_QUEUE_INVALID_PRIORITY,
    OBJECT_DELETED_WHILE_STILL_IN_USE,
    CREATEPIPELINESTATE_INVALID_FLAGS,
    HEAP_ADDRESS_RANGE_HAS_NO_RESOURCE,
    COMMAND_LIST_DRAW_RENDER_TARGET_DELETED,
    CREATEGRAPHICSPIPELINESTATE_ALL_RENDER_TARGETS_HAVE_UNKNOWN_FORMAT,
    HEAP_ADDRESS_RANGE_INTERSECTS_MULTIPLE_BUFFERS,
    EXECUTECOMMANDLISTS_GPU_WRITTEN_READBACK_RESOURCE_MAPPED,
    __UNUSED_433, // 928
    UNMAP_RANGE_NOT_EMPTY,
    MAP_INVALID_NULLRANGE,
    UNMAP_INVALID_NULLRANGE,
    NO_GRAPHICS_API_SUPPORT,
    NO_COMPUTE_API_SUPPORT,
    RESOLVESUBRESOURCE_RESOURCE_FLAGS_NOT_SUPPORTED,
    GPU_BASED_VALIDATION_ROOT_ARGUMENT_UNINITIALIZED,
    GPU_BASED_VALIDATION_DESCRIPTOR_HEAP_INDEX_OUT_OF_BOUNDS,
    GPU_BASED_VALIDATION_DESCRIPTOR_TABLE_REGISTER_INDEX_OUT_OF_BOUNDS,
    GPU_BASED_VALIDATION_DESCRIPTOR_UNINITIALIZED,
    GPU_BASED_VALIDATION_DESCRIPTOR_TYPE_MISMATCH,
    GPU_BASED_VALIDATION_SRV_RESOURCE_DIMENSION_MISMATCH,
    GPU_BASED_VALIDATION_UAV_RESOURCE_DIMENSION_MISMATCH,
    GPU_BASED_VALIDATION_INCOMPATIBLE_RESOURCE_STATE,
    COPYRESOURCE_NULLDST,
    COPYRESOURCE_INVALIDDSTRESOURCE,
    COPYRESOURCE_NULLSRC,
    COPYRESOURCE_INVALIDSRCRESOURCE,
    RESOLVESUBRESOURCE_NULLDST,
    RESOLVESUBRESOURCE_INVALIDDSTRESOURCE,
    RESOLVESUBRESOURCE_NULLSRC,
    RESOLVESUBRESOURCE_INVALIDSRCRESOURCE,
    PIPELINE_STATE_TYPE_MISMATCH,
    COMMAND_LIST_DISPATCH_ROOT_SIGNATURE_NOT_SET,
    COMMAND_LIST_DISPATCH_ROOT_SIGNATURE_MISMATCH,
    RESOURCE_BARRIER_ZERO_BARRIERS,
    BEGIN_END_EVENT_MISMATCH,
    RESOURCE_BARRIER_POSSIBLE_BEFORE_AFTER_MISMATCH,
    RESOURCE_BARRIER_MISMATCHING_BEGIN_END,
    GPU_BASED_VALIDATION_INVALID_RESOURCE,
    USE_OF_ZERO_REFCOUNT_OBJECT,
    OBJECT_EVICTED_WHILE_STILL_IN_USE,
    GPU_BASED_VALIDATION_ROOT_DESCRIPTOR_ACCESS_OUT_OF_BOUNDS,
    CREATEPIPELINELIBRARY_INVALIDLIBRARYBLOB,
    CREATEPIPELINELIBRARY_DRIVERVERSIONMISMATCH,
    CREATEPIPELINELIBRARY_ADAPTERVERSIONMISMATCH,
    CREATEPIPELINELIBRARY_UNSUPPORTED,
    CREATE_PIPELINELIBRARY,
    LIVE_PIPELINELIBRARY,
    DESTROY_PIPELINELIBRARY,
    STOREPIPELINE_NONAME,
    STOREPIPELINE_DUPLICATENAME,
    LOADPIPELINE_NAMENOTFOUND,
    LOADPIPELINE_INVALIDDESC,
    PIPELINELIBRARY_SERIALIZE_NOTENOUGHMEMORY,
    CREATEGRAPHICSPIPELINESTATE_PS_OUTPUT_RT_OUTPUT_MISMATCH,
    SETEVENTONMULTIPLEFENCECOMPLETION_INVALIDFLAGS,
    CREATE_QUEUE_VIDEO_NOT_SUPPORTED,
    CREATE_COMMAND_ALLOCATOR_VIDEO_NOT_SUPPORTED,
    CREATEQUERY_HEAP_VIDEO_DECODE_STATISTICS_NOT_SUPPORTED,
    CREATE_VIDEODECODECOMMANDLIST,
    CREATE_VIDEODECODER,
    CREATE_VIDEODECODESTREAM,
    LIVE_VIDEODECODECOMMANDLIST,
    LIVE_VIDEODECODER,
    LIVE_VIDEODECODESTREAM,
    DESTROY_VIDEODECODECOMMANDLIST,
    DESTROY_VIDEODECODER,
    DESTROY_VIDEODECODESTREAM,
    DECODE_FRAME_INVALID_PARAMETERS,
    DEPRECATED_API,
    RESOURCE_BARRIER_MISMATCHING_COMMAND_LIST_TYPE,
    COMMAND_LIST_DESCRIPTOR_TABLE_NOT_SET,
    COMMAND_LIST_ROOT_CONSTANT_BUFFER_VIEW_NOT_SET,
    COMMAND_LIST_ROOT_SHADER_RESOURCE_VIEW_NOT_SET,
    COMMAND_LIST_ROOT_UNORDERED_ACCESS_VIEW_NOT_SET,
    DISCARD_INVALID_SUBRESOURCE_RANGE,
    DISCARD_ONE_SUBRESOURCE_FOR_MIPS_WITH_RECTS,
    DISCARD_NO_RECTS_FOR_NON_TEXTURE2D,
    COPY_ON_SAME_SUBRESOURCE,
    SETRESIDENCYPRIORITY_INVALID_PAGEABLE,
    GPU_BASED_VALIDATION_UNSUPPORTED,
    STATIC_DESCRIPTOR_INVALID_DESCRIPTOR_CHANGE,
    DATA_STATIC_DESCRIPTOR_INVALID_DATA_CHANGE,
    DATA_STATIC_WHILE_SET_AT_EXECUTE_DESCRIPTOR_INVALID_DATA_CHANGE,
    EXECUTE_BUNDLE_STATIC_DESCRIPTOR_DATA_STATIC_NOT_SET,
    GPU_BASED_VALIDATION_RESOURCE_ACCESS_OUT_OF_BOUNDS,
    GPU_BASED_VALIDATION_SAMPLER_MODE_MISMATCH,
    CREATE_FENCE_INVALID_FLAGS,
    RESOURCE_BARRIER_DUPLICATE_SUBRESOURCE_TRANSITIONS,
    SETRESIDENCYPRIORITY_INVALID_PRIORITY,
    __UNUSED_434, // 1010
    __UNUSED_435, // 1011
    __UNUSED_436, // 1012
    CREATE_DESCRIPTOR_HEAP_LARGE_NUM_DESCRIPTORS,
    BEGIN_EVENT,
    END_EVENT,
    CREATEDEVICE_DEBUG_LAYER_STARTUP_OPTIONS,
    CREATEDEPTHSTENCILSTATE_DEPTHBOUNDSTEST_UNSUPPORTED,
    CREATEPIPELINESTATE_DUPLICATE_SUBOBJECT,
    CREATEPIPELINESTATE_UNKNOWN_SUBOBJECT,
    CREATEPIPELINESTATE_ZERO_SIZE_STREAM,
    CREATEPIPELINESTATE_INVALID_STREAM,
    CREATEPIPELINESTATE_CANNOT_DEDUCE_TYPE,
    COMMAND_LIST_STATIC_DESCRIPTOR_RESOURCE_DIMENSION_MISMATCH,
    CREATE_COMMAND_QUEUE_INSUFFICIENT_PRIVILEGE_FOR_GLOBAL_REALTIME,
    CREATE_COMMAND_QUEUE_INSUFFICIENT_HARDWARE_SUPPORT_FOR_GLOBAL_REALTIME,
    ATOMICCOPYBUFFER_INVALID_ARCHITECTURE,
    ATOMICCOPYBUFFER_NULL_DST,
    ATOMICCOPYBUFFER_INVALID_DST_RESOURCE_DIMENSION,
    ATOMICCOPYBUFFER_DST_RANGE_OUT_OF_BOUNDS,
    ATOMICCOPYBUFFER_NULL_SRC,
    ATOMICCOPYBUFFER_INVALID_SRC_RESOURCE_DIMENSION,
    ATOMICCOPYBUFFER_SRC_RANGE_OUT_OF_BOUNDS,
    ATOMICCOPYBUFFER_INVALID_OFFSET_ALIGNMENT,
    ATOMICCOPYBUFFER_NULL_DEPENDENT_RESOURCES,
    ATOMICCOPYBUFFER_NULL_DEPENDENT_SUBRESOURCE_RANGES,
    ATOMICCOPYBUFFER_INVALID_DEPENDENT_RESOURCE,
    ATOMICCOPYBUFFER_INVALID_DEPENDENT_SUBRESOURCE_RANGE,
    ATOMICCOPYBUFFER_DEPENDENT_SUBRESOURCE_OUT_OF_BOUNDS,
    ATOMICCOPYBUFFER_DEPENDENT_RANGE_OUT_OF_BOUNDS,
    ATOMICCOPYBUFFER_ZERO_DEPENDENCIES,
    DEVICE_CREATE_SHARED_HANDLE_INVALIDARG,
    DESCRIPTOR_HANDLE_WITH_INVALID_RESOURCE,
    SETDEPTHBOUNDS_INVALIDARGS,
    GPU_BASED_VALIDATION_RESOURCE_STATE_IMPRECISE,
    COMMAND_LIST_PIPELINE_STATE_NOT_SET,
    CREATEGRAPHICSPIPELINESTATE_SHADER_MODEL_MISMATCH,
    OBJECT_ACCESSED_WHILE_STILL_IN_USE,
    PROGRAMMABLE_MSAA_UNSUPPORTED,
    SETSAMPLEPOSITIONS_INVALIDARGS,
    RESOLVESUBRESOURCEREGION_INVALID_RECT,
    CREATE_VIDEODECODECOMMANDQUEUE,
    CREATE_VIDEOPROCESSCOMMANDLIST,
    CREATE_VIDEOPROCESSCOMMANDQUEUE,
    LIVE_VIDEODECODECOMMANDQUEUE,
    LIVE_VIDEOPROCESSCOMMANDLIST,
    LIVE_VIDEOPROCESSCOMMANDQUEUE,
    DESTROY_VIDEODECODECOMMANDQUEUE,
    DESTROY_VIDEOPROCESSCOMMANDLIST,
    DESTROY_VIDEOPROCESSCOMMANDQUEUE,
    CREATE_VIDEOPROCESSOR,
    CREATE_VIDEOPROCESSSTREAM,
    LIVE_VIDEOPROCESSOR,
    LIVE_VIDEOPROCESSSTREAM,
    DESTROY_VIDEOPROCESSOR,
    DESTROY_VIDEOPROCESSSTREAM,
    PROCESS_FRAME_INVALID_PARAMETERS,
    COPY_INVALIDLAYOUT,
    CREATE_CRYPTO_SESSION,
    CREATE_CRYPTO_SESSION_POLICY,
    CREATE_PROTECTED_RESOURCE_SESSION,
    LIVE_CRYPTO_SESSION,
    LIVE_CRYPTO_SESSION_POLICY,
    LIVE_PROTECTED_RESOURCE_SESSION,
    DESTROY_CRYPTO_SESSION,
    DESTROY_CRYPTO_SESSION_POLICY,
    DESTROY_PROTECTED_RESOURCE_SESSION,
    PROTECTED_RESOURCE_SESSION_UNSUPPORTED,
    FENCE_INVALIDOPERATION,
    CREATEQUERY_HEAP_COPY_QUEUE_TIMESTAMPS_NOT_SUPPORTED,
    SAMPLEPOSITIONS_MISMATCH_DEFERRED,
    SAMPLEPOSITIONS_MISMATCH_RECORDTIME_ASSUMEDFROMFIRSTUSE,
    SAMPLEPOSITIONS_MISMATCH_RECORDTIME_ASSUMEDFROMCLEAR,
    CREATE_VIDEODECODERHEAP,
    LIVE_VIDEODECODERHEAP,
    DESTROY_VIDEODECODERHEAP,
    OPENEXISTINGHEAP_INVALIDARG_RETURN,
    OPENEXISTINGHEAP_OUTOFMEMORY_RETURN,
    OPENEXISTINGHEAP_INVALIDADDRESS,
    OPENEXISTINGHEAP_INVALIDHANDLE,
    WRITEBUFFERIMMEDIATE_INVALID_DEST,
    WRITEBUFFERIMMEDIATE_INVALID_MODE,
    WRITEBUFFERIMMEDIATE_INVALID_ALIGNMENT,
    WRITEBUFFERIMMEDIATE_NOT_SUPPORTED,
    SETVIEWINSTANCEMASK_INVALIDARGS,
    VIEW_INSTANCING_UNSUPPORTED,
    VIEW_INSTANCING_INVALIDARGS,
    COPYTEXTUREREGION_MISMATCH_DECODE_REFERENCE_ONLY_FLAG,
    COPYRESOURCE_MISMATCH_DECODE_REFERENCE_ONLY_FLAG,
    CREATE_VIDEO_DECODE_HEAP_CAPS_FAILURE,
    CREATE_VIDEO_DECODE_HEAP_CAPS_UNSUPPORTED,
    VIDEO_DECODE_SUPPORT_INVALID_INPUT,
    CREATE_VIDEO_DECODER_UNSUPPORTED,
    CREATEGRAPHICSPIPELINESTATE_METADATA_ERROR,
    CREATEGRAPHICSPIPELINESTATE_VIEW_INSTANCING_VERTEX_SIZE_EXCEEDED,
    CREATEGRAPHICSPIPELINESTATE_RUNTIME_INTERNAL_ERROR,
    NO_VIDEO_API_SUPPORT,
    VIDEO_PROCESS_SUPPORT_INVALID_INPUT,
    CREATE_VIDEO_PROCESSOR_CAPS_FAILURE,
    VIDEO_PROCESS_SUPPORT_UNSUPPORTED_FORMAT,
    VIDEO_DECODE_FRAME_INVALID_ARGUMENT,
    ENQUEUE_MAKE_RESIDENT_INVALID_FLAGS,
    OPENEXISTINGHEAP_UNSUPPORTED,
    VIDEO_PROCESS_FRAMES_INVALID_ARGUMENT,
    VIDEO_DECODE_SUPPORT_UNSUPPORTED,
    CREATE_COMMANDRECORDER,
    LIVE_COMMANDRECORDER,
    DESTROY_COMMANDRECORDER,
    CREATE_COMMAND_RECORDER_VIDEO_NOT_SUPPORTED,
    CREATE_COMMAND_RECORDER_INVALID_SUPPORT_FLAGS,
    CREATE_COMMAND_RECORDER_INVALID_FLAGS,
    CREATE_COMMAND_RECORDER_MORE_RECORDERS_THAN_LOGICAL_PROCESSORS,
    CREATE_COMMANDPOOL,
    LIVE_COMMANDPOOL,
    DESTROY_COMMANDPOOL,
    CREATE_COMMAND_POOL_INVALID_FLAGS,
    CREATE_COMMAND_LIST_VIDEO_NOT_SUPPORTED,
    COMMAND_RECORDER_SUPPORT_FLAGS_MISMATCH,
    COMMAND_RECORDER_CONTENTION,
    COMMAND_RECORDER_USAGE_WITH_CREATECOMMANDLIST_COMMAND_LIST,
    COMMAND_ALLOCATOR_USAGE_WITH_CREATECOMMANDLIST1_COMMAND_LIST,
    CANNOT_EXECUTE_EMPTY_COMMAND_LIST,
    CANNOT_RESET_COMMAND_POOL_WITH_OPEN_COMMAND_LISTS,
    CANNOT_USE_COMMAND_RECORDER_WITHOUT_CURRENT_TARGET,
    CANNOT_CHANGE_COMMAND_RECORDER_TARGET_WHILE_RECORDING,
    COMMAND_POOL_SYNC,
    EVICT_UNDERFLOW,
    CREATE_META_COMMAND,
    LIVE_META_COMMAND,
    DESTROY_META_COMMAND,
    COPYBUFFERREGION_INVALID_DST_RESOURCE,
    COPYBUFFERREGION_INVALID_SRC_RESOURCE,
    ATOMICCOPYBUFFER_INVALID_DST_RESOURCE,
    ATOMICCOPYBUFFER_INVALID_SRC_RESOURCE,
    CREATEPLACEDRESOURCEONBUFFER_NULL_BUFFER,
    CREATEPLACEDRESOURCEONBUFFER_NULL_RESOURCE_DESC,
    CREATEPLACEDRESOURCEONBUFFER_UNSUPPORTED,
    CREATEPLACEDRESOURCEONBUFFER_INVALID_BUFFER_DIMENSION,
    CREATEPLACEDRESOURCEONBUFFER_INVALID_BUFFER_FLAGS,
    CREATEPLACEDRESOURCEONBUFFER_INVALID_BUFFER_OFFSET,
    CREATEPLACEDRESOURCEONBUFFER_INVALID_RESOURCE_DIMENSION,
    CREATEPLACEDRESOURCEONBUFFER_INVALID_RESOURCE_FLAGS,
    CREATEPLACEDRESOURCEONBUFFER_OUTOFMEMORY_RETURN,
    CANNOT_CREATE_GRAPHICS_AND_VIDEO_COMMAND_RECORDER,
    UPDATETILEMAPPINGS_POSSIBLY_MISMATCHING_PROPERTIES,
    CREATE_COMMAND_LIST_INVALID_COMMAND_LIST_TYPE,
    CLEARUNORDEREDACCESSVIEW_INCOMPATIBLE_WITH_STRUCTURED_BUFFERS,
    COMPUTE_ONLY_DEVICE_OPERATION_UNSUPPORTED,
    BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INVALID,
    EMIT_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_INVALID,
    COPY_RAYTRACING_ACCELERATION_STRUCTURE_INVALID,
    DISPATCH_RAYS_INVALID,
    GET_RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO_INVALID,
    CREATE_LIFETIMETRACKER,
    LIVE_LIFETIMETRACKER,
    DESTROY_LIFETIMETRACKER,
    DESTROYOWNEDOBJECT_OBJECTNOTOWNED,
    CREATE_TRACKEDWORKLOAD,
    LIVE_TRACKEDWORKLOAD,
    DESTROY_TRACKEDWORKLOAD,
    RENDER_PASS_ERROR,
    META_COMMAND_ID_INVALID,
    META_COMMAND_UNSUPPORTED_PARAMS,
    META_COMMAND_FAILED_ENUMERATION,
    META_COMMAND_PARAMETER_SIZE_MISMATCH,
    UNINITIALIZED_META_COMMAND,
    META_COMMAND_INVALID_GPU_VIRTUAL_ADDRESS,
    CREATE_VIDEOENCODECOMMANDLIST,
    LIVE_VIDEOENCODECOMMANDLIST,
    DESTROY_VIDEOENCODECOMMANDLIST,
    CREATE_VIDEOENCODECOMMANDQUEUE,
    LIVE_VIDEOENCODECOMMANDQUEUE,
    DESTROY_VIDEOENCODECOMMANDQUEUE,
    CREATE_VIDEOMOTIONESTIMATOR,
    LIVE_VIDEOMOTIONESTIMATOR,
    DESTROY_VIDEOMOTIONESTIMATOR,
    CREATE_VIDEOMOTIONVECTORHEAP,
    LIVE_VIDEOMOTIONVECTORHEAP,
    DESTROY_VIDEOMOTIONVECTORHEAP,
    MULTIPLE_TRACKED_WORKLOADS,
    MULTIPLE_TRACKED_WORKLOAD_PAIRS,
    OUT_OF_ORDER_TRACKED_WORKLOAD_PAIR,
    CANNOT_ADD_TRACKED_WORKLOAD,
    INCOMPLETE_TRACKED_WORKLOAD_PAIR,
    CREATE_STATE_OBJECT_ERROR,
    GET_SHADER_IDENTIFIER_ERROR,
    GET_SHADER_STACK_SIZE_ERROR,
    GET_PIPELINE_STACK_SIZE_ERROR,
    SET_PIPELINE_STACK_SIZE_ERROR,
    GET_SHADER_IDENTIFIER_SIZE_INVALID,
    CHECK_DRIVER_MATCHING_IDENTIFIER_INVALID,
    CHECK_DRIVER_MATCHING_IDENTIFIER_DRIVER_REPORTED_ISSUE,
    RENDER_PASS_INVALID_RESOURCE_BARRIER,
    RENDER_PASS_DISALLOWED_API_CALLED,
    RENDER_PASS_CANNOT_NEST_RENDER_PASSES,
    RENDER_PASS_CANNOT_END_WITHOUT_BEGIN,
    RENDER_PASS_CANNOT_CLOSE_COMMAND_LIST,
    RENDER_PASS_GPU_WORK_WHILE_SUSPENDED,
    RENDER_PASS_MISMATCHING_SUSPEND_RESUME,
    RENDER_PASS_NO_PRIOR_SUSPEND_WITHIN_EXECUTECOMMANDLISTS,
    RENDER_PASS_NO_SUBSEQUENT_RESUME_WITHIN_EXECUTECOMMANDLISTS,
    TRACKED_WORKLOAD_COMMAND_QUEUE_MISMATCH,
    TRACKED_WORKLOAD_NOT_SUPPORTED,
    RENDER_PASS_MISMATCHING_NO_ACCESS,
    RENDER_PASS_UNSUPPORTED_RESOLVE,
    CLEARUNORDEREDACCESSVIEW_INVALID_RESOURCE_PTR,
    WINDOWS7_FENCE_OUTOFORDER_SIGNAL,
    WINDOWS7_FENCE_OUTOFORDER_WAIT,
    VIDEO_CREATE_MOTION_ESTIMATOR_INVALID_ARGUMENT,
    VIDEO_CREATE_MOTION_VECTOR_HEAP_INVALID_ARGUMENT,
    ESTIMATE_MOTION_INVALID_ARGUMENT,
    RESOLVE_MOTION_VECTOR_HEAP_INVALID_ARGUMENT,
    GETGPUVIRTUALADDRESS_INVALID_HEAP_TYPE,
    SET_BACKGROUND_PROCESSING_MODE_INVALID_ARGUMENT,
    CREATE_COMMAND_LIST_INVALID_COMMAND_LIST_TYPE_FOR_FEATURE_LEVEL,
    CREATE_VIDEOEXTENSIONCOMMAND,
    LIVE_VIDEOEXTENSIONCOMMAND,
    DESTROY_VIDEOEXTENSIONCOMMAND,
    INVALID_VIDEO_EXTENSION_COMMAND_ID,
    VIDEO_EXTENSION_COMMAND_INVALID_ARGUMENT,
    CREATE_ROOT_SIGNATURE_NOT_UNIQUE_IN_DXIL_LIBRARY,
    VARIABLE_SHADING_RATE_NOT_ALLOWED_WITH_TIR,
    GEOMETRY_SHADER_OUTPUTTING_BOTH_VIEWPORT_ARRAY_INDEX_AND_SHADING_RATE_NOT_SUPPORTED_ON_DEVICE,
    RSSETSHADING_RATE_INVALID_SHADING_RATE,
    RSSETSHADING_RATE_SHADING_RATE_NOT_PERMITTED_BY_CAP,
    RSSETSHADING_RATE_INVALID_COMBINER,
    RSSETSHADINGRATEIMAGE_REQUIRES_TIER_2,
    RSSETSHADINGRATE_REQUIRES_TIER_1,
    SHADING_RATE_IMAGE_INCORRECT_FORMAT,
    SHADING_RATE_IMAGE_INCORRECT_ARRAY_SIZE,
    SHADING_RATE_IMAGE_INCORRECT_MIP_LEVEL,
    SHADING_RATE_IMAGE_INCORRECT_SAMPLE_COUNT,
    SHADING_RATE_IMAGE_INCORRECT_SAMPLE_QUALITY,
    NON_RETAIL_SHADER_MODEL_WONT_VALIDATE,
    CREATEGRAPHICSPIPELINESTATE_AS_ROOT_SIGNATURE_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_MS_ROOT_SIGNATURE_MISMATCH,
    ADD_TO_STATE_OBJECT_ERROR,
    CREATE_PROTECTED_RESOURCE_SESSION_INVALID_ARGUMENT,
    CREATEGRAPHICSPIPELINESTATE_MS_PSO_DESC_MISMATCH,
    CREATEPIPELINESTATE_MS_INCOMPLETE_TYPE,
    CREATEGRAPHICSPIPELINESTATE_AS_NOT_MS_MISMATCH,
    CREATEGRAPHICSPIPELINESTATE_MS_NOT_PS_MISMATCH,
    NONZERO_SAMPLER_FEEDBACK_MIP_REGION_WITH_INCOMPATIBLE_FORMAT,
    CREATEGRAPHICSPIPELINESTATE_INPUTLAYOUT_SHADER_MISMATCH,
    EMPTY_DISPATCH,
    RESOURCE_FORMAT_REQUIRES_SAMPLER_FEEDBACK_CAPABILITY,
    SAMPLER_FEEDBACK_MAP_INVALID_MIP_REGION,
    SAMPLER_FEEDBACK_MAP_INVALID_DIMENSION,
    SAMPLER_FEEDBACK_MAP_INVALID_SAMPLE_COUNT,
    SAMPLER_FEEDBACK_MAP_INVALID_SAMPLE_QUALITY,
    SAMPLER_FEEDBACK_MAP_INVALID_LAYOUT,
    SAMPLER_FEEDBACK_MAP_REQUIRES_UNORDERED_ACCESS_FLAG,
    SAMPLER_FEEDBACK_CREATE_UAV_NULL_ARGUMENTS,
    SAMPLER_FEEDBACK_UAV_REQUIRES_SAMPLER_FEEDBACK_CAPABILITY,
    SAMPLER_FEEDBACK_CREATE_UAV_REQUIRES_FEEDBACK_MAP_FORMAT,
    CREATEMESHSHADER_INVALIDSHADERBYTECODE,
    CREATEMESHSHADER_OUTOFMEMORY,
    CREATEMESHSHADERWITHSTREAMOUTPUT_INVALIDSHADERTYPE,
    RESOLVESUBRESOURCE_SAMPLER_FEEDBACK_TRANSCODE_INVALID_FORMAT,
    RESOLVESUBRESOURCE_SAMPLER_FEEDBACK_INVALID_MIP_LEVEL_COUNT,
    RESOLVESUBRESOURCE_SAMPLER_FEEDBACK_TRANSCODE_ARRAY_SIZE_MISMATCH,
    SAMPLER_FEEDBACK_CREATE_UAV_MISMATCHING_TARGETED_RESOURCE,
    CREATEMESHSHADER_OUTPUTEXCEEDSMAXSIZE,
    CREATEMESHSHADER_GROUPSHAREDEXCEEDSMAXSIZE,
    VERTEX_SHADER_OUTPUTTING_BOTH_VIEWPORT_ARRAY_INDEX_AND_SHADING_RATE_NOT_SUPPORTED_ON_DEVICE,
    MESH_SHADER_OUTPUTTING_BOTH_VIEWPORT_ARRAY_INDEX_AND_SHADING_RATE_NOT_SUPPORTED_ON_DEVICE,
    CREATEMESHSHADER_MISMATCHEDASMSPAYLOADSIZE,
    CREATE_ROOT_SIGNATURE_UNBOUNDED_STATIC_DESCRIPTORS,
    CREATEAMPLIFICATIONSHADER_INVALIDSHADERBYTECODE,
    CREATEAMPLIFICATIONSHADER_OUTOFMEMORY,
    CREATE_SHADERCACHESESSION,
    LIVE_SHADERCACHESESSION,
    DESTROY_SHADERCACHESESSION,
    CREATESHADERCACHESESSION_INVALIDARGS,
    CREATESHADERCACHESESSION_DISABLED,
    CREATESHADERCACHESESSION_ALREADYOPEN,
    SHADERCACHECONTROL_DEVELOPERMODE,
    SHADERCACHECONTROL_INVALIDFLAGS,
    SHADERCACHECONTROL_STATEALREADYSET,
    SHADERCACHECONTROL_IGNOREDFLAG,
    SHADERCACHESESSION_STOREVALUE_ALREADYPRESENT,
    SHADERCACHESESSION_STOREVALUE_HASHCOLLISION,
    SHADERCACHESESSION_STOREVALUE_CACHEFULL,
    SHADERCACHESESSION_FINDVALUE_NOTFOUND,
    SHADERCACHESESSION_CORRUPT,
    SHADERCACHESESSION_DISABLED,
    OVERSIZED_DISPATCH,
    CREATE_VIDEOENCODER,
    LIVE_VIDEOENCODER,
    DESTROY_VIDEOENCODER,
    CREATE_VIDEOENCODERHEAP,
    LIVE_VIDEOENCODERHEAP,
    DESTROY_VIDEOENCODERHEAP,
    COPYTEXTUREREGION_MISMATCH_ENCODE_REFERENCE_ONLY_FLAG,
    COPYRESOURCE_MISMATCH_ENCODE_REFERENCE_ONLY_FLAG,
    ENCODE_FRAME_INVALID_PARAMETERS,
    ENCODE_FRAME_UNSUPPORTED_PARAMETERS,
    RESOLVE_ENCODER_OUTPUT_METADATA_INVALID_PARAMETERS,
    RESOLVE_ENCODER_OUTPUT_METADATA_UNSUPPORTED_PARAMETERS,
    CREATE_VIDEO_ENCODER_INVALID_PARAMETERS,
    CREATE_VIDEO_ENCODER_UNSUPPORTED_PARAMETERS,
    CREATE_VIDEO_ENCODER_HEAP_INVALID_PARAMETERS,
    CREATE_VIDEO_ENCODER_HEAP_UNSUPPORTED_PARAMETERS,
    CREATECOMMANDLIST_NULL_COMMANDALLOCATOR,
    CLEAR_UNORDERED_ACCESS_VIEW_INVALID_DESCRIPTOR_HANDLE,
    DESCRIPTOR_HEAP_NOT_SHADER_VISIBLE,
    CREATEBLENDSTATE_BLENDOP_WARNING,
    CREATEBLENDSTATE_BLENDOPALPHA_WARNING,
    WRITE_COMBINE_PERFORMANCE_WARNING,
    RESOLVE_QUERY_INVALID_QUERY_STATE,
    SETPRIVATEDATA_NO_ACCESS,
    COMMAND_LIST_STATIC_DESCRIPTOR_SAMPLER_MODE_MISMATCH,
    GETCOPYABLEFOOTPRINTS_UNSUPPORTED_BUFFER_WIDTH,
    CREATEMESHSHADER_TOPOLOGY_MISMATCH,
    VRS_SUM_COMBINER_REQUIRES_CAPABILITY,
    SETTING_SHADING_RATE_FROM_MS_REQUIRES_CAPABILITY,
    SHADERCACHESESSION_SHADERCACHEDELETE_NOTSUPPORTED,
    SHADERCACHECONTROL_SHADERCACHECLEAR_NOTSUPPORTED,
    CREATERESOURCE_STATE_IGNORED,
    UNUSED_CROSS_EXECUTE_SPLIT_BARRIER,
    DEVICE_OPEN_SHARED_HANDLE_ACCESS_DENIED,
    INCOMPATIBLE_BARRIER_VALUES,
    INCOMPATIBLE_BARRIER_ACCESS,
    INCOMPATIBLE_BARRIER_SYNC,
    INCOMPATIBLE_BARRIER_LAYOUT,
    INCOMPATIBLE_BARRIER_TYPE,
    OUT_OF_BOUNDS_BARRIER_SUBRESOURCE_RANGE,
    INCOMPATIBLE_BARRIER_RESOURCE_DIMENSION,
    SET_SCISSOR_RECTS_INVALID_RECT,
    SHADING_RATE_SOURCE_REQUIRES_DIMENSION_TEXTURE2D,
    BUFFER_BARRIER_SUBREGION_OUT_OF_BOUNDS,
    UNSUPPORTED_BARRIER_LAYOUT,
    CREATERESOURCEANDHEAP_INVALID_PARAMETERS,
    ENHANCED_BARRIERS_NOT_SUPPORTED,
    __UNUSED_437, // 1344
    __UNUSED_438, // 1345
    LEGACY_BARRIER_VALIDATION_FORCED_ON,
    EMPTY_ROOT_DESCRIPTOR_TABLE,
    COMMAND_LIST_DRAW_ELEMENT_OFFSET_UNALIGNED,
    ALPHA_BLEND_FACTOR_NOT_SUPPORTED,
    BARRIER_INTEROP_INVALID_LAYOUT,
    BARRIER_INTEROP_INVALID_STATE,
    GRAPHICS_PIPELINE_STATE_DESC_ZERO_SAMPLE_MASK,
    INDEPENDENT_STENCIL_REF_NOT_SUPPORTED,
    CREATEDEPTHSTENCILSTATE_INDEPENDENT_MASKS_UNSUPPORTED,
    TEXTURE_BARRIER_SUBRESOURCES_OUT_OF_BOUNDS,
    NON_OPTIMAL_BARRIER_ONLY_EXECUTE_COMMAND_LISTS,
    EXECUTE_INDIRECT_ZERO_COMMAND_COUNT,
    GPU_BASED_VALIDATION_INCOMPATIBLE_TEXTURE_LAYOUT,
    DYNAMIC_INDEX_BUFFER_STRIP_CUT_NOT_SUPPORTED,
    PRIMITIVE_TOPOLOGY_TRIANGLE_FANS_NOT_SUPPORTED,
    CREATE_SAMPLER_COMPARISON_FUNC_IGNORED,
    CREATEHEAP_INVALIDHEAPTYPE,
    CREATERESOURCEANDHEAP_INVALIDHEAPTYPE,
    DYNAMIC_DEPTH_BIAS_NOT_SUPPORTED,
    CREATERASTERIZERSTATE_NON_WHOLE_DYNAMIC_DEPTH_BIAS,
    DYNAMIC_DEPTH_BIAS_FLAG_MISSING,
    DYNAMIC_DEPTH_BIAS_NO_PIPELINE,
    DYNAMIC_INDEX_BUFFER_STRIP_CUT_FLAG_MISSING,
    DYNAMIC_INDEX_BUFFER_STRIP_CUT_NO_PIPELINE,
    NONNORMALIZED_COORDINATE_SAMPLING_NOT_SUPPORTED,
    INVALID_CAST_TARGET,
    RENDER_PASS_COMMANDLIST_INVALID_END_STATE,
    RENDER_PASS_COMMANDLIST_INVALID_START_STATE,
    RENDER_PASS_MISMATCHING_ACCESS,
    RENDER_PASS_MISMATCHING_LOCAL_PRESERVE_PARAMETERS,
    RENDER_PASS_LOCAL_PRESERVE_RENDER_PARAMETERS_ERROR,
    RENDER_PASS_LOCAL_DEPTH_STENCIL_ERROR,
    DRAW_POTENTIALLY_OUTSIDE_OF_VALID_RENDER_AREA,
    CREATERASTERIZERSTATE_INVALID_LINERASTERIZATIONMODE,
    CREATERESOURCE_INVALIDALIGNMENT_SMALLRESOURCE,
    GENERIC_DEVICE_OPERATION_UNSUPPORTED,
    CREATEGRAPHICSPIPELINESTATE_RENDER_TARGET_WRONG_WRITE_MASK,
    PROBABLE_PIX_EVENT_LEAK,
    PIX_EVENT_UNDERFLOW,
    RECREATEAT_INVALID_TARGET,
    RECREATEAT_INSUFFICIENT_SUPPORT,
    GPU_BASED_VALIDATION_STRUCTURED_BUFFER_STRIDE_MISMATCH,
    MESSAGES_END
}

struct Message
{
    MessageCategory category;
    MessageSeverity severity;
    MessageId id;
    ZString pDescription;
    Win32_SIZE_T descriptionByteLength;
}

struct InfoQueueFilterDesc
{
    uint numCategories;
    MessageCategory* pCategoryList;
    uint numSeverities;
    MessageSeverity* pSeverityList;
    uint numIDs;
    MessageId* pIDList;
}

struct InfoQueueFilter
{
    InfoQueueFilterDesc allowList;
    InfoQueueFilterDesc denyList;
}

const INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT = 1024;

// =============================================================================
// IInfoQueue
// =============================================================================

const IINFO_QUEUE_UUID_STRING = "0742a90b-c387-483f-b946-30a7e4e61458";
const Win32_GUID IINFO_QUEUE_UUID = {
    0x0742a90b, 0xc387, 0x483f, { 0xb9, 0x46, 0x30, 0xa7, 0xe4, 0xe6, 0x14, 0x58 } };

const IINFO_QUEUE1_UUID_STRING = "2852dd88-b484-4c0c-b6b1-67168500e600";
const Win32_GUID IINFO_QUEUE1_UUID = {
    0x2852dd88, 0xb484, 0x4c0c, { 0xb6, 0xb1, 0x67, 0x16, 0x85, 0x00, 0xe6, 0x00 } };

struct IInfoQueue
{
    IInfoQueueVTable* vtbl;
}

typedef IInfoQueue1 = inline IInfoQueue;

// Function pointers of IInfoQueue

alias IInfoQueue_SetMessageCountLimitFn = fn Win32_HRESULT (
    void* self,
    ulong messageCountLimit);

alias IInfoQueue_ClearStoredMessagesFn = fn void (void* self);

alias IInfoQueue_GetMessageFn = fn Win32_HRESULT (
    void* self,
    ulong messageIndex,
    Message* pMessage,
    Win32_SIZE_T* pMessageByteLength);

alias IInfoQueue_GetNumMessagesAllowedByStorageFilterFn = fn ulong (void* self);

alias IInfoQueue_GetNumMessagesDeniedByStorageFilterFn = fn ulong (void* self);

alias IInfoQueue_GetNumStoredMessagesFn = fn ulong (void* self);

alias IInfoQueue_GetNumStoredMessagesAllowedByRetrievalFilterFn = fn ulong (void* self);

alias IInfoQueue_GetNumMessagesDiscardedByMessageCountLimitFn = fn ulong (void* self);

alias IInfoQueue_GetMessageCountLimitFn = fn ulong (void* self);

alias IInfoQueue_AddStorageFilterEntriesFn = fn Win32_HRESULT (
    void* self,
    InfoQueueFilter* pFilter);

alias IInfoQueue_GetStorageFilterFn = fn Win32_HRESULT (
    void* self,
    InfoQueueFilter* pFilter,
    Win32_SIZE_T* pFilterByteLength);

alias IInfoQueue_ClearStorageFilterFn = fn void (void* self);

alias IInfoQueue_PushEmptyStorageFilterFn = fn Win32_HRESULT (void* self);

alias IInfoQueue_PushCopyOfStorageFilterFn = fn Win32_HRESULT (void* self);

alias IInfoQueue_PushStorageFilterFn = fn Win32_HRESULT (
    void* self,
    InfoQueueFilter* pFilter);

alias IInfoQueue_PopStorageFilterFn = fn void (void* self);

alias IInfoQueue_GetStorageFilterStackSizeFn = fn uint (void* self);

alias IInfoQueue_AddRetrievalFilterEntriesFn = fn Win32_HRESULT (
    void* self,
    InfoQueueFilter* pFilter);

alias IInfoQueue_GetRetrievalFilterFn = fn Win32_HRESULT (
    void* self,
    InfoQueueFilter* pFilter,
    Win32_SIZE_T* pFilterByteLength);

alias IInfoQueue_ClearRetrievalFilterFn = fn void (void* self);

alias IInfoQueue_PushEmptyRetrievalFilterFn = fn Win32_HRESULT (void* self);

alias IInfoQueue_PushCopyOfRetrievalFilterFn = fn Win32_HRESULT (void* self);

alias IInfoQueue_PushRetrievalFilterFn = fn Win32_HRESULT (
    void* self,
    InfoQueueFilter* pFilter);

alias IInfoQueue_PopRetrievalFilterFn = fn void (void* self);

alias IInfoQueue_GetRetrievalFilterStackSizeFn = fn uint (void* self);

alias IInfoQueue_AddMessageFn = fn Win32_HRESULT (
    void* self,
    MessageCategory category,
    MessageSeverity severity,
    MessageId id,
    ZString pDescription);

alias IInfoQueue_AddApplicationMessageFn = fn Win32_HRESULT (
    void* self,
    MessageSeverity severity,
    ZString pDescription);

alias IInfoQueue_SetBreakOnCategoryFn = fn Win32_HRESULT (
    void* self,
    MessageCategory category,
    Bool bEnable);

alias IInfoQueue_SetBreakOnSeverityFn = fn Win32_HRESULT (
    void* self,
    MessageSeverity severity,
    Bool bEnable);

alias IInfoQueue_SetBreakOnIDFn = fn Win32_HRESULT (
    void* self,
    MessageId id,
    Bool bEnable);

alias IInfoQueue_GetBreakOnCategoryFn = fn Bool (
    void* self,
    MessageCategory category);

alias IInfoQueue_GetBreakOnSeverityFn = fn Bool (
    void* self,
    MessageSeverity severity);

alias IInfoQueue_GetBreakOnIDFn = fn Bool (
    void* self,
    MessageId id);

alias IInfoQueue_SetMuteDebugOutputFn = fn void (
    void* self,
    Bool bMute);

alias IInfoQueue_GetMuteDebugOutputFn = fn Bool (void* self);

// Function pointers of IInfoQueue1

alias IInfoQueue1_RegisterMessageCallbackFn = fn Win32_HRESULT (
    void* self,
    MessageFunc callbackFunc,
    MessageCallbackFlags callbackFilterFlags,
    void* pContext,
    Win32_DWORD* pCallbackCookie);

alias IInfoQueue1_UnregisterMessageCallbackFn = fn Win32_HRESULT (
    void* self,
    Win32_DWORD callbackCookie);

struct IInfoQueueVTable
{
    inline IUnknownVTable _base;

    // IInfoQueue
    IInfoQueue_SetMessageCountLimitFn setMessageCountLimit;
    IInfoQueue_ClearStoredMessagesFn clearStoredMessages;
    IInfoQueue_GetMessageFn getMessage;
    IInfoQueue_GetNumMessagesAllowedByStorageFilterFn getNumMessagesAllowedByStorageFilter;
    IInfoQueue_GetNumMessagesDeniedByStorageFilterFn getNumMessagesDeniedByStorageFilter;
    IInfoQueue_GetNumStoredMessagesFn getNumStoredMessages;
    IInfoQueue_GetNumStoredMessagesAllowedByRetrievalFilterFn
        getNumStoredMessagesAllowedByRetrievalFilter;
    IInfoQueue_GetNumMessagesDiscardedByMessageCountLimitFn
        getNumMessagesDiscardedByMessageCountLimit;
    IInfoQueue_GetMessageCountLimitFn getMessageCountLimit;
    IInfoQueue_AddStorageFilterEntriesFn addStorageFilterEntries;
    IInfoQueue_GetStorageFilterFn getStorageFilter;
    IInfoQueue_ClearStorageFilterFn clearStorageFilter;
    IInfoQueue_PushEmptyStorageFilterFn pushEmptyStorageFilter;
    IInfoQueue_PushCopyOfStorageFilterFn pushCopyOfStorageFilter;
    IInfoQueue_PushStorageFilterFn pushStorageFilter;
    IInfoQueue_PopStorageFilterFn popStorageFilter;
    IInfoQueue_GetStorageFilterStackSizeFn getStorageFilterStackSize;
    IInfoQueue_AddRetrievalFilterEntriesFn addRetrievalFilterEntries;
    IInfoQueue_GetRetrievalFilterFn getRetrievalFilter;
    IInfoQueue_ClearRetrievalFilterFn clearRetrievalFilter;
    IInfoQueue_PushEmptyRetrievalFilterFn pushEmptyRetrievalFilter;
    IInfoQueue_PushCopyOfRetrievalFilterFn pushCopyOfRetrievalFilter;
    IInfoQueue_PushRetrievalFilterFn pushRetrievalFilter;
    IInfoQueue_PopRetrievalFilterFn popRetrievalFilter;
    IInfoQueue_GetRetrievalFilterStackSizeFn getRetrievalFilterStackSize;
    IInfoQueue_AddMessageFn addMessage;
    IInfoQueue_AddApplicationMessageFn addApplicationMessage;
    IInfoQueue_SetBreakOnCategoryFn setBreakOnCategory;
    IInfoQueue_SetBreakOnSeverityFn setBreakOnSeverity;
    IInfoQueue_SetBreakOnIDFn setBreakOnID;
    IInfoQueue_GetBreakOnCategoryFn getBreakOnCategory;
    IInfoQueue_GetBreakOnSeverityFn getBreakOnSeverity;
    IInfoQueue_GetBreakOnIDFn getBreakOnID;
    IInfoQueue_SetMuteDebugOutputFn setMuteDebugOutput;
    IInfoQueue_GetMuteDebugOutputFn getMuteDebugOutput;

    // IInfoQueue1
    IInfoQueue1_RegisterMessageCallbackFn registerMessageCallback;
    IInfoQueue1_UnregisterMessageCallbackFn unregisterMessageCallback;
}

// Functions of IUnknown

fn Win32_HRESULT IInfoQueue.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);

fn Win32_DWORD IInfoQueue.addRef(&self) @inline => self.vtbl.addRef(self);

fn Win32_DWORD IInfoQueue.release(&self) @inline => self.vtbl.release(self);

// Functions of IInfoQueue

fn Win32_HRESULT IInfoQueue.setMessageCountLimit(
    &self,
    ulong messageCountLimit
) @inline =>
    self.vtbl.setMessageCountLimit(self,messageCountLimit);

fn void IInfoQueue.clearStoredMessages(&self) @inline =>
    self.vtbl.clearStoredMessages(self);

fn Win32_HRESULT IInfoQueue.getMessage(
    &self,
    ulong messageIndex,
    Message* pMessage,
    Win32_SIZE_T* pMessageByteLength
) @inline =>
    self.vtbl.getMessage(self, messageIndex, pMessage, pMessageByteLength);

fn ulong IInfoQueue.getNumMessagesAllowedByStorageFilter(&self) @inline =>
    self.vtbl.getNumMessagesAllowedByStorageFilter(self);

fn ulong IInfoQueue.getNumMessagesDeniedByStorageFilter(&self) @inline =>
    self.vtbl.getNumMessagesDeniedByStorageFilter(self);

fn ulong IInfoQueue.getNumStoredMessages(&self) @inline =>
    self.vtbl.getNumStoredMessages(self);

fn ulong IInfoQueue.getNumStoredMessagesAllowedByRetrievalFilter(&self) @inline =>
    self.vtbl.getNumStoredMessagesAllowedByRetrievalFilter(self);

fn ulong IInfoQueue.getNumMessagesDiscardedByMessageCountLimit(&self) @inline =>
    self.vtbl.getNumMessagesDiscardedByMessageCountLimit(self);

fn ulong IInfoQueue.getMessageCountLimit(&self) @inline =>
    self.vtbl.getMessageCountLimit(self);

fn Win32_HRESULT IInfoQueue.addStorageFilterEntries(
    &self,
    InfoQueueFilter* pFilter
) @inline =>
    self.vtbl.addStorageFilterEntries(self, pFilter);

fn Win32_HRESULT IInfoQueue.getStorageFilter(
    &self,
    InfoQueueFilter* pFilter,
    Win32_SIZE_T* pFilterByteLength
) @inline =>
    self.vtbl.getStorageFilter(self, pFilter, pFilterByteLength);

fn void IInfoQueue.clearStorageFilter(&self) @inline =>
    self.vtbl.clearStorageFilter(self);

fn Win32_HRESULT IInfoQueue.pushEmptyStorageFilter(&self) @inline =>
    self.vtbl.pushEmptyStorageFilter(self);

fn Win32_HRESULT IInfoQueue.pushCopyOfStorageFilter(&self) @inline =>
    self.vtbl.pushCopyOfStorageFilter(self);

fn Win32_HRESULT IInfoQueue.pushStorageFilter(
    &self,
    InfoQueueFilter* pFilter
) @inline =>
    self.vtbl.pushStorageFilter(self, pFilter);

fn void IInfoQueue.popStorageFilter(&self) @inline =>
    self.vtbl.popStorageFilter(self);

fn uint IInfoQueue.getStorageFilterStackSize(&self) @inline =>
    self.vtbl.getStorageFilterStackSize(self);

fn Win32_HRESULT IInfoQueue.addRetrievalFilterEntries(
    &self,
    InfoQueueFilter* pFilter
) @inline =>
    self.vtbl.addRetrievalFilterEntries(self, pFilter);

fn Win32_HRESULT IInfoQueue.getRetrievalFilter(
    &self,
    InfoQueueFilter* pFilter,
    Win32_SIZE_T* pFilterByteLength
) @inline =>
    self.vtbl.getRetrievalFilter(self, pFilter, pFilterByteLength);

fn void IInfoQueue.clearRetrievalFilter(&self) @inline =>
    self.vtbl.clearRetrievalFilter(self);

fn Win32_HRESULT IInfoQueue.pushEmptyRetrievalFilter(&self) @inline =>
    self.vtbl.pushEmptyRetrievalFilter(self);

fn Win32_HRESULT IInfoQueue.pushCopyOfRetrievalFilter(&self) @inline =>
    self.vtbl.pushCopyOfRetrievalFilter(self);

fn Win32_HRESULT IInfoQueue.pushRetrievalFilter(
    &self,
    InfoQueueFilter* pFilter
) @inline =>
    self.vtbl.pushRetrievalFilter(self, pFilter);

fn void IInfoQueue.popRetrievalFilter(&self) @inline =>
    self.vtbl.popRetrievalFilter(self);

fn uint IInfoQueue.getRetrievalFilterStackSize(&self) @inline =>
    self.vtbl.getRetrievalFilterStackSize(self);

fn Win32_HRESULT IInfoQueue.addMessage(
    &self,
    MessageCategory category,
    MessageSeverity severity,
    MessageId id,
    ZString pDescription
) @inline =>
    self.vtbl.addMessage(self, category, severity, id, pDescription);

fn Win32_HRESULT IInfoQueue.addApplicationMessage(
    &self,
    MessageSeverity severity,
    ZString pDescription
) @inline =>
    self.vtbl.addApplicationMessage(self, severity, pDescription);

fn Win32_HRESULT IInfoQueue.setBreakOnCategory(
    &self,
    MessageCategory category,
    Bool bEnable
) @inline =>
    self.vtbl.setBreakOnCategory(self, category, bEnable);

fn Win32_HRESULT IInfoQueue.setBreakOnSeverity(
    &self,
    MessageSeverity severity,
    Bool bEnable
) @inline =>
    self.vtbl.setBreakOnSeverity(self, severity, bEnable);

fn Win32_HRESULT IInfoQueue.setBreakOnID(
    &self,
    MessageId id,
    Bool bEnable
) @inline =>
    self.vtbl.setBreakOnID(self, id, bEnable);

fn Bool IInfoQueue.getBreakOnCategory(
    &self,
    MessageCategory category
) @inline =>
    self.vtbl.getBreakOnCategory(self, category);

fn Bool IInfoQueue.getBreakOnSeverity(
    &self,
    MessageSeverity severity
) @inline =>
    self.vtbl.getBreakOnSeverity(self, severity);

fn Bool IInfoQueue.getBreakOnID(
    &self,
    MessageId id
) @inline =>
    self.vtbl.getBreakOnID(self, id);

fn void IInfoQueue.setMuteDebugOutput(
    &self,
    Bool bMute
) @inline =>
    self.vtbl.setMuteDebugOutput(self, bMute);

fn Bool IInfoQueue.getMuteDebugOutput(&self) @inline =>
    self.vtbl.getMuteDebugOutput(self);

// Functions of IInfoQueue1

fn Win32_HRESULT IInfoQueue.registerMessageCallback(
    &self,
    MessageFunc callbackFunc,
    MessageCallbackFlags callbackFilterFlags,
    void* pContext,
    Win32_DWORD* pCallbackCookie
) @inline =>
    self.vtbl.registerMessageCallback(
        self,
        callbackFunc,
        callbackFilterFlags,
        pContext,
        pCallbackCookie);

fn Win32_HRESULT IInfoQueue.unregisterMessageCallback(
    &self,
    Win32_DWORD callbackCookie
) @inline =>
    self.vtbl.unregisterMessageCallback(self, callbackCookie);

bitstruct MessageCallbackFlags : uint
{
    bool ignoreFilters : 0;
    uint __unused0 : 1..31;
}

const MessageCallbackFlags MESSAGE_CALLBACK_FLAGS_NONE = {};

alias MessageFunc = fn void (
    MessageCategory category,
    MessageSeverity severity,
    MessageId id,
    ZString pDescription,
    void* pContext);
