FROM ubuntu:20.04
ENV TZ=Europe/Berlin
ENV DEBIAN_FRONTEND=noninteractive 
ENV FILENAME=l_mklb_p_2020.2.001.tgz
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /opt/intel
RUN apt-get -qq update && apt-get -yqq upgrade && apt-get -yqq install curl
RUN curl https://software.intel.com/content/dam/develop/external/us/en/documents/${FILENAME}  -o ${FILENAME} \
    && tar xvfz ${FILENAME} -C /opt/intel \ 
    && ln -s /opt/intel/l_mklb_p_2020.2.001/benchmarks_2020/linux/mkl/benchmarks/linpack \
    && rm -rf ${FILENAME} 
WORKDIR /opt/intel/l_mklb_p_2020.2.001/benchmarks_2020/linux/mkl/benchmarks/linpack
RUN curl https://raw.githubusercontent.com/pifm/hpl/main/lininput_xeon64 -o lininput_xeon64
CMD ./runme_xeon64