#! usr/bin/env nextflow
process PREPROCESS_IMAGES {
    // Save results back to your S3 bucket
    publishDir "s3://your-bucket-name/processed_results/", mode: 'copy'

    input:
    path tiff_file // Nextflow automatically downloads this from S3 for you

    output:
    path "cropped_${tiff_file.baseName}.tif"

    script:
    """
    python process_scrna.py ${tiff_file} "cropped_${tiff_file.baseName}.tif"
    """
}

workflow {
    // Define the S3 path here
    images_ch = Channel.fromPath('s3://your-bucket-name/raw_data/*.tif')
    
    PREPROCESS_IMAGES(images_ch)
}
