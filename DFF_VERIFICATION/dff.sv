module dut (clk, rst, D, Q);
input [3:0] D;
output reg [3:0] Q;
input clk, rst;

always @(posedge clk or posedge rst)
begin
  if (rst) Q <= 0;
  else Q <= D;
end

endmodule