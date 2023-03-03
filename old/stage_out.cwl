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
- aws s3 cp $(inputs.nc_file.path) $(inputs.base_dataset_url)stage_out/ &&
  aws s3 cp $(inputs.plot.path) $(inputs.base_dataset_url)stage_out/ &&
  aws s3 cp $(inputs.nb_file.path) $(inputs.base_dataset_url)stage_out/

inputs:
  base_dataset_url:
    type: string
  nc_file:
    type: File
  plot:
    type: File
  nb_file:
    type: File
outputs: []
