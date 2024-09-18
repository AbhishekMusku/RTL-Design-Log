vlib work 
vdel -all
vlib work
vlog dff.sv +acc
vlog top_que_forever.sv +acc
vsim work.top
add wave -r *
run -all