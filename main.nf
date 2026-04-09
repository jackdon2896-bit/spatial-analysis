#! usr/bin/env nextflow
process PREPROCESS_IMAGES {
    tag "$tiff_file.baseName"
    
    input:
    path tiff_file

    output:
    path "cropped_${tiff_file.baseName}.tif"

    script:
    """
    python process_scrna.py ${tiff_file} "cropped_${tiff_file.baseName}.tif"
    """
}

workflow {
    images_ch = Channel.fromPath('raw_images/*.tif')
    PREPROCESS_IMAGES(images_ch)
}
