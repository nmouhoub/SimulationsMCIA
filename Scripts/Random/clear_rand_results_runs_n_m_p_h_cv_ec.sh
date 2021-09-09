#!/bin/bash

min_runs="$1"
max_runs="$2"

n="$3"
m="$4"
p="$5" 
h="$6"

cv="$7"
ec="$8"

i=$min_runs

while [ $i -le $max_runs ]
do
    rm -f "../../Results/Random/n_${n}_m_${m}_p_${p}_h_${h}_cv_${cv}_ec_${ec}_topo_${i}.txt"
	i=$(( $i + 1 ))
done

# run with : ./clear_rand_results_runs_n_m_p_h_cv_ec.sh "0" "9" "100" "3" "0.10" "3" "1" "1"