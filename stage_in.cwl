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
  aws s3 cp --profile saml-pub --recursive $(inputs.base_dataset_url)$(inputs.dataset_path_name) $(inputs.dataset_path_name)

inputs:
  aws_access_key_id: string
  aws_secret_access_key: string
  aws_session_token: string
  base_dataset_url:
    type: string
  dataset_path_name:
    type: string
outputs:
  dataset_path:
    type: Directory
    outputBinding:
      glob: $(inputs.dataset_path_name)
