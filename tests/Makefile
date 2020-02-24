fsm:
	verilator -cc -exe ../src/fsm.sv sim_fsm.cpp
	make -j 4 -C obj_dir -f Vfsm.mk

alu:
	verilator -cc -exe ../src/alu.sv sim_alu.cpp -I../src
	make -j 4 -C obj_dir -f Valu.mk

clean:
	rm -rf obj_dir/