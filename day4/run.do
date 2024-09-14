vlib work 
vdel -all
vlib work
vlog day4.sv -sv
vlog day4_tb.sv -sv
vsim work.day4_tb
run -all