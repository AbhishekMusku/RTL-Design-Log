vlib work 
vdel -all
vlib work
vlog johnson_counter.v 
vlog tb.v 
vsim work.tb
add wave -r *
run -all