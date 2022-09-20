cwlVersion: v1.1
class: CommandLineTool
$namespaces:
  cwltool: http://commonwl.org/cwltool#
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:unity-sds.unity-analytics-bcdp.main
requirements:
  NetworkAccess:
    networkAccess: true

baseCommand: [sh]
arguments:
- -c
- aws s3 cp --recursive $(inputs.base_dataset_url)$(inputs.dataset_path_name) $(inputs.dataset_path_name)

inputs:
  base_dataset_url:
    type: string
  dataset_path_name:
    type: string
outputs:
  dataset_path:
    type: Directory
    outputBinding:
      glob: $(inputs.dataset_path_name)
