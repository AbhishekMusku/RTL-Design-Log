vlib work 
vdel -all
vlib work
vlog day2.v
vlog day2_tb.v
vsim work.day2_tb
add wave -r *
run -all