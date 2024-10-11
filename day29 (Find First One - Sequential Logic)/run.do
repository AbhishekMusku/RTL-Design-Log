vlib work 
vdel -all
vlib work
vlog FFO32sm.sv +acc
vlog tb.sv +acc
vsim work.top
add wave -r *
run -all