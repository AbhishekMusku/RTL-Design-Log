vlib work 
vdel -all
vlib work
vlog dff.sv +acc
vlog top_pgm.sv +acc
vlog pgm_tb.sv +acc
vsim work.top
add wave -r *
run -all