vlib work 
vdel -all
vlib work
vlog mod_N_counter.v 
vlog tb.v 
vsim work.tb
add wave -r *
run -all