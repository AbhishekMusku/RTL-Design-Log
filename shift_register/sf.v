module top_module (
	input clk,
	input L,
	input r1,r2,r3,
	output reg q1, q2, q3);



always @(posedge clk) begin
	q1 <= L?r1:q3;
	q2 <= L?r2:q1;
	q3 <= L?r3:q2;
	end

endmodule