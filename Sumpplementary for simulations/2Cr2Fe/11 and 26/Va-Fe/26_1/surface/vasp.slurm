#!/bin/bash
#SBATCH -o %j.out
#SBATCH -J job_name
#SBATCH --nodes=1 
#SBATCH --ntasks=96

#source /public/home/yangtao520/apprepo/vasp/6-dtk/scripts/env.sh
source /orcd/home/002/wande/intel/oneapi/setvars.sh --force
source /orcd/home/002/wande/intel/oneapi/mkl/2025.0/env/vars.sh
export PATH=/orcd/home/002/wande/intel/oneapi/compiler/2025.0/bin:$PATH
export LD_LIBRARY_PATH=/orcd/home/002/wande/intel/oneapi/compiler/2025.0/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/orcd/home/002/wande/intel/oneapi/mpi/2021.16/lib:$LD_LIBRARY_PATH
#指定版本,std,gam或ncl版
VASP_EXE=/home/wande/vasp/vasp.6.5.1/bin/vasp_std

ulimit -s unlimited

#export NCCL_IB_HCA="mlx5_0"
#export HSA_FORCE_FINE_GRAIN_PCIE=1
# /home/wande/vasp/vasp.6.5.1/bin/vasp_std
/orcd/home/002/wande/intel/oneapi/mpi/2021.16/bin/mpirun -np 96 /home/wande/vasp/vasp.6.5.1/bin/vasp_std
