#!/bin/bash

# 'eval "$(/opt/homebrew/bin/brew shellenv)"'

echo $PATH 

cd adcirc/work

# turned on swan, seemed to work?
gcc=/opt/homebrew/bin/gcc-12
cmake .. -DCMAKE_C_COMPILER=$gcc -DCMAKE_CXX_COMPILER=$gcc -DCMAKE_Fortran_COMPILER=$gcc -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON -DBUILD_ADCPREP=ON -DBUILD_LIBADCIRC_SHARED=ON -DBUILD_LIBADCIRC_SHARED=ON -DBUILD_SWAN=ON -DBUILD_UTILITIES=ON -DBUILD_ADCSWAN=ON -DBUILD_PADCSWAN=ON  -DBUILD_PUNSWAN=ON -DADDITIONAL_FLAGS_SWAN="-ffixed-line-length-73 -ffree-line-length-73" -DENABLE_OUTPUT_NETCDF=ON -DNETCDF_LIBRARIES="/opt/homebrew/Cellar/netcdf/4.9.0/bin" -DFortran_LINELENGTH_FLAG="-ffixed-line-length-132 -ffree-line-length-132" -DCMAKE_Fortran_FLAGS="-ffree-line-length-132  -ffixed-line-length-132 -O2" #-fallow-argument-mismatch -O2"

# need to allow argument mismatch in modern fortran https://github.com/Unidata/netcdf-fortran/issues/212

cmake --build ..
# make
# cmake
