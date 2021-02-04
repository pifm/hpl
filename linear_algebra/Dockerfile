FROM intelpython/intelpython3_core:latest
RUN apt-get -qq update && apt-get -yqq upgrade
RUN conda update -y -n base conda && conda install -y -c conda-forge numpy pytest-benchmark
WORKDIR /src
COPY *.py /src/
