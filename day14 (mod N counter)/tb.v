module tb;
parameter N = 6;
parameter LENGTH = 3;
reg clk,rst;
wire [LENGTH-1:0] counter;

  mod_N_counter dut (clk,rst,counter);
 
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
	repeat (10) begin
	@(posedge clk);
	end
	$finish;
    end 
    
    initial begin
	forever @(counter)
	begin
    $strobe("\t time: %0t  Count : %d", $time, counter);
	end
    
    end
endmodule





        

