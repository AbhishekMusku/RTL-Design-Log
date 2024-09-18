module top;
  reg clk, rst;
  reg [3:0] D;
  wire [3:0] Q;
  reg [3:0] C1;
	reg [3:0] expv;
	
	int matched, mismatched;
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
	exp.push_front(0);
    #1;
    rst = 0;
	end

reg unsigned [3:0] exp[$], dur[$];
	
	initial begin
	// Store the initial value of D
	C1 = $urandom();
	D <= C1;
	end
	

  initial begin

	repeat(10) 
	begin
		@(posedge clk);
		C1=D;
		exp.push_front(C1);
		// Check if C1 matches Q after reset

	end
	$display("%p", exp);
	$display("%p", dur);
	$finish;
  end
  
  
  initial begin
	forever @(Q) begin
		dur.push_front(Q);
		expv = exp.pop_back();
		if(expv == Q) begin
		matched++;
		$display(" Matched exp = %d  actual = %d  at time t=%0t", expv, Q, $time);
		end
		else begin
		mismatched++;
		$display("Mismatched exp = %d  actual = %d  at time t=%0t", expv, Q, $time);
		/*if(mismatched==5)
		$display("mismatch exceeded");*/
		end
	end
	end
	
always @(posedge clk) D <= $urandom();

endmodule




