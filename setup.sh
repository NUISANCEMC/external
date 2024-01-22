for file in $(ls ./*/setup.*.sh ./*/*/setup.*.sh)
do
  echo $file
  source $file
done
