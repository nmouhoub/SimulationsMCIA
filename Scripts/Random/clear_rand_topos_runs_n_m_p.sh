#!/bin/bash

min_runs="$1"
max_runs="$2"
n="$3"
m="$4"
p="$5"

i=$min_runs

while [ $i -le $max_runs ]
do
	rm -f ../../RandomTopologies/n_${n}_m_${m}_p_${p}_topo_${i}.* 
	i=$(( $i + 1 ))
done

# run with : ./clear_rand_topos_runs_n_m_p.sh "0" "9" "100" "5" "0.10"