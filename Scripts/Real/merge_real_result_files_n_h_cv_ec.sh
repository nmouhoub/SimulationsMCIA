#!/bin/bash

type="$1"

min_runs="$2"
max_runs="$3"

n="$4"
h="$5"

cv="$6"
ec="$7"

i=$min_runs

while [ $i -le $max_runs ]
do
    cat "../../Results/Real/${type}_n_${n}_h_${h}_cv_${cv}_ec_${ec}_topo_${i}.txt" >> "../../Results/Real/${type}_n_${n}_h_${h}_cv_${cv}_ec_${ec}_runs_${min_runs}_${max_runs}.txt"
	i=$(( $i + 1 ))
done

# run with : ./merge_real_result_files_n_h_cv_ec.sh "old" "0" "9" "1000" "3" "1" "1"
# run with : ./merge_real_result_files_n_h_cv_ec.sh "new" "0" "9" "1000" "3" "1" "1"