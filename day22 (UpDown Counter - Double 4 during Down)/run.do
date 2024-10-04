vlib work 
vdel -all
vlib work
vlog updown_double4_during_down.sv +acc
vlog tb.sv +acc
vsim work.tb
add wave -r *
run -all