module directx::dxgi;

import std::os::win32;

const DEBUG_BINARY_VERSION = 1;

bitstruct DebugRloFlags : uint
{
    bool summary        : 0;
    bool detail         : 1;
    bool ignoreInternal : 2;
    uint __unused0      : 3..31;
}

const DebugRloFlags DEBUG_RLO_FLAGS_ALL = { .summary, .detail, .ignoreInternal };

const Win32_GUID DEBUG_ALL = {
    0xe48ae283, 0xda80, 0x490b, { 0x87, 0xe6, 0x43, 0xe9, 0xa9, 0xcf, 0xda, 0x8 } };

const Win32_GUID DEBUG_DX = {
    0x35cdd7fc, 0x13b2, 0x421d, { 0xa5, 0xd7, 0x7e, 0x44, 0x51, 0x28, 0x7d, 0x64 } };

const Win32_GUID DEBUG_DXGI = {
    0x25cddaa4, 0xb1c6, 0x47e1, { 0xac, 0x3e, 0x98, 0x87, 0x5b, 0x5a, 0x2e, 0x2a } };

const Win32_GUID DEBUG_APP = {
    0x6cd6e01, 0x4219, 0x4ebd, { 0x87, 0x9, 0x27, 0xed, 0x23, 0x36, 0xc, 0x62 } };

enum InfoQueueMessageCategory : int
{
    UNKNOWN,
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

enum InfoQueueMessageSeverity : int
{
    CORRUPTION,
    ERROR,
    WARNING,
    INFO,
    MESSAGE,
}

typedef InfoQueueMessageId = inline int;

const INFO_QUEUE_MESSAGE_ID_STRING_FROM_APPLICATION = 0;

struct InfoQueueMessage
{
    Win32_GUID producer;
    InfoQueueMessageCategory category;
    InfoQueueMessageSeverity severity;
    InfoQueueMessageId id;
    ZString pDescription;
    Win32_SIZE_T descriptionByteLength;
}

struct InfoQueueFilterDesc
{
    uint numCategories;
    InfoQueueMessageCategory* pCategoryList;
    uint numSeverities;
    InfoQueueMessageSeverity* pSeverityList;
    uint numIDs;
    InfoQueueMessageId* pIDList;
}

struct InfoQueueFilter
{
    InfoQueueFilterDesc allowList;
    InfoQueueFilterDesc denyList;
}

const INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT = 1024;

extern fn Win32_HRESULT getDebugInterface(
    Win32_GUID* riid,
    void** ppDebug
) @extern("DXGIGetDebugInterface");

// =============================================================================
// IInfoQueue
// =============================================================================

const IINFO_QUEUE_UUID_STRING = "D67441C7-672A-476f-9E82-CD55B44949CE";
const Win32_GUID IINFO_QUEUE_UUID = {
    0xD67441C7, 0x672A, 0x476f, {0x9E, 0x82, 0xCD, 0x55, 0xB4, 0x49, 0x49, 0xCE } };

struct IInfoQueue
{
    IInfoQueueVTable* vtbl;
}

alias IInfoQueue_SetMessageCountLimitFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer,
    ulong messageCountLimit);

alias IInfoQueue_ClearStoredMessagesFn = fn void (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_GetMessageFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer,
    ulong messageIndex,
    InfoQueueMessage* pMessage,
    Win32_SIZE_T* pMessageByteLength);

alias IInfoQueue_GetNumStoredMessagesAllowedByRetrievalFiltersFn = fn ulong (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_GetNumStoredMessagesFn = fn ulong (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_GetNumMessagesDiscardedByMessageCountLimitFn = fn ulong (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_GetMessageCountLimitFn = fn ulong (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_GetNumMessagesAllowedByStorageFilterFn = fn ulong (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_GetNumMessagesDeniedByStorageFilterFn = fn ulong (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_AddStorageFilterEntriesFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer,
    InfoQueueFilter* pFilter);

alias IInfoQueue_GetStorageFilterFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer,
    InfoQueueFilter* pFilter,
    Win32_SIZE_T* pFilterByteLength);

alias IInfoQueue_ClearStorageFilterFn = fn void (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_PushEmptyStorageFilterFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_PushDenyAllStorageFilterFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_PushCopyOfStorageFilterFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_PushStorageFilterFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer,
    InfoQueueFilter* pFilter);

alias IInfoQueue_PopStorageFilterFn = fn void (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_GetStorageFilterStackSizeFn = fn uint (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_AddRetrievalFilterEntriesFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer,
    InfoQueueFilter* pFilter);

alias IInfoQueue_GetRetrievalFilterFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer,
    InfoQueueFilter* pFilter,
    Win32_SIZE_T* pFilterByteLength);

alias IInfoQueue_ClearRetrievalFilterFn = fn void (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_PushEmptyRetrievalFilterFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_PushDenyAllRetrievalFilterFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_PushCopyOfRetrievalFilterFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_PushRetrievalFilterFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer,
    InfoQueueFilter* pFilter);

alias IInfoQueue_PopRetrievalFilterFn = fn void (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_GetRetrievalFilterStackSizeFn = fn uint (
    void* self,
    Win32_GUID producer);

alias IInfoQueue_AddMessageFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer,
    InfoQueueMessageCategory category,
    InfoQueueMessageSeverity severity,
    InfoQueueMessageId id,
    Win32_LPCSTR pDescription);

alias IInfoQueue_AddApplicationMessageFn = fn Win32_HRESULT (
    void* self,
    InfoQueueMessageSeverity severity,
    Win32_LPCSTR pDescription);

alias IInfoQueue_SetBreakOnCategoryFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer,
    InfoQueueMessageCategory category,
    Bool bEnable);

alias IInfoQueue_SetBreakOnSeverityFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer,
    InfoQueueMessageSeverity severity,
    Bool bEnable);

alias IInfoQueue_SetBreakOnIDFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID producer,
    InfoQueueMessageId id,
    Bool bEnable);

alias IInfoQueue_GetBreakOnCategoryFn = fn Bool (
    void* self,
    Win32_GUID producer,
    InfoQueueMessageCategory category);

alias IInfoQueue_GetBreakOnSeverityFn = fn Bool (
    void* self,
    Win32_GUID producer,
    InfoQueueMessageSeverity severity);

alias IInfoQueue_GetBreakOnIDFn = fn Bool (
    void* self,
    Win32_GUID producer,
    InfoQueueMessageId id);

alias IInfoQueue_SetMuteDebugOutputFn = fn void (
    void* self,
    Win32_GUID producer,
    Bool bMute);

alias IInfoQueue_GetMuteDebugOutputFn = fn Bool (
    void* self,
    Win32_GUID producer);

struct IInfoQueueVTable
{
    inline IUnknownVTable _base;
    IInfoQueue_SetMessageCountLimitFn setMessageCountLimit;
    IInfoQueue_ClearStoredMessagesFn clearStoredMessages;
    IInfoQueue_GetMessageFn getMessage;
    IInfoQueue_GetNumStoredMessagesAllowedByRetrievalFiltersFn getNumStoredMessagesAllowedByRetrievalFilters;
    IInfoQueue_GetNumStoredMessagesFn getNumStoredMessages;
    IInfoQueue_GetNumMessagesDiscardedByMessageCountLimitFn getNumMessagesDiscardedByMessageCountLimit;
    IInfoQueue_GetMessageCountLimitFn getMessageCountLimit;
    IInfoQueue_GetNumMessagesAllowedByStorageFilterFn getNumMessagesAllowedByStorageFilter;
    IInfoQueue_GetNumMessagesDeniedByStorageFilterFn getNumMessagesDeniedByStorageFilter;
    IInfoQueue_AddStorageFilterEntriesFn addStorageFilterEntries;
    IInfoQueue_GetStorageFilterFn getStorageFilter;
    IInfoQueue_ClearStorageFilterFn clearStorageFilter;
    IInfoQueue_PushEmptyStorageFilterFn pushEmptyStorageFilter;
    IInfoQueue_PushDenyAllStorageFilterFn pushDenyAllStorageFilter;
    IInfoQueue_PushCopyOfStorageFilterFn pushCopyOfStorageFilter;
    IInfoQueue_PushStorageFilterFn pushStorageFilter;
    IInfoQueue_PopStorageFilterFn popStorageFilter;
    IInfoQueue_GetStorageFilterStackSizeFn getStorageFilterStackSize;
    IInfoQueue_AddRetrievalFilterEntriesFn addRetrievalFilterEntries;
    IInfoQueue_GetRetrievalFilterFn getRetrievalFilter;
    IInfoQueue_ClearRetrievalFilterFn clearRetrievalFilter;
    IInfoQueue_PushEmptyRetrievalFilterFn pushEmptyRetrievalFilter;
    IInfoQueue_PushDenyAllRetrievalFilterFn pushDenyAllRetrievalFilter;
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
    Win32_GUID producer,
    ulong messageCountLimit
) @inline =>
    self.vtbl.setMessageCountLimit(self, producer, messageCountLimit);

fn void IInfoQueue.clearStoredMessages(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.clearStoredMessages(self, producer);

fn Win32_HRESULT IInfoQueue.getMessage(
    &self,
    Win32_GUID producer,
    ulong messageIndex,
    InfoQueueMessage* pMessage,
    Win32_SIZE_T* pMessageByteLength
) @inline =>
    self.vtbl.getMessage(self, producer, messageIndex, pMessage, pMessageByteLength);

fn ulong IInfoQueue.getNumStoredMessagesAllowedByRetrievalFilters(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.getNumStoredMessagesAllowedByRetrievalFilters(self, producer);

fn ulong IInfoQueue.getNumStoredMessages(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.getNumStoredMessages(self, producer);

fn ulong IInfoQueue.getNumMessagesDiscardedByMessageCountLimit(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.getNumMessagesDiscardedByMessageCountLimit(self, producer);

fn ulong IInfoQueue.getMessageCountLimit(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.getMessageCountLimit(self, producer);

fn ulong IInfoQueue.getNumMessagesAllowedByStorageFilter(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.getNumMessagesAllowedByStorageFilter(self, producer);

fn ulong IInfoQueue.getNumMessagesDeniedByStorageFilter(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.getNumMessagesDeniedByStorageFilter(self, producer);

fn Win32_HRESULT IInfoQueue.addStorageFilterEntries(
    &self,
    Win32_GUID producer,
    InfoQueueFilter* pFilter
) @inline =>
    self.vtbl.addStorageFilterEntries(self, producer, pFilter);

fn Win32_HRESULT IInfoQueue.getStorageFilter(
    &self,
    Win32_GUID producer,
    InfoQueueFilter* pFilter,
    Win32_SIZE_T* pFilterByteLength
) @inline =>
    self.vtbl.getStorageFilter(self, producer, pFilter, pFilterByteLength);

fn void IInfoQueue.clearStorageFilter(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.clearStorageFilter(self, producer);

fn Win32_HRESULT IInfoQueue.pushEmptyStorageFilter(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.pushEmptyStorageFilter(self, producer);

fn Win32_HRESULT IInfoQueue.pushDenyAllStorageFilter(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.pushDenyAllStorageFilter(self, producer);

fn Win32_HRESULT IInfoQueue.pushCopyOfStorageFilter(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.pushCopyOfStorageFilter(self, producer);

fn Win32_HRESULT IInfoQueue.pushStorageFilter(
    &self,
    Win32_GUID producer,
    InfoQueueFilter* pFilter
) @inline =>
    self.vtbl.pushStorageFilter(self, producer, pFilter);

fn void IInfoQueue.popStorageFilter(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.popStorageFilter(self, producer);

fn uint IInfoQueue.getStorageFilterStackSize(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.getStorageFilterStackSize(self, producer);

fn Win32_HRESULT IInfoQueue.addRetrievalFilterEntries(
    &self,
    Win32_GUID producer,
    InfoQueueFilter* pFilter
) @inline =>
    self.vtbl.addRetrievalFilterEntries(self, producer, pFilter);

fn Win32_HRESULT IInfoQueue.getRetrievalFilter(
    &self,
    Win32_GUID producer,
    InfoQueueFilter* pFilter,
    Win32_SIZE_T* pFilterByteLength
) @inline =>
    self.vtbl.getRetrievalFilter(self, producer, pFilter, pFilterByteLength);

fn void IInfoQueue.clearRetrievalFilter(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.clearRetrievalFilter(self, producer);

fn Win32_HRESULT IInfoQueue.pushEmptyRetrievalFilter(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.pushEmptyRetrievalFilter(self, producer);

fn Win32_HRESULT IInfoQueue.pushDenyAllRetrievalFilter(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.pushDenyAllRetrievalFilter(self, producer);

fn Win32_HRESULT IInfoQueue.pushCopyOfRetrievalFilter(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.pushCopyOfRetrievalFilter(self, producer);

fn Win32_HRESULT IInfoQueue.pushRetrievalFilter(
    &self,
    Win32_GUID producer,
    InfoQueueFilter* pFilter
) @inline =>
    self.vtbl.pushRetrievalFilter(self, producer, pFilter);

fn void IInfoQueue.popRetrievalFilter(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.popRetrievalFilter(self, producer);

fn uint IInfoQueue.getRetrievalFilterStackSize(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.getRetrievalFilterStackSize(self, producer);

fn Win32_HRESULT IInfoQueue.addMessage(
    &self,
    Win32_GUID producer,
    InfoQueueMessageCategory category,
    InfoQueueMessageSeverity severity,
    InfoQueueMessageId id,
    Win32_LPCSTR pDescription
) @inline =>
    self.vtbl.addMessage(self, producer, category, severity, id, pDescription);

fn Win32_HRESULT IInfoQueue.addApplicationMessage(
    &self,
    InfoQueueMessageSeverity severity,
    Win32_LPCSTR pDescription
) @inline =>
    self.vtbl.addApplicationMessage(self, severity, pDescription);

fn Win32_HRESULT IInfoQueue.setBreakOnCategory(
    &self,
    Win32_GUID producer,
    InfoQueueMessageCategory category,
    Bool bEnable
) @inline =>
    self.vtbl.setBreakOnCategory(self, producer, category, bEnable);

fn Win32_HRESULT IInfoQueue.setBreakOnSeverity(
    &self,
    Win32_GUID producer,
    InfoQueueMessageSeverity severity,
    Bool bEnable
) @inline =>
    self.vtbl.setBreakOnSeverity(self, producer, severity, bEnable);

fn Win32_HRESULT IInfoQueue.setBreakOnID(
    &self,
    Win32_GUID producer,
    InfoQueueMessageId id,
    Bool bEnable
) @inline =>
    self.vtbl.setBreakOnID(self, producer, id, bEnable);

fn Bool IInfoQueue.getBreakOnCategory(
    &self,
    Win32_GUID producer,
    InfoQueueMessageCategory category
) @inline =>
    self.vtbl.getBreakOnCategory(self, producer, category);

fn Bool IInfoQueue.getBreakOnSeverity(
    &self,
    Win32_GUID producer,
    InfoQueueMessageSeverity severity
) @inline =>
    self.vtbl.getBreakOnSeverity(self, producer, severity);

fn Bool IInfoQueue.getBreakOnID(
    &self,
    Win32_GUID producer,
    InfoQueueMessageId id
) @inline =>
    self.vtbl.getBreakOnID(self, producer, id);

fn void IInfoQueue.setMuteDebugOutput(
    &self,
    Win32_GUID producer,
    Bool bMute
) @inline =>
    self.vtbl.setMuteDebugOutput(self, producer, bMute);

fn Bool IInfoQueue.getMuteDebugOutput(
    &self,
    Win32_GUID producer
) @inline =>
    self.vtbl.getMuteDebugOutput(self, producer);

// =============================================================================
// IDebug
// =============================================================================

const IDEBUG_UUID_STRING = "119E7452-DE9E-40fe-8806-88F90C12B441";
const Win32_GUID IDEBUG_UUID = {
    0x119E7452, 0xDE9E, 0x40fe, {0x88, 0x06, 0x88, 0xF9, 0x0C, 0x12, 0xB4, 0x41 } };

struct IDebug
{
    IDebugVTable* vtbl;
}

typedef IDebug1 = inline IDebug;
const IDEBUG1_UUID_STRING = "c5a05f0c-16f2-4adf-9f4d-a8c4d58ac550";
const Win32_GUID IDEBUG1_UUID = {
    0xc5a05f0c, 0x16f2, 0x4adf, {0x9f, 0x4d, 0xa8, 0xc4, 0xd5, 0x8a, 0xc5, 0x50 } };

// Function pointers of IDebug

alias IDebug_ReportLiveObjectsFn = fn Win32_HRESULT (
    void* self,
    Win32_GUID apiid,
    DebugRloFlags flags);

// Function pointers of IDebug1

alias IDebug1_EnableLeakTrackingForThreadFn = fn void (void* self);

alias IDebug1_DisableLeakTrackingForThreadFn = fn void (void* self);

alias IDebug1_IsLeakTrackingEnabledForThreadFn = fn Bool (void* self);

struct IDebugVTable
{
    inline IUnknownVTable _base;

    // IDebug
    IDebug_ReportLiveObjectsFn reportLiveObjects;

    // IDebug1
    IDebug1_EnableLeakTrackingForThreadFn enableLeakTrackingForThread;
    IDebug1_DisableLeakTrackingForThreadFn disableLeakTrackingForThread;
    IDebug1_IsLeakTrackingEnabledForThreadFn isLeakTrackingEnabledForThread;
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

// Function of IDebug

fn Win32_HRESULT IDebug.reportLiveObjects(
    &self,
    Win32_GUID apiid,
    DebugRloFlags flags
) @inline =>
    self.vtbl.reportLiveObjects(self, apiid, flags);

// Function of IDebug1

fn void IDebug.enableLeakTrackingForThread(&self) @inline =>
    self.vtbl.enableLeakTrackingForThread(self);

fn void IDebug.disableLeakTrackingForThread(&self) @inline =>
    self.vtbl.disableLeakTrackingForThread(self);

fn Bool IDebug.isLeakTrackingEnabledForThread(&self) @inline =>
    self.vtbl.isLeakTrackingEnabledForThread(self);
