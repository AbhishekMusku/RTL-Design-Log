module top;
parameter N = 4;
reg Reset;
reg [N-1:0] Multiplicand, Multiplier;
wire [2*N-1:0] Product;
reg Start;
bit Clock = '1;
wire Ready;
bit Error;


// Wait for ready but timeout with error if too long
task WaitForReady;
begin
fork
	wait(Ready);
	repeat(2 * (N) + 4) @(negedge Clock);
join_any

if (!Ready)
	begin
	$display("Error: timeout while waiting for ready, Multiplicand = %b, Multiplier = %b", Multiplicand, Multiplier);
	Error = '1;
	end
end
endtask

SequentialMultiplier #(N) SM(Clock, Reset, Multiplicand, Multiplier, Product, Ready, Start);

initial
begin

forever #50 Clock <= ~Clock;
end



initial
begin
Reset = '1;
@(negedge Clock);
Reset = '0;
@(negedge Clock);

// exhaustive test
	for(int i=0; i<5; i++) begin
		Start = '1;
		Multiplicand = $urandom();
		Multiplier = $urandom();
		@(negedge Clock);
		Start = '0;
		WaitForReady;
		if(Product !== Multiplicand*Multiplier)
			$display("ERROR Multiplicand=%d, Multiplier=%d, expected Product=%d, actual Product=%d", Multiplicand,Multiplier,Product,Multiplicand*Multiplier);
		else
			$display("MATECHED Multiplicand=%d, Multiplier=%d, expected Product=%d, actual Product=%d", Multiplicand,Multiplier,Product,Multiplicand*Multiplier);
		@(negedge Clock);
	end


$finish();
end

endmodule