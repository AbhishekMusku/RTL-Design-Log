module tb();
reg clk,rst,j,k;
wire Q;

  jk_ff dut (j,k,clk,rst,Q);
 
	always #5 clk = !clk;
 
  initial begin 
  clk=0;
  end
  
  initial 
    begin
	#2;
	rst=1;
	#2;
	
	rst=0;	 
	j = 1'b0;
	k = 1'b0;     
	#10;
	 
	j = 1'b0;
	k = 1'b1;     
	#10;
	 
	j = 1'b1;
	k = 1'b0;     
	#10;
	 
	j = 1'b1;
	k = 1'b1;
	 #10;
	 #10;
	 $finish;
    end 
    
    initial begin
	forever @(Q)
	begin
    $strobe("\t time: %0t  J: %d  K: %d  Q: %d", $time, j, k, Q);
	end
    
    end
endmodule

