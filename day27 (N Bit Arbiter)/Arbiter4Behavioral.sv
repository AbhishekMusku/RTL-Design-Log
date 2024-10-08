/*
 *
 * behavioral description of 4 agent arbiter
 *
 */


module Arbiter4(r, g);
input [0:3]r;
output reg [0:3]g;

always @(r)
	begin
	casez (r)
		4'b1???:	g = 4'b1000;
		4'b01??:	g = 4'b0100;
		4'b001?:	g = 4'b0010;
		4'b0001:	g = 4'b0001;
		default:	g = 4'b0000;
	endcase
	end
endmodule
