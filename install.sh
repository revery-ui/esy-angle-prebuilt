#! /bin/bash

OS=$1

# Copy artifacts into output directories
if [[ $OS == 'windows' ]]
then
    cp $cur__target_dir/libEGL.dll $cur__bin
    cp $cur__target_dir/libGLESv2.dll $cur__bin
    
    cp $cur__target_dir/libEGL.a $cur__lib
    cp $cur__target_dir/libGLESv2.a $cur__lib
    
    cp $cur__target_dir/libEGL.def $cur__lib
    cp $cur__target_dir/libGLESv2.def $cur__lib
fi
