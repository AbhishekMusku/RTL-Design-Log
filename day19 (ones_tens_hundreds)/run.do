vlib work 
vdel -all
vlib work
vlog cnt999_1.v +acc
vlog tb.v +acc
vsim work.tb
add wave -r *
run -all