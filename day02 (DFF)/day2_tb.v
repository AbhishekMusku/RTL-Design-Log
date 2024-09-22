module day2_tb ();

  // Write your Testbench here...
	reg	   clk;
    reg      reset;
    reg      d_i;         
    wire      q_norst_o;   
    wire      q_syncrst_o; 
    wire      q_asyncrst_o ;

day2 DUT(clk,reset,d_i,q_norst_o,q_syncrst_o,q_asyncrst_o);
	
	initial
	begin
	reset=1;
	#2;
	reset=0;
	#10
	reset=1;
	#12
	reset=0;
	end
	
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end
	
	initial
	begin
	repeat(10) begin
	d_i<=$random;
	@(posedge clk);
	end
	$finish();
	end
endmodule
