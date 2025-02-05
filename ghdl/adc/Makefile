all: modules-a modules-e testbenches

modules-a:
	echo "*** modules analysis ***"
	ghdl -a ../integration/common.vhd
	ghdl -a registers_relay.vhd
	ghdl -a adc.vhd
modules-e:
	echo "*** module elaboration ***"
	ghdl -e registers_relay
	ghdl -e adc
testbenches:
	echo "*** testbench analysis and elaboration ***"
	ghdl -a -fsynopsys tb/registers_relay_tb.vhd
	ghdl -e -fsynopsys registers_relay_tb
	ghdl -a -fsynopsys tb/adc_tb.vhd
	ghdl -e -fsynopsys adc_tb
run-units:
	ghdl -r -fsynopsys registers_relay_tb --stop-time=350ns
	ghdl -r -fsynopsys adc_tb --stop-time=350ns

