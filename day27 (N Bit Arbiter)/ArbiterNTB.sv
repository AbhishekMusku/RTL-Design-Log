/*
 *
 * self-checking testbench for n-bit arbiter
 *
 */

module top;
parameter n = 4;

reg [0:n-1] r;
wire [0:n-1] g;



// function to compute the expected result.   could also be done as a known good module 

function [0:n-1] Expected;
input [0:n-1] r;

begin
integer i;
reg [0:n-1] g;

g = 0;
for (i = 0; i < n; i++)  // find first 1
	if (r[i])
		begin
		g[i] = 1'b1;
		break;
		end	
return(g);
end
endfunction



integer i;
reg Errors;

ArbiterN #(n) a0(r,g);

initial
begin
Errors = 1'b0;
for (i = 0; i < (2**n); i = i + 1)
    begin
    r = i;
    #100
    if (g !== Expected(r))
    	begin
          $display("*** Error:  r = %b, g = %b, expected = %b",r,g,Expected(r));
          Errors = 1'b1;
    	end
    end
if (Errors)
	$display("\n\n*** FAILED ***\n\n");
else
	$display("\n\n*** PASSED ***\n\n");
end
endmodule
