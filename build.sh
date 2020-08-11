#! /bin/bash

if [[ $OS == "windows" ]]
then
    WINDOWS_PYTHON_PATH="$(cygpath -w $(which $PYTHON_BINARY))"
    bin/gn gen $cur__target_dir/out/Shared --script-executable="$WINDOWS_PYTHON_PATH" --args='is_debug=false is_component_build=true' || exit -1
    ninja.exe -C $cur__target_dir/out/Shared
    mv $cur__target_dir/out/Shared/libskia.dll $cur__target_dir/out/Shared/skia.dll # TODO this might not be required once we merge upstream
    gendef.exe - $cur__target_dir/libEGL.dll > $cur__target_dir/libEGL.def
    gendef.exe - $cur__target_dir/libGLESv2.dll > $cur__target_dir/libGLESv2.def
    x86_64-W64-mingw32-dlltool.exe -D $cur__target_dir/libEGL.dll -d $cur__target_dir/libEGL.def -A -l $cur__target_dir/libEGL.a
    x86_64-W64-mingw32-dlltool.exe -D $cur__target_dir/libGLESv2.dll -d $cur__target_dir/libGLESv2.def -A -l $cur__target_dir/libGLESv2.a
else
    echo "ANGLE is unused on non-windows platforms; skipping build."
fi
