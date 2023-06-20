#!/usr/bin/env cwl-runner
$namespaces:
  cwltool: http://commonwl.org/cwltool#
class: Workflow
cwlVersion: v1.2
inputs:
  parameters:
    type:
      fields:
        backend: string
        dataset: string
        dlat: float
        dlon: float
        method: string
      type: record
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
      backend:
        source: parameters
        valueFrom: $(self.backend)
      dataset:
        source: parameters
        valueFrom: $(self.dataset)
      dlat:
        source: parameters
        valueFrom: $(self.dlat)
      dlon:
        source: parameters
        valueFrom: $(self.dlon)
      method:
        source: parameters
        valueFrom: $(self.method)
    out:
    - process_output_nb
    - nc_file
    run: process.cwl
