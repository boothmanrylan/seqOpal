modelfile=/mnt/disks/disk-1/model
ldpcfile=/mnt/disks/disk-1/ldpc.matrix
traindata=/mnt/disks/disk-1/data/A1/train/A1.train.fasta
trainlabels=/mnt/disks/disk-1/data/A1/train/A1.train.taxid
testdata=/mnt/disks/disk-1/data/A1/test/A1.test.fasta
testlabels=/mnt/disks/disk-1/data/A1/test/A1.test.taxid
predictionfile=/mnt/disks/disk-1/predictions

time seqc train.seq $traindata $trainlabels -k 64 -c 15 -e 1 -s -r -f 64 -S $ldpcfile \
	| vw -f $modelfile --oaa 10 --bit_precision 31
time seqc predict.seq $testdata -L $ldpcfile -r -k 64 \
	| vw -i $modelfile -p $predictionfile
time seqc accuracy.seq $testlabels $predictionfile
