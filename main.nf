#! usr/bin/env nextflow
nextflow.enable.dsl=2

// Import the process from the modules folder
include { CROP_AND_COMPRESS } from './modules/process_tiff.nf'

workflow {
    // Step 1: Create a channel for your S3 images
    tiff_ch = Channel.fromPath(params.input_s3)

    // Step 2 & 3: Process the images through the module
    CROP_AND_COMPRESS(tiff_ch)
}

