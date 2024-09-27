module DivideBy2 (
  input  clk,
  input  rst,
  output reg clkOut
);

  reg [2:0] count;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count  <= 0;
      clkOut <= 0;
    end
    else begin
      count <= count + 1;
      if (count == 2'b01) begin
        count  <= 0;
        clkOut <= ~clkOut;
      end
    end
  end

endmodule