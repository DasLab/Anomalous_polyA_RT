Here we include sample commandlines for each stage of the RNA Framework, ShapeMapper/M2seq, and ShapeMapper 2 pipelines that were used to produce reactivity profiles. These commands were executed across all sequences, RT/polymerase types, and modification types with commands that iterated through the different RTB primer barcodes, modification types, and RT/polyermase types and applied the appropriate version of the commands here.

As a starting point for all approaches, demultiplexing was carried out with novobarcode: 
novobarcode -b RTBprimers.fa -f SampleTruSeq1_S1_L001_R1_001.fastq SampleTruSeq1_S1_L001_R2_001.fastq -d demux/s1/

RNA Framework: 
1. Alignment
For the synthetic TOD constructs, the alignment used as a starting point for RNAFramework was based on the ShapeMapper 2 settings:
bowtie2 --local --sensitive-local --maxins=800 --ignore-quals --no-unal --mp 3,1 --rdg 5,1 --rfg 5,1 --dpad 30 -x path_to_bt2_index/s41 -1 path_to_fastq/SampleTruSeq2_S2_L001_R1_001.fastq -2 path_to_fastq/SampleTruSeq2_S2_L001_R2_001.fastq -S outdir/accepted_hits.sam
For the HIV construct, the alignment used was based on the ShapeMapper settings:
bowtie2 --local -D 20 -R 3 -N 1 -L 15 -i S,1,0.50 --score-min G,20,8 --ma 2 --mp 6,2 --rdg 5,1 --rfg 5,1 --dpad 100 -x path_to_bt2_index/hiv -1 path_to_fastq/Sample1_S1_L001_R1_001.fastq -2 path_to_fastq/Sample1_S1_L001_R2_001.fastq -S outdir/accepted_hits.sam

2. Mutation counting
Readthrough: rf-count -m -f path_to_bt2_index/s41.fa path_to_alignment/accepted_hits.bam
RT stops: rf-count -f path_to_bt2_index/s41.fa path_to_alignment/accepted_hits.bam
Readthrough, left aligned: rf-count -m -ra -f path_to_bt2_index/s41.fa path_to_alignment/accepted_hits.bam
Readthrough, no ambiguous deletions: rf-count -m -na -f path_to_bt2_index/s41.fa path_to_alignment/accepted_hits.bam

3. Reactivity normalization
DMS, readthrough: rf-norm -u outdir_rfcount/untreated/accepted_hits.rc -t outdir_rfcount/treated/accepted_hits.rc -i outdir_rfcount/untreated/index.rci,outdir_rfcount/treated/index.rci -sm 3 -nm 2 -ow -rb AC
SHAPE, readthrough: rf-norm -u outdir_rfcount/untreated/accepted_hits.rc" -t outdir_rfcount/treated/accepted_hits.rc" -i outdir_rfcount/untreated/index.rci,outdir_rfcount/treated/index.rci -sm 3 -nm 2 -ow
DMS, RT-stop: rf-norm -u outdir_rfcount_stop/untreated/accepted_hits.rc" -t outdir_rfcount_stop/treated/accepted_hits.rc -i outdir_rfcount_stop/untreated/index.rci,outdir_rfcount_stop/treated/index.rci -sm 1 -nm 2 -ow -rb AC
SHAPE, RT-stop: rf-norm -u outdir_rfcount_stop/untreated/accepted_hits.rc" -t "outdir_rfcount_stop/treated/accepted_hits.rc" -i outdir_rfcount_stop/untreated/index.rci,outdir_rfcount_stop/treated/index.rci -sm 1 -nm 2 -ow


ShapeMapper/M2seq:
m2seq_simple.py s1.fa --config s1.cfg --name s1
A sample .cfg script is included in this directory. We used default ShapeMapper settings and additionally write old mutation strings for processing by M2Seq.
The M2Seq package (https://github.com/ribokit/M2seq) was used to obtain RDAT reactivity files from treated and untreated samples based on the mutation strings from ShapeMapper. The reactivity files were created using m2seq_simple.py, which is included in this directory - this is a file added to the base-level M2seq repository that does the standard Shapemapper/M2seq analysis starting from pre-demultiplexed files with custom naming. 
The Biers package (https://github.com/ribokit/Biers) was used to carry out background subtraction (with Biers script get_DMS_profile.m) and normalization (with Biers script DMS_normalize.m).


ShapeMapper 2:
shapemapper --name tod --target path_to_bt2_index/s41.fa --modified --R1 path_to_fastq/treated/SampleTruSeq1_S1_L001_R1_001.fastq --R2 path_to_fastq/treated/SampleTruSeq1_S1_L001_R2_001.fastq" --untreated --R1 path_to_fastq/untreated/SampleTruSeq1_S1_L001_R1_001.fastq --R2 path_to_fastq/untreated/SampleTruSeq1_S1_L001_R2_001.fastq  --correct-seq --R1 path_to_fastq/untreated/SampleTruSeq1_S1_L001_R1_001.fastq --R2 path_to_fastq/untreated/SampleTruSeq1_S1_L001_R2_001.fastq



Final Analysis and Plotting:
plot_reactivity.ipynb: Notebook that reads in reactivity files from the ShapeMapper, ShapeMapper 2, and RNA Framework approaches above, and produces summary plots and writes reactivities to a standardized file format (one residue's reactivity value per line)
