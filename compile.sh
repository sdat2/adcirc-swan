#!/bin/bash


module load eb/GCC/8.2.0 
module load gcc/8.2.0
module load jasmin-sci
module load eb/OpenMPI/gcc/4.0.0
module load libPHDF5/gnu/4.4.7/1.8.12
module load libpnetcdf/gnu/4.4.7/1.5.0
module load netcdf/gnu/4.4.7/4.3.2
module load netcdff/gnu/4.4.7/4.2
module load parallel-netcdf/gnu/20141122
# netcdf/intel/14.0/4.3.2

nf-config --all
nc-config --all

cd adcirc/work

# turned on swan, seemed to work? 

cmake .. -DCMAKE_C_COMPILER="/usr/bin/gcc" -DCMAKE_CXX_COMPILER="/usr/bin/gcc" -DCMAKE_Fortran_COMPILER="/usr/bin/gfortran" -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=OFF -DBUILD_ADCPREP=OFF -DBUILD_ADCSWAN=OFF -DBUILD_PADCSWAN=OFF -DENABLE_OUTPUT_NETCDF=ON -DFortran_COMPILER_SPECIFIC_FLAG="-ffixed-line-length-132 -I/usr/include" -DC-DFortran_LINELENGTH_FLAG="-ffixed-line-length-132" -DCMAKE_C_FLAGS:STRING="-I/usr/include -I/usr/include/hdf  -lnetcdff " -DCMAKE_Fortran_FLAGS="-ffree-line-length-132  -ffixed-line-length-132 -lnetcdff -DREAL8 -DCSCA -DLINUX -w -O2" # -DNETCDF_LIBRARIES="/usr/lib64" -DNETCDF_LIBRARY="/usr/lib64/libnetcdf.so"

# /usr/lib64/libnetcdf.so

make
