module SequentialMultiplier(clock, reset, multiplicand, multiplier, product, ready, start);
parameter N = 4;
input clock;
input reset;
input [N-1:0] multiplicand, multiplier;
output [2*N-1:0] product;
output reg ready;
input start;

reg [N-1:0] A, Q, M;
reg C;
reg [N-1:0] Counter;

reg CarryOut;
reg [N-1:0] Sum;

reg ClearA;
reg LoadA;
reg ShiftAQ;
reg Zero;
reg AdderMuxSelect;
reg LoadCounter;
reg DecrCounter;
reg LoadOperands;

enum logic [3:0] {
	INIT		= 4'b0001,
	LOAD		= 4'b0010,
	ADD			= 4'b0100,	// can be combined with SHIFT
	SHIFT 		= 4'b1000
} State, NextState;


assign product = {A,Q}; 

// C and A register
always_ff @(posedge clock)
begin
if (ClearA)
	{C,A} <= 0;
else if (LoadA)
	{C,A} <=  A + ( Q[0] ? M : 0);
else if (ShiftAQ)
	{C,A} <= {C,A} >> 1;
else
	{C,A} <= {C,A};
end

// Q register
always_ff @(posedge clock)
begin
if (LoadOperands)
	Q <= multiplier;
else if (ShiftAQ)
	Q <= {A[0], Q[N-1:1]};
else
	Q <= Q;
end

// M register
always_ff @(posedge clock)
begin
if (LoadOperands)
	M <= multiplicand;
else 
	M <= M;
end

// Counter
always_ff @(posedge clock)
begin
if (LoadCounter)
	Counter <= N;
else if (DecrCounter)
	Counter <= Counter - 1;
else
	Counter <= Counter;
end

always_ff @(posedge clock)
begin
if (reset)
	State <= INIT;
else
	State <= NextState;
end

always_comb
begin
NextState = State;
case (State)
	INIT:	if (start)
				NextState = LOAD;
	
	LOAD:	NextState = ADD;
	
	ADD:	NextState = SHIFT;
	
	SHIFT:	if (Counter == 0)
				NextState = INIT;
			else
				NextState = ADD;
endcase
end

always_comb
begin
{ready, LoadA, ClearA, ShiftAQ, LoadOperands, LoadCounter, DecrCounter} = '0;
case (State)
	INIT:	begin
			ready = '1;
			end
			
	LOAD:	begin
			ClearA = '1;
			LoadOperands = '1;
			LoadCounter = '1;
			end
			
	ADD:	begin
			DecrCounter = '1;
			LoadA = '1;
			end
			
	SHIFT:	begin
			ShiftAQ = '1;
			end
endcase
end


endmodule