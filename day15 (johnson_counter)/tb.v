module tb;
parameter N = 4;
reg clk,rst;
wire [3:0] counter;

  johnson_counter dut (clk,rst,counter);
 
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
    $strobe("\t time: %0t  Count : %b", $time, counter);
	end
    
    end
endmodule





        

