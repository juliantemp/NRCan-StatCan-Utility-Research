FROM ubuntu:jammy

# tzdata https://rtfm.co.ua/en/docker-configure-tzdata-and-timezone-during-build/
ENV TZ=America/Montreal
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y --no-install-recommends build-essential && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y --no-install-recommends g++ \
    python3 \
    python3-minimal \
    libpython3-dev \
    libpython3-stdlib \
    python3-distutils \
    python3-lib2to3 \
    python3-dev \
    python3-pip \
    python3-pip-whl \
    python3-ipython \
    python3-venv \
    bzip2 \
    unzip \
    git \
    curl \
    wget \
    vim \
    vim-common \
    vim-runtime \
    nano \
    pkg-config && \
    rm -rf /var/lib/apt/lists/*

ENV USER=python
ARG USER_UID=1980
ENV USER_HOME=/home/python

RUN useradd --create-home --home $USER_HOME --uid $USER_UID --user-group $USER

#COPY ipython /usr/bin/ipython

#RUN chmod 0755 /usr/bin/ipython

WORKDIR $USER_HOME

USER $USER

RUN echo "Setting the environment"
RUN echo 'export PATH=$PATH:$HOME/.local/bin' >> .bashrc
RUN echo 'alias python=python3' >> .bashrc

CMD ["/bin/bash"]




