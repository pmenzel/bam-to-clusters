bam_to_clusters
===============

This program reads coordinate-sorted files with strand-specific single-end or paired-end RNA-Seq reads
and prints clusters of mapped reads having a minimum depth and distance to other clusters.

The output is a tab-separated table with 5 columns:
```
chrName start stop strand height
```
Coordinates are 1-based.

The implementation is based on [stranded-coverage](https://github.com/pmenzel/stranded-coverage).


### Installation

The program depends on the [htslib](https://github.com/samtools/htslib), which should
be downloaded to `../htslib`.

Example:
```
git clone https://github.com/samtools/htslib.git
git clone https://github.com/pmenzel/bam_to_clusters.git
cd bam_to_clusters
make
```
This will produce the executable file `bam_to_clusters`.

### Usage
Example using the BAM file `Aligned.bam`, which needs to be sorted by coordinates:
```
bam_to_clusters -o output.tsv -s 1 -y 10 -l 20  Aligned.bam
```

Option `-y` denoted the minimum height (either in reads or in RPM when option `n` is used).

Option `-l` denotes the minimum distance between clusters.


### MAPQ filtering
Reads can be filtered by their mapping quality (MAPQ) using option `-m`.

### Multimapping reads
By default, each alignment belonging to a multimapping read is counted the same as alignments from uniquely mapped reads, i.e. as `1`.

The option `-f` enables fractional counts. In this mode, the tag `NH:i:N` needs
to be set to the number of alignments for a multimapping read, and each
alignment will be counted as `1/N`.

### RPM Normalisation
The option `-n` enables normalisation of the coverage using the reads per million mapped reads (RPM).

###License

See the file LICENSE.


