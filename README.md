# DirectX Bindings

C3 bindings for **Direct3D 12**, **DXGI**, and **D3D Compiler** APIs.

## Table of Contents

- [Features](#features)
- [COM Interface Overview](#com-interface-overview)
  - [Interface Inheritance](#interface-inheritance)
- [Enumerations](#enumerations)
- [Flags](#flags)
- [Linking](#linking)
- [Examples](#examples)

## Features

- Include bindings as modules for `d3d12`, `dxgi` and `d3dc` (d3dcompiler).
- `D3D12`, `DXGI` and `D3D` prefixes have been stripped from all types, functions and enum
  variants.
- Type-safe wrappers for enumerations (using `enum`) and bit flags (using `bitstruct`).
- Complete COM interface compatibility.

## COM Interface Overview

COM interfaces in these bindings follow the standard COM vtable pattern. Each interface is
represented as a struct containing a pointer to its vtable:

```c
struct IUnknown
{
    IUnknownVTable* vtbl;
}
```

The vtable itself contains function pointers for all interface methods:

```c
struct IUnknownVTable
{
    QueryInterfaceFn queryInterface;
    AddRefFn addRef;
    ReleaseFn release;
}
```

Interface functions are provided as inline wrapper methods that call through the vtable:

```c
fn Win32_HRESULT IUnknown.queryInterface(
    &self,
    Win32_GUID* riid,
    void** ppvObject
) @inline =>
    self.vtbl.queryInterface(self, riid, ppvObject);
```

### Interface Inheritance

COM interfaces inherit from each other by embedding the parent's vtable structure first. For
example, all DirectX interfaces inherit from `IUnknown`, so their vtables begin with
`queryInterface`, `addRef`, and `release`.

Consider `IDebug` which inherits from `IUnknown`:

```c
struct IDebug
{
    IDebugVTable* vtbl;
}

struct IDebugVTable
{
    inline IUnknownVTable _base;  // Inherited methods first
    
    // IDebug-specific methods
    IDebug_EnableDebugLayerFn enableDebugLayer;
}
```

The `inline IUnknownVTable _base;` ensures that the first three function pointers in
`IDebugVTable` are exactly the same as `IUnknownVTable`:

1. `queryInterface`
2. `addRef`
3. `release`

This means an `IDebug*` can be safely cast to `IUnknown*` because they share the same memory
layout at the beginning.

## Enumerations

Most enums are sequential, but when there are gaps in the original values, `__UNUSED*` entries
are added to maintain proper indexing:

```c
enum StateObjectType : int
{
    COLLECTION,
    __UNUSED0,
    __UNUSED1,
    RAYTRACING_PIPELINE,
    EXECUTABLE,
}
```

However, when the enum has large gaps that would be impractical to fill, constants are used
instead:

```c
typedef SamplerFeedbackTier = int;
const SamplerFeedbackTier SAMPLER_FEEDBACK_TIER_NOT_SUPPORTED = 0;
const SamplerFeedbackTier SAMPLER_FEEDBACK_TIER_0_9           = 90;
const SamplerFeedbackTier SAMPLER_FEEDBACK_TIER_1_0           = 100;
```

## Flags

C3's `bitstruct` feature provides type-safe, efficient handling for all flags:

```c
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
```

## Linking

To use these D3D12 bindings, the required libraries need to be avaiable:

### Required Libraries

```json
// In the manifest.json configuration
"linked-libraries": [
    "d3d12",           // System library - D3D12 core functionality  
    "dxgi",            // System library - DirectX Graphics Infrastructure
    "d3dcompiler_47",  // Provided library - Shader compilation
    "user32",          // System library - Windows user interface
    "gdi32"            // System library - Graphics Device Interface
]
```

### Library Details

**System Libraries (Windows SDK):**

- `d3d12.lib` - Core Direct3D 12 runtime, handles device creation, command lists, resources
- `dxgi.lib` - DXGI interfaces for swap chains, adapters, and display management  
- `user32.lib` - Windows user interface functions, needed for window creation and message handling
- `gdi32.lib` - Graphics Device Interface, provides basic graphics operations and device contexts

**Provided Library:**

- `d3dcompiler_47.lib` - D3D shader compiler library, included with these bindings since it's
  not always present in the Windows SDK by default

## Examples

For a complete working example, see the [Hello Triangle][] sample.

[Hello Triangle]: ./examples/hello_triangle/hello_triangle.c3
