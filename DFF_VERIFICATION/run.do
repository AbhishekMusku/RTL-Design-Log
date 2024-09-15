vlib work 
vdel -all
vlib work
vlog dff.sv +acc
vlog top_SelfCheck1.sv +acc
vsim work.top
add wave -r *
run -all