#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process dacapo {
    cpus params.cpus
    conda '/groups/mousebrainmicro/home/pattonw/anaconda3/envs/dacapo'
    script:
      """
      echo "file_server: ${params.options.file_server}\nfile_server_user: ${params.options.file_server_user}\nfile_server_pass: ${params.options.file_server_pass}\nruns_base_dir: ~/${params.options.local_runs_base_dir}/\nmongo_db_host: ${params.options.mongo_db_host}
      \nmongo_db_name: ${params.options.mongo_db_name}" > dacapo.yaml
      dacapo train -r ${params.run_name}
      """
}

workflow {
  dacapo()
}
