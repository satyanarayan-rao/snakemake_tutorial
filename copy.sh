for  i in `seq 1 $2`
do
    cp $1 ${1%.tsv}_copy_no_${i}.tsv
done 
