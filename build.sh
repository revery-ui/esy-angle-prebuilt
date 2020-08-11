#! /bin/bash

OS=$1

if [[ $OS == "windows" ]]
then
    # Get electron-prebuilt to extract ANGLE dlls from:
    mkdir _temp
    curl -LJ https://github.com/electron/electron/releases/download/v9.2.0/electron-v9.2.0-win32-x64.zip -o _temp/electron-prebuilt.zip
    ls _temp
    unzip _temp/electron-prebuilt.zip
    ls _temp
    gendef.exe - $cur__target_dir/libEGL.dll > $cur__target_dir/libEGL.def
    gendef.exe - $cur__target_dir/libGLESv2.dll > $cur__target_dir/libGLESv2.def
    x86_64-W64-mingw32-dlltool.exe -D $cur__target_dir/libEGL.dll -d $cur__target_dir/libEGL.def -A -l $cur__target_dir/libEGL.a
    x86_64-W64-mingw32-dlltool.exe -D $cur__target_dir/libGLESv2.dll -d $cur__target_dir/libGLESv2.def -A -l $cur__target_dir/libGLESv2.a
else
    echo "ANGLE is unused on non-windows platforms; skipping build."
fi
