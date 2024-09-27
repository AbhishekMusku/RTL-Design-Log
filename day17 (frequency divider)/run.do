vlib work 
vdel -all
vlib work
vlog divideBy2.v 
vlog tb.v 
vsim work.tb
add wave -r *
run -all