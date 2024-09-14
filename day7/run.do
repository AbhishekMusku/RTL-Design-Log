vlib work 
vdel -all
vlib work
vlog day7.sv -sv
vlog day7_tb.sv -sv
vsim work.day7_tb
add wave -r *
run -all