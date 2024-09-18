`include "pgm_tb.sv"

interface dff_intf(input clk);
  logic top_rst;
  logic [3:0] top_d;
  logic [3:0] top_q;
  
  modport dut ( input clk, top_rst, top_d, output top_q);
  modport pgm (input clk, top_q, output top_rst, top_d);
endinterface

module top;

  reg clk;

dff_intf inst(clk);



	dut UUT (inst);
  // Instantiate the DUT (Device Under Test)
/*  dut UUT (
    .clk(clk),
    .rst(inst.top_rst),
    .D(inst.top_d),
    .Q(inst.top_q)
  );
*/  
  pgm_tb p_tb (inst);
  
/*  
  pgm_tb p_tb (
	.p_clk(clk),
    .p_rst(inst.top_rst),
    .p_d(inst.top_d),
    .p_q(inst.top_q)
  );
*/
  // Clock generation
  always #5 clk = ~clk; // Clock with a period of 10 units
  
  initial begin 
	clk = 0;
	end


endmodule
