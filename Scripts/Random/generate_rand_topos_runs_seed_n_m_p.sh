#!/bin/bash

min_runs="$1"
max_runs="$2"
seed="$3"
n="$4"
m="$5"
p="$6" 

i=$min_runs

while [ $i -le $max_runs ]
do
	./clear_rand_topos_runs_n_m_p.sh "$i" "$i" "$n" "$m" "$p"
	./../../Programs/rand-gen -g BA -s $seed -n $n -m $m -p 1 -a 2 -f $p -o "../../RandomTopologies/n_${n}_m_${m}_p_${p}_topo_${i}" 

	i=$(( $i + 1 ))
    seed=$(( $seed + 10 ))
done

# run with : ./generate_rand_topos_runs_seed_n_m_p.sh "0" "9" "12345" "100" "3" "0.10"