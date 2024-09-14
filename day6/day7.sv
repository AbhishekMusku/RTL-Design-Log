// LFSR
module day7 (
  input     wire      clk,
  input     wire      reset,

  output    wire[3:0] lfsr_o
);

  // Write your logic here...
  always_ff @(posedge clk or posedge reset)
    begin
      if(reset)
        lfsr_o <= 0;
      else
        lfsr_o <= {lfsr_o[2:0],lfsr_ff[1] ^ lfsr_ff[3]};
endmodule
