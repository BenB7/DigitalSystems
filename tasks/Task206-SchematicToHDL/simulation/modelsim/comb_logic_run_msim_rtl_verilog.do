transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/bbright1/Documents/DigitalSystems/tasks/Task206-SchematicToHDL {C:/Users/bbright1/Documents/DigitalSystems/tasks/Task206-SchematicToHDL/comb_logic.v}

