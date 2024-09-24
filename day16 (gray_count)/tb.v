module tb;
reg clk,rst;
wire [3:0] gray_count;

  gray_counter dut (clk,rst,gray_count);
 
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
	forever @(gray_count)
	begin
    $strobe("\t time: %0t  Count : %b", $time, gray_count);
	end
    
    end
endmodule





        

