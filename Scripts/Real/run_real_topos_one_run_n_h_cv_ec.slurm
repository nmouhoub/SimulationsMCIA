#!/bin/bash

type="$1"
run="$2"

n="$3"
h="$4"

cv="$5"
ec="$6"

./clear_real_results_runs_n_h_cv_ec.sh "$type" "$i" "$i" "$n" "$h" "$cv" "$ec"
./../../Programs/par-sv-sm -i "../../RealTopologies/${type}_n_${n}_topo_${run}.txt" -s "$h" -c "$cv" -e "$ec" >> "../../Results/Real/${type}_n_${n}_h_${h}_cv_${cv}_ec_${ec}_topo_${run}.txt"
./../../Programs/par-sv-tc-sm -i "../../RealTopologies/${type}_n_${n}_topo_${run}.txt" -s "$h" -c "$cv" -e "$ec" >> "../../Results/Real/${type}_n_${n}_h_${h}_cv_${cv}_ec_${ec}_topo_${run}.txt"
./../../Programs/par-sv-mp -i "../../RealTopologies/SampledCartes/${type}_n_${n}_topo_${run}.txt" -s "$h" -c "$cv" -e "$ec" > "../../Results/Real/${type}_n_${n}_h_${h}_cv_${cv}_ec_${ec}_topo_${run}.txt"

# run in mcia with : sbatch -J "job_name" --time "00:10:00" --nodes "16" --tasks-per-node "32" run_real_topo_one_run_n_h_cv_ec.slurm "old" "4" "1000" "3" "1" "1"
# run in mcia with : sbatch -J "job_name" --time "00:10:00" --nodes "16" --tasks-per-node "32" run_real_topo_one_run_n_h_cv_ec.slurm "new" "4" "1000" "3" "1" "1"