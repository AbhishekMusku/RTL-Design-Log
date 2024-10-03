//UPdown counter pattern 0 1 2 3 4 3 2 1 0 1 2 3 4 3 2 1 0 ....
module updown(clk,rst,cnt);
input clk,rst;
output [3:0] cnt;

reg [3:0] cnt;
reg state; //1bit
parameter up=1,down=0;
//enum {mod4,mod6} state; //vlog -sv
always @(posedge clk or posedge rst)
begin
    if(rst) cnt<=0;
    else
    begin
        case(state)
			up: cnt<=(cnt+1);
			down: cnt<=(cnt-1);
            //up: cnt<=(cnt==4)?0:(cnt+1);
            //down: cnt<=(cnt==0)?3:(cnt-1);
        endcase
	end
end
always @(posedge clk or posedge rst)
begin
    if (rst) state<=up;
    else
    begin
        case(state)
            up: state<=(cnt==3)?down:up;
            down: if (cnt==1) state<=up;
                  else state<=down;
        endcase
    end
end

endmodule

	