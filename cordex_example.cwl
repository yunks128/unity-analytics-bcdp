cwlVersion: v1.1
class: CommandLineTool
#hints:
#  DockerRequirement:
#    dockerPull: 'pymonger/downsample-landsat:2.0.3'
baseCommand:
  - papermill
  - /Users/goodman/projects/unity/cordex_example_papermill.ipynb
  - cordex.ipynb
requirements:
  ShellCommandRequirement: {}
#  InitialWorkDirRequirement:
#    listing:
#      - $(inputs.input_file)
inputs:
  variable:
    type: string
    inputBinding:
      position: 1
      shellQuote: false
      prefix: '-p'
      valueFrom: |
        variable $(self)

outputs:
  output_nb_file:
    type: File
    outputBinding:
      glob: cordex.ipynb
  plots:
    type: File
    outputBinding:
      glob: "*.png"
