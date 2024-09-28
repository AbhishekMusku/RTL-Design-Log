//Mod 4 Mod 6 counter (0 1 2 3 0 1 2 3 4 5 0 1 2 3 0 1 2 3 4 5....)
module mod4mod6_sandwich(clk,rst,cnt);
input clk,rst;
output [3:0] cnt;

reg [3:0] cnt;
reg state; //1bit
parameter mod4=1,mod6=0;

always @(posedge clk or posedge rst)
begin
    if(rst) cnt<=0;
    else
    begin
        case(state)
            mod4: cnt<=(cnt==3)?0:(cnt+1);
            mod6: cnt<=(cnt==5)?0:(cnt+1);
        endcase
	end
end
always @(posedge clk or posedge rst)
begin
    if (rst) state<=mod4;
    else
    begin
        case(state)
            mod4: state<=(cnt==3)?mod6:mod4;
            mod6: if (cnt==5) state<=mod4;
                  else state<=mod6;
        endcase
    end
end

endmodule

	