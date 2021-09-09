#!/bin/bash

run="$1"

n="$2"
m="$3"
p="$4" 
h="$5"

cv="$6"
ec="$7"

./clear_rand_results_runs_n_m_p_h_cv_ec.sh "$i" "$i" "$n" "$m" "$p" "$h" "$cv" "$ec"
./../../Programs/par-sv-sm -i "../../RandomTopologies/n_${n}_m_${m}_p_${p}_topo_${run}.txt" -s "$h" -c "$cv" -e "$ec" >> "../../Results/Random/n_${n}_m_${m}_p_${p}_h_${h}_cv_${cv}_ec_${ec}_topo_${run}.txt"
./../../Programs/par-sv-tc-sm -i "../../RandomTopologies/n_${n}_m_${m}_p_${p}_topo_${run}.txt" -s "$h" -c "$cv" -e "$ec" >> "../../Results/Random/n_${n}_m_${m}_p_${p}_h_${h}_cv_${cv}_ec_${ec}_topo_${run}.txt"
./../../Programs/par-sv-mp -i "../../RandomTopologies/n_${n}_m_${m}_p_${p}_topo_${run}.txt" -s "$h" -c "$cv" -e "$ec" > "../../Results/Random/n_${n}_m_${m}_p_${p}_h_${h}_cv_${cv}_ec_${ec}_topo_${run}.txt"

# run in mcia with : sbatch -J "job_name" --time "00:10:00" --nodes "4" --tasks-per-node "32" run_rand_topo_one_run_n_m_p_h_cv_ec.slurm "4" "100" "5" "0.10" "3" "1" "1"