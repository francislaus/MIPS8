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

clean:
	rm -rf obj_dir/