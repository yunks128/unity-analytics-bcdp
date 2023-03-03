#!/usr/bin/env cwl-runner
cwlVersion: v1.0
baseCommand:
  - papermill
  - /home/jovyan/process.ipynb
  - output_nb.ipynb
class: CommandLineTool
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:unity-sds.unity-analytics-bcdp.main
inputs:
  variable:
    inputBinding:
      position: 1
      prefix: '--parameters'
      shellQuote: false
      valueFrom: |
        variable "$(self)"
    type: string
  dataset_path:
    inputBinding:
      position: 2
      prefix: '--parameters'
      shellQuote: false
      valueFrom: | 
        dataset_path "$(self.path)"
    type: Directory
outputs:
  CORDEX_Africa_nc:
    outputBinding:
      glob: CORDEX_Africa_*.nc
    type: File
  cordex_africa_png:
    outputBinding:
      glob: cordex_africa.png
    type: File
  output_nb_ipynb:
    outputBinding:
      glob: output_nb.ipynb
    type: File
requirements:
  ShellCommandRequirement: {}

