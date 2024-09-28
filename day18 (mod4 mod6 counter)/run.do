vlib work 
vdel -all
vlib work
vlog mod4mod6.sv +acc
vlog tb.sv +acc
vsim work.tb
add wave -r *
run -all