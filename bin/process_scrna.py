#!/usr/bin/env python3
import sys
import tifffile as tf
import numpy as np

def process_scrna_tiff(input_path, output_path):
    # Load 16-bit scRNA-seq image (using memmap for efficiency)
    img = tf.imread(input_path)
    
    # Lossless crop: [Channels, Y, X] or [Y, X]
    # Adjust 0:2000 to the crop size you need
    if img.ndim == 3:
        cropped = img[:, 0:2000, 0:2000]
    else:
        cropped = img[0:2000, 0:2000]
        
    # Save with lossless Deflate (zlib) compression
    tf.imwrite(
        output_path, 
        cropped, 
        compression='zlib',
        photometric='minisblack'
    )

if __name__ == "__main__":
    # Nextflow sends: input_path ($1) and output_path ($2)
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    process_scrna_tiff(input_file, output_file)
