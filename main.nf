#! usr/bin/env nextflow
nextflow.enable.dsl=2

// Import from your new modules folder
include { CROP_AND_COMPRESS } from './modules/process_tiff.nf'

workflow {
    // This uses the path defined in your nextflow.config
    tiff_ch = Channel.fromPath(params.input_s3)

    CROP_AND_COMPRESS(tiff_ch)
}


