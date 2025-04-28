# Glacier inverse modelling
This folder contains the Julia Jupyter notebook to run the snapshot inversion on the Aletsch glacier to retrieve the basal sliding parameter. It is based on the [Glaide.jl](https://github.com/yiluchen1066/Glaide.jl) package.

## How to run the notebook?

### On Google Colab
The Julia notebook can be accessed and executed using the Google Colab Julia GPU runtime.

<a href="https://colab.research.google.com/github/mauro3/EGU2025-Julia-intro-and-showcase-for-geoscience/blob/main/glacier-inverse-modelling/glacier_inverse_model.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

Upload the notebook or save a personal copy of the Colab notebook: https://colab.research.google.com/github/mauro3/EGU2025-Julia-intro-and-showcase-for-geoscience/blob/main/glacier-inverse-modelling/glacier_inverse_model.ipynb.

> [!NOTE]
> Make sure to edit a personal copy of the Colab notebook ("File" -> "Save a copy in Drive").

To run the notebook:
- select the `Julia` runtime (instead of `Julia 1.11.5`): "Runtime" -> "Change runtime type" -> "Julia";
- select the "T4 GPU" option.

### On your local GPU server
Clone this repo or copy the notebook to your local GPU server (Nvidia GPU) and execute it, you should be all good to go.

> [!NOTE]
> Use Julia 1.10 to run this notebook.

### Output
Animation depicting the inverted sliding coefficient As, the gradient of the cost function, the observed and predicted surface ice velocity after optimisation.

https://github.com/user-attachments/assets/41d95f5a-ef28-4a38-afd3-9ebb40eda106
