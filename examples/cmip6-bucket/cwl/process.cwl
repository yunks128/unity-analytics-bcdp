#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/examples/cmip6-bucket/process.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.2
inputs:
  backend: string
  dataset: string
  dlat: float
  dlon: float
  method: string
outputs:
  process_output_nb:
    outputBinding:
      glob: output_nb.ipynb
    type: File
  nc_file:
    outputBinding:
      glob: CMIP_example.nc
    type: File
requirements:
  DockerRequirement:
    dockerPull: agoodm/unity-analytics-bcdp:58c0285a
  InlineJavascriptRequirement: {}
  InplaceUpdateRequirement:
    inplaceUpdate: true
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
stdout: _stdout.txt
