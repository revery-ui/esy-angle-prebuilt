# esy-angle-prebuilt

Prebuilt binaries for Google's ANGLE library

Provides `libEGL.dll` and `libGLESV2.dll` from ANGLE: https://github.com/google/angle

The dlls are extracted from the `electron` project, and mingw64-compatible libraries are created with gendef.exe

## License

- Source code is MIT Licensed
- `libEGL.dll` and `libGLESV2.dll` are licensed according to the Electron terms at https://github.com/electron/electron
- `gendef.exe` is licensed under the MingW license terms: http://www.mingw.org/license
