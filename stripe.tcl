read_verilog stripe.v 
hierarchy -check -top stripe
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty cmos_cells.lib
abc -liberty cmos_cells.lib
clean
show  -lib cmos_cells.v stripe
write_verilog stripe_est.v
