cwlVersion: v1.1
class: CommandLineTool
#hints:
#  DockerRequirement:
#    dockerPull: 'pymonger/downsample-landsat:2.0.3'
baseCommand:
  - papermill
  - /Users/goodman/projects/unity/stage_out.ipynb
  - out.ipynb
requirements:
  ShellCommandRequirement: {}
#  InitialWorkDirRequirement:
#    listing:
#      - $(inputs.input_file)
inputs:
  out_dir:
    type: string
    inputBinding:
      position: 1
      shellQuote: false
      prefix: '-p'
      valueFrom: |
        out_dir $(self)
outputs:
  output_nb_file:
    type: File
    outputBinding:
      glob: out.ipynb
