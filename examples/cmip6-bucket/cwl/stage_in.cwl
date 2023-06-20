#!/usr/bin/env cwl-runner
baseCommand:
- ls
class: CommandLineTool
cwlVersion: v1.2
requirements:
  DockerRequirement:
    dockerPull: ghcr.io/unity-sds/unity-data-services:3.8.1
