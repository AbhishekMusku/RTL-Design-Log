module updown_double4_during_down (clk,rst,cnt);
input clk,rst;
output [2:0] cnt;

reg [2:0] cnt;

//reg [1:0] state;
//parameter UP=2'b00,DOWN=2'b01,F4=2'b10,S4=2'b11;

enum {UP,DOWN,F4,S4} state; //vlog -sv

always @(posedge clk or posedge rst)
begin
    if (rst) state<=UP;
	    else
    begin
        case (state)
            UP    : state <= cnt==6 ? DOWN : UP;
            DOWN  : if (cnt==1) state <= UP;
                    else state <= cnt==5 ? F4 : DOWN;
            F4    : state <= S4;
            S4    : state <= DOWN;
        endcase
    end
end

always @(posedge clk or posedge rst)
begin
    if (rst) cnt<=0;
    else
    case(state)
        UP    : cnt <= cnt+1;
        DOWN  : cnt <= cnt-1;
        F4    : cnt <= 4;
        S4    : cnt <= 3;
    endcase
end

endmodule
