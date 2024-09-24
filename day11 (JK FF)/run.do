vlib work 
vdel -all
vlib work
vlog jk_ff.v 
vlog tb.v 
vsim work.tb
add wave -r *
run -all