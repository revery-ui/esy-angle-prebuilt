#! /bin/bash

OS=$1

if [[ $OS == "windows" ]]
then
    gendef.exe - $cur__target_dir/libEGL.dll > $cur__target_dir/libEGL.def
    gendef.exe - $cur__target_dir/libGLESv2.dll > $cur__target_dir/libGLESv2.def
    x86_64-W64-mingw32-dlltool.exe -D $cur__target_dir/libEGL.dll -d $cur__target_dir/libEGL.def -A -l $cur__target_dir/libEGL.a
    x86_64-W64-mingw32-dlltool.exe -D $cur__target_dir/libGLESv2.dll -d $cur__target_dir/libGLESv2.def -A -l $cur__target_dir/libGLESv2.a
else
    echo "ANGLE is unused on non-windows platforms; skipping build."
fi
