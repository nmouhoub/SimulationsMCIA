#!/bin/bash

type="$1"
min_runs="$2"
max_runs="$3"
seed="$4"
n="$5"
 
i=$min_runs

while [ $i -le $max_runs ]
do
	./clear_real_topos_runs_n.sh "$type" "$i" "$i" "$n"
	./../../Programs/real-gen -s "$seed" -i "../../RealTopologies/OriginalCartes/${type}_as_46_${n}-${i}.anm" -a "../../RealTopologies/OriginalCartes/${type}_as_46_${n}-${i}.analysis" -o "../../RealTopologies/SampledCartes/${type}_n_${n}_topo_${i}" 
	i=$(( $i + 1 ))
    seed=$(( $seed + 10 ))
done

# run with : ./generate_real_topos_runs_seed_n.sh "old" "0" "9" "12345" "2000"
# run with : ./generate_real_topos_runs_seed_n.sh "old" "0" "9" "12345" "1000"