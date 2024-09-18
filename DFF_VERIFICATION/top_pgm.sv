`include "pgm_tb.sv"
module top;
  reg clk;
  wire rst;
  wire [3:0] d_tb;
  wire [3:0] q_tb;

	int matched, mismatched;
  // Instantiate the DUT (Device Under Test)
  dut UUT (
    .clk(clk),
    .rst(rst),
    .D(d_tb),
    .Q(q_tb)
  );
  
  pgm_tb p_tb (
	.p_clk(clk),
    .p_rst(rst),
    .p_d(d_tb),
    .p_q(q_tb)
  );
  // Clock generation
  always #5 clk = ~clk; // Clock with a period of 10 units
  
  initial begin 
	clk = 0;
	end


endmodule
