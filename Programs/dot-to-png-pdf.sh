#!/bin/sh

format="$1"
input_dir="$2"
output_dir="$3"

sfdp -x -Goverlap=scale -T${format} $input_dir > $output_dir

# run with : dot-to-png-pdf.sh png ../RandomTopologies/n_1OO_p_0.10_topo_3.dot ../RandomTopologies/n_1OO_p_0.10_topo_3.png   