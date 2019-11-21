#compile the SystemVerilog file
vlog mux.sv

#load the simulation
vsim work.mux

#restart simulation if there was something at the wave screen
restart -f

#add waves
add wave -position insertpoint sim:/mux/*

#Set the input clock (25Mhz)
force -freeze sim:/mux/clk 1 0, 0 {10 ns} -r 20

#This input is to simulate if AND gate output is 1 which is the select of mux
force -freeze sim:/mux/select_input 1'h1 0

#set RGB input values
force -freeze sim:/mux/R_in 2'h0 0
force -freeze sim:/mux/G_in 2'h1 0
force -freeze sim:/mux/B_in 2'h2 0

#To change the property of a wafe form from one number base to another use:
#property wave -radix unsigned /mux/R_in

#run for a few clock cycles
run 40
