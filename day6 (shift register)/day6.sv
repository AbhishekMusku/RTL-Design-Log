// Simple shift register
module day6(
  input     wire        clk,
  input     wire        reset,
  input     wire        x_i,      // Serial input

  output    reg [3:0]   sr_o
);

  // Write your logic here...

  always_ff @(posedge clk or posedge reset) begin
    if(reset)
      sr_o <= 4'b0;
    else
      sr_o <= {sr_o[2:0],x_i};
    end
endmodule