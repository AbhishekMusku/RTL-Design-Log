module tb;
reg clk,rst,t;
wire Q;

  t_ff dut (t,clk,rst,Q);
 
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
	#5;	
	t = 1'b0;    
	#10;
	 
	t = 1'b0;   
	#10;
	 
	t = 1'b1;  
	#10;
	 
	t = 1'b1;
	 #10;
	 #10;
	 $finish;
    end 
    
    initial begin
	forever @(Q)
	begin
    $strobe("\t time: %0t  T: %d Q: %d", $time, t, Q);
	end
    
    end
endmodule

