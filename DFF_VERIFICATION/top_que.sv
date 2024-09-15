module top;
  reg clk, rst;
  reg [3:0] D;
  wire [3:0] Q;
  reg [3:0] C1;

  // Instantiate the DUT (Device Under Test)
  dut UUT (
    .clk(clk),
    .rst(rst),
    .D(D),
    .Q(Q)
  );

  // Clock generation
  always #5 clk = ~clk; // Clock with a period of 10 units
  
  initial begin 
	clk = 0;
	rst = 0;
    
    // Apply reset
    #1;
    rst = 1;
    #1;
    rst = 0;
	
	end

reg unsigned [3:0] exp[$], dur[$];
	
	initial begin
	// Store the initial value of D
	C1 = $random;
	exp.push_front(C1);
	D <= C1;
	end
	

  initial begin

	repeat(10) 
	begin
		@(negedge clk);
		dur.push_front(Q);
		// Wait for a positive clock edge
		@(posedge clk);
		D <= $random;
		C1=D;
		exp.push_front(C1);
		// Check if C1 matches Q after reset

	end
		@(negedge clk);
		dur.push_front(Q);	
	$display(exp);
	$display(dur);
	$finish;
  end
  

endmodule
