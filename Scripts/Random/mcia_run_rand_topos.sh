#!/bin/bash

for i in "$@"; do
  case $i in
    -th=*|--time_run_h=*)
      TIME_RUN_H="${i#*=}"
      shift # past argument=value
      ;;
    -tm=*|--time_run_m=*)
      TIME_RUN_M="${i#*=}"
      shift # past argument=value
      ;;
    -ts=*|--time_run_s=*)
      TIME_RUN_S="${i#*=}"
      shift # past argument=value
      ;;
    -min=*|--min_run=*)
      MIN_RUN="${i#*=}"
      shift # past argument=value
      ;;
    -max=*|--max_run=*)
      MAX_RUN="${i#*=}"
      shift # past argument=value
      ;;
    -n=*|--size=*)
      SIZE="${i#*=}"
      shift # past argument=value
      ;;
    -m=*|--m_atach=*)
      M_ATACH="${i#*=}"
      shift # past argument=value
      ;;
    -p=*|--prob=*)
      PROB="${i#*=}"
      shift # past argument=value
      ;;
    -h=*|--stack_height=*)
      STACK_HEIGHT="${i#*=}"
      shift # past argument=value
      ;;
    -cv=*|--conv_cost=*)
      CONV_COST="${i#*=}"
      shift # past argument=value
      ;;  
    -ec=*|--encap_cost=*)
      ENCAP_COST="${i#*=}"
      shift # past argument=value
      ;;    
    --default)
      DEFAULT=YES
      shift # past argument with no value
      ;;
    *)
      # unknown option
      ;;
  esac
done

RUN=$MIN_RUN

while [ $RUN -le $MAX_RUN ]
do
  ID="n_${SIZE}_m_${M_ATACH}_p_${PROB}_h_${STACK_HEIGHT}_cv_${CONV_COST}_ec_${ENCAP_COST}_topo_${RUN}"
  TASKS=32
  NODES=$(($((SIZE/TASKS))+1))  
  sbatch -J "$ID" --time "${TIME_RUN_H}:${TIME_RUN_M}:${TIME_RUN_S}" --nodes "$NODES" --tasks-per-node "$TASKS" run_rand_topo_one_run_n_m_p_h_cv_ec.slurm "$RUN" "$SIZE" "$M_ATACH" "$PROB" "$STACK_HEIGHT" "$CONV_COST" "$ENCAP_COST"
	RUN=$(( $RUN + 1 ))
done

# run with : ./mcia_run_rand_topos.sh -th=0 -tm=5 -ts=0 -min=0 -max=9 -n=100 -m=5 -p=0.10 -h=3 -cv=1 -ec=1