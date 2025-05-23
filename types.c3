module directx;

import std::os::win32;
import std::io;

// To replace Win32_BOOL
enum Bool : inline int
{
	FALSE,
	TRUE
}

macro succeeded(hr) => ((Win32_HRESULT)hr) >= 0;

macro failed(hr) => ((Win32_HRESULT)hr) < 0;

faultdef
    CHECK_FAULT;

macro check(Win32_HRESULT hr) => failed(hr) ? CHECK_FAULT? : hr;

macro check_error(Win32_HRESULT hr, String message = "")
{
    if (catch err = check(hr))
    {
        io::eprintfn("%s. Error code: 0x%08X", message.len ? message : "D3D12 Error", (uint)hr);
        return err?;
    }
    return hr;
}

macro fail_if(Win32_HRESULT hr, String message = "") => check_error(hr, message)!!;
