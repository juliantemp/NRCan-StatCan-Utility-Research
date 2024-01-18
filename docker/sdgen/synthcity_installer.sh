#!/bin/bash
## Clone and install synthcity from source
# #
# # echo "Setting the environment"
# # echo 'export PATH=$PATH:$HOME/.local/bin' >> .bashrc
# # export PATH=$PATH:$HOME/.local/bin
# # echo 'alias python=python3' >> .bashrc
# # echo 'alias pip=pip3' >> .bashrc
# # # synthcity needs pytorch to be installed beforehand
# # echo "Installing pytorch"
# # pip3 install torch torchvision --user --no-cache-dir
# #
# echo "Cloning synthcity"
# git clone https://github.com/vanderschaarlab/synthcity.git
# #
# echo "Installing synthcity"
# #cd synthcity/
# pip3 install synthcity[all]
# #
# # reinstalling pytorch
# #pip3 install torch torchvision --user --no-cache-dir
# #pip3 install pandas --user --no-cache-dir
# #pip3 install jupyterlab --user --no-cache-dir
# #pip3 install scikit-learn --user --no-cache-dir

# export PATH="$PATH:/usr/local/cuda/bin"
#python -m venv scity
#source scity/bin/activate
pip install scipy
pip install torch-scatter torch-sparse -f https://data.pyg.org/whl/torch-1.13.1+cu117.html --no-index
pip install torch==1.13.1 torchvision==0.14.1
pip install seaborn tables
git clone https://github.com/vanderschaarlab/synthcity.git
cd synthcity
pip install -e .[all]

echo "Done!!!"
