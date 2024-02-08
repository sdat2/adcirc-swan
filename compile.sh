#!/bin/bash

# module load PrgEnv-gnu/8.0.0
# module load cray-hdf5-parallel
#module load cray-netcdf-hdf5parallel
module load PrgEnv-gnu/8.3.3
module load cray-hdf5-parallel/1.12.2.1
module load cray-parallel-netcdf/1.12.3.1
module load cray-mpich/8.1.23
# module load PrgEnv-gnu/8.3.3
# module load other-software
# module load openmpi

sw="-ffixed-line-length-72 -ffree-line-length-72"
ll="-ffixed-line-length-132 -ffree-line-length-132"
nc="/opt/cray/pe/netcdf/default/gnu/9.1"
nci="/opt/cray/pe/netcdf/default/gnu/9.1/include"
ncl="/opt/cray/pe/netcdf/default/gnu/9.1/lib"

#export PATH=/opt/cray/pe/mpich/8.1.23/ofi/gnu/9.1/bin:$nc:$PATH
#export LD_LIBRARY_PATH=/opt/cray/pe/mpich/8.1.23/ofi/gnu/9.1/lib:/opt/cray/pe/mpich/8.1.23/ofi/gnu/9.1/lib64:$LD_LIBRARY_PATH
#export NETCDF_C_DIR=$ncl
#export NETCDF_FORTRAN_DIR=$ncl
export NetCDF_DIR=/opt/cray/pe/netcdf/default/gnu/9.1

# echo $PATH
# echo $LD_LIBRARY_PATH

cd adcirc
cd work


sw="-ffixed-line-length-72 -ffree-line-length-72"
ll="-ffixed-line-length-132 -ffree-line-length-132"
# turned on swan, seemed to work? # -CMAKE_BUILD_TYPE=Debug \

cmake .. -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=cc \
 -DCMAKE_Fortran_COMPILER=ftn -DBUILD_ADCIRC=ON \
 -DBUILD_PADCIRC=ON  -DBUILD_ADCPREP=ON \
 -DBUILD_ADCSWAN=ON -DENABLE_OUTPUT_NETCDF=ON\
 -DBUILD_PADCSWAN=ON -DCMAKE_Fortran_FLAGS="-DREAL8 -DCSCA -DLINUX -w -fallow-argument-mismatch -O2 ${ll}" \
 -DADDITIONAL_FLAGS_SWAN="${sw}" -DADDITIONAL_FLAGS_ADCPREP="${ll}" \
 -DADDITIONAL_FLAGS_ADCIRC="${ll}" \
  -DADDITIONAL_FLAGS_ASWIP="${ll}" \
  -DADDITIONAL_FLAGS_UTILITIES="${ll}" \
  -DNETCDF_C_INCLUDE_DIR=/opt/cray/pe/netcdf/default/bin \
  -DNETCDF_C_LIBRARY=/opt/cray/pe/netcdf/default/gnu/9.1/lib/libnetcdf.so \
  -DNETCDF_Fortran_INCLUDE_DIR=/opt/cray/pe/netcdf/4.9.0.1/bin \
  -DNETCDF_Fortran_LIBRARY=/opt/cray/pe/netcdf/default/gnu/9.1/lib/libnetcdff.so \
  -DNETCDF_LIBRARIES="/opt/cray/pe/netcdf/default/gnu/9.1/lib/libnetcdf.so;/opt/cray/pe/netcdf/default/gnu/9.1/lib/libnetcdff.so"


#cmake -DCMAKE_C_COMPILER=/opt/cray/pe/mpich/8.1.23/ofi/gnu/9.1/bin/mpicc \
#      -DCMAKE_CXX_COMPILER=/opt/cray/pe/mpich/8.1.23/ofi/gnu/9.1/bin/mpicxx \
#      -DCMAKE_Fortran_COMPILER=/opt/cray/pe/mpich/8.1.23/ofi/gnu/9.1/bin/mpifort \

make
