vlib work 
vdel -all
vlib work
vlog day6.sv -sv
vlog day6_tb.sv -sv
vsim work.day6_tb
add wave -r *
run -all