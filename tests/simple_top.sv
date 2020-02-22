module simple_top(input logic a, b,
output logic c);
    initial begin
        $display("Simulation");
        $finish;
    end
endmodule