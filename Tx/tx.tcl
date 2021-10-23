read_verilog phy_tx.v
hierarchy -check -top phy_tx
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty cmos_cells.lib
abc -liberty cmos_cells.lib
clean
show  -lib cmos_cells.v phy_tx
write_verilog phy_tx_est.v
