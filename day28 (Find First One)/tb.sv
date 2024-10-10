module top;

parameter N = 32;
reg [0:N-1] b;
wire v, ve;
wire [0:$clog2(N)-1] p, pe;
bit Error;


FFOp #(N) FFOKGD (b, v, p);

function [0:$clog2(N)-1] FFO (logic [0:N-1] be);
logic [0:$clog2(N)-1] p;
for(int i=0; i<N; i++) begin
	if(be[i]==1) begin
		p=i;
	end
end

return p;
endfunction

initial
begin

Error = 1'b0;

b = 'x;
b = b | (1 << N-1);
for ( int i = 0; i <= N; i++)
	begin
	#100;
//	$display("%b %d %b",v,p,b);
	if (p !== FFO(b))
		begin
		$display("Error: b = %b, got p = %d, expected pe = %d", b, p, FFO(b));
		Error = 1'b1;		
		end
	else 
		$display("Matched : b = %b, got p = %d, expected pe = %d", b, p, FFO(b));
	b = (b >> 1);		
	end
	
if (Error)
	$display("\n\n *** FAILED *** \n\n");
else
	$display("\n\n *** PASSED *** \n\n");
end
endmodule