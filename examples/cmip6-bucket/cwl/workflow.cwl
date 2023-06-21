#!/usr/bin/env cwl-runner
$namespaces:
  cwltool: http://commonwl.org/cwltool#
class: Workflow
cwlVersion: v1.2
inputs:
  dataset: string
  backend: string
  dlat: float
  dlon: float
  method: string
outputs: {}
requirements:
  InlineJavascriptRequirement: {}
  NetworkAccess:
    networkAccess: true
  StepInputExpressionRequirement: {}
  SubworkflowFeatureRequirement: {}
steps:
  process:
    in:
      dataset: dataset
      backend: backend
      dlat: dlat
      dlon: dlon
      method: method
    out:
    - process_output_nb
    - nc_file
    run: process.cwl
