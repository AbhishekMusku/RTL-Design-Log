module count999 (clk, rst, hun, ten, unit);
input clk, rst;
output [3:0] hun, ten, unit;

wire [3:0] t1, t2, t3;
reg [3:0] hun;
wire s1, s2, s3, s4;
wire [3:0] p1, p2, p3, p4, p5;
reg [3:0] ten, unit;
wire sig1, sig2;

assign t1 = hun + 1;
assign s1 = (hun == 9);
assign t2 = s1 ? 0 : t1;
assign s2 = unit == 9;
assign s3 = ten == 9;
assign s4 = s2 && s3;
assign t3 = s4 ? t2 : hun;

always @(posedge clk or posedge rst)
begin
    if (rst) 
        hun <= 0;
    else 
        hun <= t3;
end

assign p1 = unit + 1;
assign sig1 = unit == 9;
assign p2 = sig1 ? 0 : p1;
always @(posedge clk or posedge rst)
begin
    if (rst) 
        unit <= 0;
    else 
        unit <= p2;
end

assign p3 = ten + 1;
assign sig2 = ten == 9;
assign p4 = sig2 ? 0 : p3;
assign p5 = sig1 ? p4 : ten;

always @(posedge clk or posedge rst)
begin
    if (rst) 
        ten <= 0;
    else 
        ten <= p5;
end

endmodule