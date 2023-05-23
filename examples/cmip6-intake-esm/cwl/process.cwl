#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /Users/goodman/dev/unity-analytics-bcdp/examples/cmip6-intake-esm/process.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.2
inputs:
  activity_id: string
  backend: string
  experiment_id: string
  freq: string
  grid_label: string
  institution_id: string
  lat_bnds: string
  lon_bnds: string
  member_id: string
  method: string
  output_directory: string
  res: string
  season: string
  table_id: string
  time_bnds: string
  variable_id: string
outputs:
  nc_file:
    outputBinding:
      glob: '''CMIP_example.nc'''
    type: File
  output_dir:
    outputBinding:
      glob: $(inputs.output_directory)
    type: Directory
  output_nb:
    outputBinding:
      glob: output_nb.ipynb
    type: File
  plot_file:
    outputBinding:
      glob: '''CMIP_example.png'''
    type: File
requirements:
  InitialWorkDirRequirement:
    listing:
    - entry: '$({class: ''Directory'', listing: []})'
      entryname: $(inputs.output_directory)
      writable: true
  InlineJavascriptRequirement: {}
  InplaceUpdateRequirement:
    inplaceUpdate: true
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
stdout: _stdout.txt
