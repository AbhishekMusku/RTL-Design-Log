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
    // Initialize signals
    clk = 0;
    D <= $random;
    rst = 0;
    
    // Apply reset
    #1;
    rst = 1;
    #1;
    rst = 0;

	repeat(10) 
	begin
		// Store the initial value of D
		C1 = D;

		// Wait for a positive clock edge
		@(posedge clk);
		D <= $random;

		// Check if C1 matches Q after reset
		$strobe("%s", C1 == Q ? "PASS" : "FAIL");

		// Wait for a negative clock edge
		@(negedge clk);
	end
	$finish;
  end
endmodule
