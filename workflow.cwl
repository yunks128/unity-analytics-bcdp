cwlVersion: v1.1
class: Workflow

inputs:
  workflow_origin_dir: string
  workflow_destination_dir: string
  workflow_variable: string
  workflow_out_dir: string
  workflow_input_dir: string

outputs: []
steps:
  stage_in:
    run: stage_in.cwl
    in:
      origin_dir: workflow_origin_dir
      destination_dir: workflow_destination_dir
    out:
      - input_files
  cordex_example:
    run: cordex_example.cwl
    in:
      variable: workflow_variable
    out:
      - output_nb_file
      - plots
  stage_out:
    run: stage_out.cwl
    in:
      out_dir: workflow_out_dir
    out:
      - output_nb_file
