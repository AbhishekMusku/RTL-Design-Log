vlib work 
vdel -all
vlib work
vlog gray_count.v 
vlog tb.v 
vsim work.tb
add wave -r *
run -all