cwlVersion: v1.1
class: CommandLineTool
$namespaces:
  cwltool: http://commonwl.org/cwltool#
hints:
  "cwltool:Secrets":
    secrets:
      - aws_access_key_id
      - aws_secret_access_key
      - aws_session_token
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:unity-sds.unity-analytics-bcdp.main
requirements:
  NetworkAccess:
    networkAccess: true
  InitialWorkDirRequirement:
    listing:
      - entryname: .aws/credentials
        entry: |
          [saml-pub]
          output = json
          region = us-west-2
          aws_access_key_id = $(inputs.aws_access_key_id)
          aws_secret_access_key = $(inputs.aws_secret_access_key)
          aws_session_token = $(inputs.aws_session_token)

baseCommand: [sh]
arguments:
- -c
- cat $HOME/.aws/credentials &&
  aws s3 cp --profile saml-pub $(inputs.nc_file.path) $(inputs.base_dataset_url)stage_out/ &&
  aws s3 cp --profile saml-pub $(inputs.plot.path) $(inputs.base_dataset_url)stage_out/ &&
  aws s3 cp --profile saml-pub $(inputs.nb_file.path) $(inputs.base_dataset_url)stage_out/

inputs:
  aws_access_key_id: string
  aws_secret_access_key: string
  aws_session_token: string
  base_dataset_url:
    type: string
  nc_file:
    type: File
  plot:
    type: File
  nb_file:
    type: File
outputs: []
