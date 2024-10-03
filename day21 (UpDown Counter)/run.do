vlib work 
vdel -all
vlib work
vlog up4down4.sv +acc
vlog tb.sv +acc
vsim work.tb
add wave -r *
run -all