# Glacier inverse modelling
This folder contains the Julia Jupyter notebook to run the snapshot inversion on the Aletsch glacier to retrieve the basal sliding parameter. It is based on the [Glaide.jl](https://github.com/yiluchen1066/Glaide.jl) package.

## How to run the notebook?

### On Google Colab
The notebook can be accessed and executed using the Google Colab Julia GPU runtime.

Upload the notebook or save a personal copy of the [Colab notebook](https://drive.google.com/file/d/1EzGUnY0PMBvp9at8kuLBfiOlrOPwad2Q/view?usp=share_link).

> [!NOTE]
> Make sure to edit a personal copy of the Colab notebook ("File" -> "Save a copy in Drive").

To run the notebook:
- select the `Julia` runtime (instead of `Julia 1.11.5`): "Runtime" -> "Change runtime type" -> "Julia";
- select the "T4 GPU" option.

### On your local GPU server
Clone this repo or copy the notebook to your local GPU server (Nvidia GPU) and execute it, you should be all good to go.
