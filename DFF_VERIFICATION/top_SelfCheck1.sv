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
	
	initial begin
	// Store the initial value of D
	C1 = $random;
	D <= C1;
	end
	

  initial begin

	repeat(10) 
	begin
		
		// Wait for a positive clock edge
		@(posedge clk);
		D <= $random;
		C1=D;
		// Check if C1 matches Q after reset
		@(negedge clk);
		$display("%s check", C1 == Q ? "PASS" : "FAIL");

	end
	$finish;
  end
  

endmodule
