for ((l=1;l<15;l++));
do
    if ((l == 5) || (l == 8))
    do 
        continue
    else
        lineNum=`grep -Fn 'learning_rate' parameters/params_nmnist_test.yml | cut -d: -f1`
        sed -i "${lineNum}s/.*/learning_rate: 1.e-${l}/" parameters/params_nmnist_test.yml
        python train_lenet_decolle.py | tee linear_decolle_${l}.log
    if
done