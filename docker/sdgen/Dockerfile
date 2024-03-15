FROM minimal_python:latest

USER root:root

#RUN apt-get update && \
#    apt-get -y upgrade && \
#    rm -rf /var/lib/apt/lists/*


RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb && \
    dpkg -i cuda-keyring_1.1-1_all.deb && \
    apt-get update && \
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin && \
    mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600 && \
    apt-get update  && \
    apt-get -y upgrade  && \
    apt-get install -y --no-install-recommends cuda-toolkit-11-7


ENV USER=synthcity
ARG USER_UID=1000
ENV USER_HOME=/home/synthcity

RUN useradd --create-home --home $USER_HOME --uid $USER_UID --user-group $USER

WORKDIR $USER_HOME

#USER $USER

SHELL ["/bin/bash", "-c"]

ENV PATH "/usr/local/cuda/bin:$PATH"

# create venv
#RUN python3 -m venv $HOME/scity
# Enable venv
#ENV PATH="$HOME/scity/bin:$PATH"

COPY synthcity_installer.sh $USER_HOME/synthcity_installer.sh

RUN source synthcity_installer.sh

COPY misc.sh $USER_HOME/misc.sh

RUN source misc.sh

COPY sdv_installer.sh $USER_HOME/sdv_installer.sh

RUN source sdv_installer.sh

RUN chmod -R 777 /usr/local/lib/python3.10/dist-packages/pycox/datasets
RUN chmod -R 777 $USER_HOME/synthcity
RUN chown $USER:$USER -R $USER_HOME/synthcity

RUN apt install graphviz

WORKDIR $USER_HOME

USER $USER

RUN echo "Setting the environment"
RUN echo 'export PATH=$PATH:$HOME/.local/bin' >> .bashrc
RUN echo 'alias python=python3' >> .bashrc
RUN echo 'alias pip=pip3' >> .bashrc
RUN echo 'alias ipython="python -m IPython"' >> .bashrc

CMD ["/bin/bash"]
