#!/usr/bin/env nextflow
nextflow.enable.dsl=2

// Import the module from the renamed 'modules' folder
include { CROP_AND_COMPRESS } from './modules/process_tiff.nf'

workflow {
    // Channel.fromPath requires a non-null parameter
    tiff_ch = Channel.fromPath(params.input_s3, checkIfExists: true)

    CROP_AND_COMPRESS(tiff_ch)
}



