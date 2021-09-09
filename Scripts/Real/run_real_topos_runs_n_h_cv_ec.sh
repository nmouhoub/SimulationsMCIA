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
    ./clear_real_results_runs_n_h_cv_ec.sh "$type" "$i" "$i" "$n" "$h" "$cv" "$ec"
	./../../Programs/par-sv-sm -i "../../RealTopologies/SampledCartes/${type}_n_${n}_topo_${i}.txt" -s "$h" -c "$cv" -e "$ec" >> "../../Results/Real/${type}_n_${n}_h_${h}_cv_${cv}_ec_${ec}_topo_${i}.txt"
    ./../../Programs/par-sv-tc-sm -i "../../RealTopologies/SampledCartes/${type}_n_${n}_topo_${i}.txt" -s "$h" -c "$cv" -e "$ec" >> "../../Results/Real/${type}_n_${n}_h_${h}_cv_${cv}_ec_${ec}_topo_${i}.txt"
	./../../Programs/par-sv-mp -i "../../RealTopologies/SampledCartes/${type}_n_${n}_topo_${i}.txt" -s "$h" -c "$cv" -e "$ec" > "../../Results/Real/${type}_n_${n}_h_${h}_cv_${cv}_ec_${ec}_topo_${i}.txt"
	i=$(( $i + 1 ))
done

# run with : ./run_real_topos_runs_n_h_cv_ec.sh "old" "0" "9" "1000" "3" "1" "1" 
# run with : ./run_real_topos_runs_n_h_cv_ec.sh "new" "0" "9" "1000" "3" "1" "1"