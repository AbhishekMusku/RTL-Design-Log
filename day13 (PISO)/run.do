vlib work 
vdel -all
vlib work
vlog piso.v 
vlog tb.v 
vsim work.tb
add wave -r *
run -all