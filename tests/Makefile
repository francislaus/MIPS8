all:
	verilator -cc -exe ../src/fsm.sv sim_main.cpp
	make -j 4 -C obj_dir -f Vfsm.mk

clean:
	rm -rf obj_dir/