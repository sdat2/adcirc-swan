#!/bin/bash

module load PrgEnv-gnu/8.3.3
module load cray-hdf5-parallel/1.12.2.1
module load cray-parallel-netcdf/1.12.3.1

sw="-ffixed-line-length-72 -ffree-line-length-72"
ll="-ffixed-line-length-132 -ffree-line-length-132"
ncl="$(pnetcdf-config --libdir)"
nci="$(pnetcdf-config --includedir)"
echo "NETCDF_LIBRARY_DIR: ${ncl}"
echo "NETCDF_INCLUDE_DIR: ${nci}"

which ftn
ftn --version
which cc
cc --version

export NETCDF_DIR=/opt/cray/pe/parallel-netcdf/1.12.3.1/gnu/9.1/
# export NETCDF_INCLUDE_DIR=/opt/cray/pe/parallel-netcdf/1.12.3.1/gnu/9.1/include
# export NETCDF_LIBRARY=/opt/cray/pe/parallel-netcdf/1.12.3.1/gnu/9.1/lib
export Fortran_LINELENGTH_FLAG="${ll}"

cd adcirc
cd work

cmake .. --debug-output -DCMAKE_C_COMPILER=cc \
        -DCMAKE_CXX_COMPILER=cc \
        -DCMAKE_Fortran_COMPILER=ftn \
        -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON \
        -DBUILD_ADCPREP=ON -DBUILD_ADCSWAN=OFF \
        -DENABLE_OUTPUT_NETCDF=ON -DBUILD_PADCSWAN=OFF \
        -DCMAKE_Fortran_FLAGS="-DREAL8 -DCSCA -DLINUX -w -fallow-argument-mismatch -O2" \
        -DFortran_LINELENGTH_FLAG="${ll}" \
        -DADDITIONAL_FLAGS_SWAN="${swan}" \
        -DADDITIONAL_FLAGS_ADCPREP="${ll}"  \
        -DADDITIONAL_FLAGS_ADCIRC="${ll}" \
        -DADDITIONAL_FLAGS_ASWIP="${ll}" \
        -DADDITIONAL_FLAGS_UTILITIES="${ll}" \
        -DNETCDFHOME="${NETCDF_DIR}" \
        -DNETCDF_LIBRARY="${ncl}" -DNETCDF_INCLUDE_DIR="${nci}" \

make
