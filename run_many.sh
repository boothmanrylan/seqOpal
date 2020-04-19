modelfile=./model
traindata=../data/A1/train/A1.train.fasta
trainlabels=../data/A1/train/A1.train.taxid
rm $modelfile
echo start batch 1
/usr/bin/time -v \
    seqc main.seq $traindata -l $trainlabels -c 1 -S \
        | vw -f $modelfile --save_resume --oaa 10 --bit_precision 30
echo finished batch 1
echo
echo
counter=2
while [ $counter -le 10 ]
do
    echo start batch $counter
    /usr/bin/time -v \
        seqc main.seq $traindata -l $trainlabels -c 1 -S \
            | vw -i $modelfile -f $modelfile --save_resume --oaa 10 --bit_precision 30
    echo finished batch $counter
    ((counter++))
    echo
    echo
done
