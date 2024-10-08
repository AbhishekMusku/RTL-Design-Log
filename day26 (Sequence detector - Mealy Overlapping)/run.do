vlib work 
vdel -all
vlib work
vlog seq_detector_1010.sv -sv +acc
vlog tb.sv -sv +acc 
vsim work.tb
add wave -r *
run -all