module day5 (
  input     wire        clk,
  input     wire        reset,

  output    logic[2:0]  cnt_o
);


  always @(posedge clk or posedge reset)
    if(reset)
      cnt_o <=  8'h1;
  else
    cnt_o <= cnt_o + 2;
endmodule