modelfile=./model
ldpcfile=./ldpc
traindata=../data/A1/train/A1.train.fasta
trainlabels=../data/A1/train/A1.train.taxid
testdata=../data/A1/test/A1.test.fasta
testlabels=../data/A1/test/A1.test.taxid
predictionfile=./predictions

seqc train.seq $traindata $trainlabels -c 1 -e 15 -s -S $ldpcfile | vw -f $modelfile -oaa 10 --bit_precision 31
seqc predict.seq $testdata -L $ldpcfile | vw -i $modelfile -p $predictionfile
seqc accuracy.seq $testlabels $predictions
