fsm:
	verilator -cc -exe ../src/fsm.sv sim_fsm.cpp
	make -j 4 -C obj_dir -f Vfsm.mk

alu:
	verilator -cc -exe ../src/alu.sv sim_alu.cpp -I../src
	make -j 4 -C obj_dir -f Valu.mk

aludecoder:
	verilator -cc -exe ../src/aludecoder.sv sim_aludecoder.cpp -I../src
	make -j 4 -C obj_dir -f Valudecoder.mk

regfile:
	verilator -cc -exe ../src/regfile.sv sim_regfile.cpp -I../src
	make -j 4 -C obj_dir -f Vregfile.mk

datapath:
	verilator -cc -exe ../src/datapath.sv sim_datapath.cpp -I../src
	make -j 4 -C obj_dir -f Vdatapath.mk

controller:
	verilator -cc -exe ../src/controller.sv sim_controller.cpp -I../src
	make -j 4 -C obj_dir -f Vcontroller.mk

processor:
	verilator -cc -exe ../src/processor.sv sim_processor.cpp -I../src
	make -j 4 -C obj_dir -f Vprocessor.mk

testbench:
	verilator -cc -exe ../src/testbench.sv sim_testbench.cpp -I../src
	make -j 4 -C obj_dir -f Vtestbench.mk


clean:
	rm -rf obj_dir/