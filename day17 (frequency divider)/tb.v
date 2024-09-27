module tb;
reg clk,rst;
wire clkOut;

  DivideBy2 dut (clk,rst,clkOut);
 
	always #5 clk = !clk;
 
  initial begin 
  clk=0;
  	#2;
	rst=1;
	#2;
	rst=0;
  end
  
  initial 
    begin
	repeat (20) begin
	@(posedge clk);
	end
	$finish;
    end 
    
endmodule