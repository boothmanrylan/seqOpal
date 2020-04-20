disk=/mnt/disks/disk-1
traindata=$disk/fasta/example.train.fasta
trainlabels=$disk/fasta/example.train.taxid
modelfile=$disk/model
ldpcfile=$disk/ldpc.matrix
rm $modelfile $ldpcfile
echo start batch 1
time \
    ./seqc main.seq $traindata -l $trainlabels -c 1 -f 200 -s $ldpcfile \
        | vw -f $modelfile --save_resume --oaa 193 --bit_precision 31 --loss_function=logistic
echo finished batch 1
echo
echo
#counter=15
#while [ $counter -le 15 ]
#do
#    echo start batch $counter
#    time \
#        ./seqc main.seq $traindata -l $trainlabels -c 1 -f 200 -r $ldpcfile \
#            | vw -i $modelfile -f $modelfile --save_resume --oaa 193 --bit_precision 31 --loss_function=logistic
#    echo finished batch $counter
#    ((counter++))
#    echo
#    echo
#done
