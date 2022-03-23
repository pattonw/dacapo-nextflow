#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process dacapo {
    cpus params.cpus
    conda '/groups/mousebrainmicro/home/pattonw/anaconda3/envs/dacapo-refactor'
    script:
      """
      dacapo train -r ${params.run_name}
      """
}

workflow {
  dacapo()
}
