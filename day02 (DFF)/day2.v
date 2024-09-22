module day2 (
            clk,
            reset,
            d_i,
            q_norst_o,
            q_syncrst_o,
            q_asyncrst_o
);

    input         clk;
    input        reset;
    input        d_i;
    output reg        q_norst_o;
    output reg       q_syncrst_o;
    output reg        q_asyncrst_o;
  // No reset
  always @(posedge clk)
    q_norst_o <= d_i;

  // Sync reset
  always @(posedge clk)
    if (reset)
      q_syncrst_o <= 1'b0;
    else
      q_syncrst_o <= d_i;

  // Async reset
  always @(posedge clk or posedge reset)
    if (reset)
      q_asyncrst_o <= 1'b0;
    else
      q_asyncrst_o <= d_i;

endmodule