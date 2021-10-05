read_verilog unstripe.v 
hierarchy -check -top unstripe
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty cmos_cells.lib
abc -liberty cmos_cells.lib
clean
show  -lib cmos_cells.v unstripe
write_verilog unstripe_est.v
