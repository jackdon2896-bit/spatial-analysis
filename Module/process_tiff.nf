process CROP_AND_COMPRESS {
    publishDir "${params.outdir}", mode: 'copy'

    input:
    path tiff_file

    output:
    path "cropped_${tiff_file.baseName}.tif"

    script:
    """
    process_scrna.py ${tiff_file} "cropped_${tiff_file.baseName}.tif"
    """
}
