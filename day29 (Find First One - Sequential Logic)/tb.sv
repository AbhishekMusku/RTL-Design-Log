module top;
localparam N = 32;
reg [0:N-1] b;
wire v, ve;
wire [0:$clog2(N)-1] p, pe;
bit Error;

reg start, reset;
reg clock = '1;
wire ready;

// wait for ready but timeout if too many clock cycles, then check results/report errors
FFO32s FFODUT (clock, reset, start, b, p, ready);

function [0:$clog2(N)-1] FFO (logic [0:N-1] be);
logic [0:$clog2(N)-1] p;
for(int i=0; i<N; i++) begin
	if(be[i]==1) begin
		p=i;
	end
end

return p;
endfunction

task WaitForReady;
begin
fork
	wait(ready);
	repeat(2 * (32) + 4) @(negedge clock);
join_any

if (!ready)
	begin
	$display("Error: timeout while waiting for ready, b = %b",b);
	end
end
endtask

always #50 clock = ~clock;

initial
begin

clock=0;
end

initial
begin

@(negedge clock);
reset = '1;
repeat (2) @(negedge clock);
reset = '0;

b = 'x;
b = b | (1 << N-1);

for(int i=0; i<4; i++) begin
	start = '1;
	@(negedge clock);
	start = '0;	
	WaitForReady;
	if(p==FFO(b))
		$display("Matched b=%b, expected p=%d, actual p = %d", b,p,FFO(b));
	else
		$display("ERROR b=%b, expected p=%d, actual p = %d", b,p,FFO(b));
	@(negedge clock);	
	b = (b >> 1);
end
$finish();
end
	


endmodule
