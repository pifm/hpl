FROM clearlinux:latest
RUN swupd bundle-add curl
ENV FILENAME=l_mklb_p_2020.2.001.tgz
WORKDIR /opt/intel
RUN curl https://software.intel.com/content/dam/develop/external/us/en/documents/${FILENAME}  -o ${FILENAME} \
    && tar xvfz ${FILENAME} -C /opt/intel \ 
    && ln -s /opt/intel/l_mklb_p_2020.2.001/benchmarks_2020/linux/mkl/benchmarks/linpack \
    && rm -rf ${FILENAME} 
WORKDIR /opt/intel/l_mklb_p_2020.2.001/benchmarks_2020/linux/mkl/benchmarks/linpack
RUN curl https://raw.githubusercontent.com/pifm/hpl/main/lininput_xeon64 -o lininput_xeon64
CMD ./runme_xeon64