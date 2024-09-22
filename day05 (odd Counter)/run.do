vlib work 
vdel -all
vlib work
vlog day5.sv -sv
vlog day5_tb.sv -sv
vsim work.day5_tb
add wave -r *
run -all