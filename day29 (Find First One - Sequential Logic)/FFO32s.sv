// Moore FSM:  Straightforward 3-states

module FFO32s(clock, reset, start, b, p, ready);
input clock, reset, start;
input [0:31] b;
output [0:4] p;
output reg ready;

enum {IDLE,	LOAD, CHECK, NEXT} State, NextState;


reg [31:0] Count;
reg [31:0] SR;

reg ClearCount, IncCount;
reg LoadSR, ShiftSR;

assign p = Count[31:0];


// counter
always_ff @(posedge clock)
begin
if (ClearCount)
	Count <= '0;
else
	if (IncCount)
		Count <= Count + 1'b1;
	else
		Count <= Count;
end


// shift register
always_ff @(posedge clock)
begin
if (LoadSR)
	SR <= b;
else
	if (ShiftSR)
		SR <= SR << 1;
	else
		SR <= SR;
end


// sequential logic
always_ff @(posedge clock)
begin
if (reset)
	State <= IDLE;	
else
	State <= NextState;
end


// next state combinational logic
always_comb
begin
NextState = State;
case (State)
	IDLE:	if (start)
				NextState = LOAD;
				
	LOAD:	NextState = CHECK;
	
	CHECK:	if (SR[31] || Count == 31)
				NextState = IDLE;
			else
				NextState = CHECK;
endcase
end


// output combinational logic
always_comb
begin
{ready, LoadSR, ShiftSR, IncCount, ClearCount} = '0;

case (State)
	IDLE:	begin
			ready = '1;		
			end
			
	LOAD:	begin
			LoadSR = '1;
			ClearCount = '1;
			end
	
	CHECK:	begin
			if (!SR[31] && !(Count == 31)) 
				begin
				ShiftSR = '1;
				IncCount = '1;
				end
			end
endcase
end

endmodule



