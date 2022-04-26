# adcirc-swan

ADCIRC-SWAN version.

```bash
docker pull asgsdockerhub/asgs

singularity pull docker://zcobell/adcirc_20200513:latest

singularity pull docker://zcobell/adcirc_20191101

singularity pull docker://asgsdockerhub/asgs

singularity pull docker://zcobell/adcirc_20170924

singularity shell --bind /work/n01/n01/sithom/adcirc-swan singularity/asgs -nv

   cmake .. -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=cc -DCMAKE_Fortran_COMPILER=ftn -DCMAKE_Fortran_FLAGS=-N 132
    -DFortran_LINELENGTH_FLAG="-N 132"
   cmake .. -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=cc -DCMAKE_Fortran_COMPILER=ftn -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON -DBUILD_ADCPREP=OFF -DBUILD_ADCSWAN=OFF 
   Fortran_COMPILER_SPECIFIC_FLAG="-N 132"
   -DBUILD_PADCSWAN=OFF -DFortran_LINELENGTH_FLAG="-N 132"

cmake .. -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=cc -DCMAKE_Fortran_COMPILER=ftn -DBUILD_ADCIRC=ON -DBUILD_PADCIRC=ON -DBUILD_ADCPREP=ON -DBUILD_ADCSWAN=OFF -DFortran_COMPILER_SPECIFIC_FLAG=-ffixed-line-length-132 -DBUILD_PADCSWAN=OFF -DFortran_LINELENGTH_FLAG=-ffixed-line-length-132 -DCMAKE_Fortran_FLAGS="-ffree-line-length-132  -ffixed-line-length-132 -DREAL8 -DCSCA -DLINUX -w -fallow-argument-mismatch -O2"


//Executable for running MPI programs.
MPIEXEC_EXECUTABLE:FILEPATH=/usr/lib64/mpi/gcc/openmpi/bin/mpirun

//MPI compiler for CXX
MPI_CXX_COMPILER:FILEPATH=/opt/cray/pe/craype/2.7.6/bin/cc

//MPI compiler for C
MPI_C_COMPILER:FILEPATH=/opt/cray/pe/craype/2.7.6/bin/cc

//MPI compiler for Fortran
MPI_Fortran_COMPILER:FILEPATH=/opt/cray/pe/craype/2.7.6/bin/ftns
```

```
https://wiki.adcirc.org/wiki/Compiling
```

mpif90 libmpich-dev_3.0.4-6ubuntu1_amd64


module load cray-mpich-abi/8.1.4 

```bash

ln -s /usr/bin/gfortran /usr/bin/f90
alias f90=gfortran
alias f90="gfortran --ffreeform"
ln -s /usr/local/bin/gfortran /usr/local/bin/f90

---------------------------------------------- /opt/cray/pe/lmod/modulefiles/comnet/crayclang/10.0/ofi/1.0 -----------------------------------------------
   cray-mpich-abi/8.1.4 (D)    cray-mpich-abi/8.1.9    cray-mpich/8.1.4 (L,D)    cray-mpich/8.1.9

```
