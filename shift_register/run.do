vlib work 
vdel -all
vlib work
vlog sf.v
vlog tb.v
vsim work.tb
add wave -r *
run -all