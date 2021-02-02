#!/usr/bin/env bash
L_MKL_FILENAME=l_mklb_p_2020.2.001
FILENAME=${L_MKL_FILENAME}.tgz
curl https://software.intel.com/content/dam/develop/external/us/en/documents/${FILENAME} -o ${FILENAME}
tar xfz ${FILENAME}
cd ${L_MKL_FILENAME}/benchmarks_2020/linux/mkl/benchmarks/linpack
curl https://raw.githubusercontent.com/pifm/hpl/main/lininput_xeon64 -o lininput_xeon64
./runme_xeon64
