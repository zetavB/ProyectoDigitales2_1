read_verilog genClock.v
hierarchy -check -top genClock
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty cmos_cells.lib
abc -liberty cmos_cells.lib
clean
show  -lib cmos_cells.v genClock
write_verilog genClock_est.v
