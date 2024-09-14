module tb;
	reg clk;
	reg L;
	reg r1,r2,r3;
	wire q1, q2, q3;

top_module DUT(clk, L, r1,r2,r3, q1, q2, q3);


  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end
  
  
initial
begin

L=1; r1=1; r2=0;r3=0;
@(posedge clk);
L=0;
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
$finish;
end
endmodule

