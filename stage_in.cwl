cwlVersion: v1.1
class: CommandLineTool
baseCommand:
  - cp
  - -r
requirements:
  ShellCommandRequirement: {}
#  NetworkAccess:
#    networkAccess: true

inputs:
  origin_dir:
    type: string
    inputBinding:
      position: 1
      shellQuote: false
      valueFrom: |
        "$(self)"
  destination_dir:
    type: string
    inputBinding:
      position: 2
      shellQuote: false
      valueFrom: |
        "$(self)"

outputs:
  input_files:
    type: File
    outputBinding:
      glob: 'in/*.nc'
