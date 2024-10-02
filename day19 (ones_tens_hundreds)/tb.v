module tb;
    reg clk, rst;
    wire [3:0] hun, ten, unit;

    count999_1 KABALI (clk, rst, hun, ten, unit);

    initial 
	begin
        clk = 0;
        repeat (11000) begin
            clk = !clk;
			        #5;
    end
end
initial 
begin
#2;
    rst = 1;
    #2;
    rst = 0;
end

endmodule
