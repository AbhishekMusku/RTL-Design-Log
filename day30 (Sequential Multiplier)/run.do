vlib work 
vdel -all
vlib work
vlog sm.sv +acc
vlog tb1.sv +acc
vsim work.top
add wave -r *
run -all