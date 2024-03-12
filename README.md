([Français](#NRcan-StatCan-Service-Recherche))
# NRCan-StatCan-Utility-Research


## About
This repository contains code for generating synthetic data (SD). This is the directory structure:
- `Data`: holds the real and synthetic datasets. The script `download.py` downloads the original data.
- `docker`: contains `Dockerfiles` to create images with popular synthetic data generators repositories.
- `notebooks`: the notebooks mocking a pipeline can be found here.

## Docker
Two images have to be built.

First cd into `minimal_python` directory and run:

    docker build --network=host -t minimal_python:latest .

Second cd into `sdgen` and run:

     docker build --network=host -t sdgen:latest .

The option `--network=host` allows to share the network between host and container, so no need to specify the ports to forward from container to host.

In order to run the notebooks a running container based on `sdgen` image is needed:

    docker run --name sdtest --gpus all --network=host -it --mount type=bind,source={host directory},target=/home/synthcity/statcan --entrypoint bash sdgen:latest

The option `--gpus all` is needed to let the container access the GPU.
Where `{host directory}` is the local directory on the host machine meant to hold all the project code and assets. In other words, this is the shared space an in this `directory` **this repository** has to be cloned.


## Notebooks
The notebooks helps to understand the steps needed for building a pipeline to generate synthetic data.

#### `1_Preprocessing.ipynb`
This notebook is to be used after downloading the original data using the script `download.py` in the `data` folder.
It runs all the preprocessing and cleaning steps and dumps the `real data` file, i.e., the data to synthesize.

Next steps depend on the generators used.

### CPAR model
To use this model we have to switch to `notebooks/PAR_model` directory.

#### `2a_cpar_training.ipynb`

Trains and samples synthetic data using the CPAR model and previously postprocessed `real data` (see step [above](#1_Preprocessing.ipynb)). The inputs are:

- Number of days or datafilename
- Number of epochs
- Optional, size of sampled synthetic data.

As output, the trained model is saved along with the synthetic data generated.

#### `2b_cpar_training.ipynb`

Alternative postprocessing of the `real data` considering the peaks and valleys of individual time series. If you ran [the previous notebook](#2a_cpar_training.ipynb) you do not need to run this to pass to the next step, evaluation.

#### `3_Evaluation.ipynb`

This notebook can sample new SD using a saved model or simply load SD data generated in the last step for evaluation. It outputs a series of metrics and plots.

## License

Unless otherwise noted, the source code of this project is covered under Crown Copyright, Government of Canada, and is distributed under the [MIT License](LICENSE).

---
# NRcan-StatCan-Service-Recherche

## À Propos
...

## Licence

Sauf indication contraire, le code source de ce projet est protégé par le droit d'auteur de la Couronne du gouvernement du Canada et distribué sous la [licence MIT](LICENSE).

