vlib work 
vdel -all
vlib work
vlog dff.sv +acc
vlog top.sv +acc
vsim work.top
add wave -r *
run -all