#! usr/bin/env nextflow
nextflow.enable.dsl=2

include { CROP_AND_COMPRESS } from './modules/process_tiff.nf'

workflow {
    // Step 1: Download from public S3 via Channel
    tiff_ch = Channel.fromPath(params.input_s3)

    // Step 2 & 3: Run the Python process from the module
    CROP_AND_COMPRESS(tiff_ch)
}
