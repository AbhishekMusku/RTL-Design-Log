vlib work 
vdel -all
vlib work
vlog day8.sv -sv
vlog day8_tb.sv -sv
vsim work.day8_tb
#add wave -r *
run -all