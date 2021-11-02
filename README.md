# docker-bam-readcount
Bam-readcount is a utility that counts DNA sequence reads in BAM and CRAM files. It generates metrics for `.bam` files at single nucleotide positions:
```
Usage: bam-readcount [OPTIONS] <bam_file> [region]
Example: bam-readcount -f ref.fa some.bam
```
The output of bam-readcount is a no header tab-separated file end with `.readcount`. For more description of bam-readcount usage and output, please see [the main github page of bam-readcount](https://github.com/genome/bam-readcount).

The bam-readcount image is located in the Boutros Lab Docker Hub repo [here](https://hub.docker.com/repository/docker/blcdsdockerregistry/bam-readcount).

# Documentation
The main github page of bam-readcount can be found [here](https://github.com/genome/bam-readcount) with documentations. The official latest docker image is available [here](https://hub.docker.com/r/mgibio/bam-readcount).

The Boutros lab docker image versioning standard [here](https://confluence.mednet.ucla.edu/display/BOUTROSLAB/Docker+image+versioning+standardization).


# Version
| Tool | Version |
|------|---------|
|bam-readcount| 0.8.0|

---

## References

1. Khanna, Ajay et al. “Bam-readcount -- rapid generation of basepair-resolution sequence metrics.” ArXiv arXiv:2107.12817v1. 27 Jul. 2021 Preprint. 

---

## License

Author: Caden Bugh, Mao Tian

Docker-bam-readcount is licensed under the GNU General Public License version 2. See the file LICENSE for the terms of the GNU GPL license.

Docker-bam-readcount is a utility that runs on a BAM or CRAM file and generates low-level information about sequencing data at specific nucleotide positions.

Copyright (C) 2021 University of California Los Angeles ("Boutros Lab") All rights reserved.

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
