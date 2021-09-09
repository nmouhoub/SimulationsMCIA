#!/bin/bash

type="$1"
min_runs="$2"
max_runs="$3"
n="$4"

i=$min_runs

while [ $i -le $max_runs ]
do
	rm -f ../../RealTopologies/SampledCartes/${type}_n_${n}_topo_${i}.*
	i=$(( $i + 1 ))
done

# run with : ./clear_real_topos_runs_n.sh "old" "0" "9" "1000"
# run with : ./clear_real_topos_runs_n.sh "new" "0" "9" "1000"