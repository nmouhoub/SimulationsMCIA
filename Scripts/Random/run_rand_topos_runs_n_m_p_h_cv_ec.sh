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
    ./clear_rand_results_runs_n_m_p_h_cv_ec.sh "$i" "$i" "$n" "$m" "$p" "$h" "$cv" "$ec"
	./../../Programs/par-sv-sm -i "../../RandomTopologies/n_${n}_m_${m}_p_${p}_topo_${i}.txt" -s "$h" -c "$cv" -e "$ec" >> "../../Results/Random/n_${n}_m_${m}_p_${p}_h_${h}_cv_${cv}_ec_${ec}_topo_${i}.txt"
    ./../../Programs/par-sv-tc-sm -i "../../RandomTopologies/n_${n}_m_${m}_p_${p}_topo_${i}.txt" -s "$h" -c "$cv" -e "$ec" >> "../../Results/Random/n_${n}_m_${m}_p_${p}_h_${h}_cv_${cv}_ec_${ec}_topo_${i}.txt"
	./../../Programs/par-sv-mp -i "../../RandomTopologies/n_${n}_m_${m}_p_${p}_topo_${i}.txt" -s "$h" -c "$cv" -e "$ec" > "../../Results/Random/n_${n}_m_${m}_p_${p}_h_${h}_cv_${cv}_ec_${ec}_topo_${i}.txt"
	i=$(( $i + 1 ))
done

# run with : ./run_rand_topos_runs_n_m_p_h_cv_ec.sh "0" "9" "100" "3" "0.10" "4" "1" "1"