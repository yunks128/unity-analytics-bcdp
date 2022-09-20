cwlVersion: v1.1
class: Workflow

inputs:
  workflow_base_dataset_url: string
  workflow_variable: string
  workflow_dataset_path_name: string

outputs: []
steps:
  stage_in:
    run: stage_in.cwl
    in:
      base_dataset_url: workflow_base_dataset_url
      dataset_path_name: workflow_dataset_path_name
    out:
      - dataset_path
  process:
    run: process.cwl
    in:
      variable: workflow_variable
      dataset_path: stage_in/dataset_path
    out:
      - output_nb_ipynb
      - CORDEX_Africa_nc 
      - cordex_africa_png
  stage_out:
    run: stage_out.cwl
    in:
      base_dataset_url: workflow_base_dataset_url
      nc_file: process/CORDEX_Africa_nc
      plot: process/cordex_africa_png
      nb_file: process/output_nb_ipynb
    out: []
