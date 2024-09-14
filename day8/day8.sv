// Binary to one-hot
module day8(
  input   wire[4-1:0]     bin_i,
  output  reg[16-1:0] one_hot_o
);

  localparam BIN_W       = 4;
  localparam ONE_HOT_W   = 16;


  // Write your logic here...
always_comb
  begin
  one_hot_o =0;
  one_hot_o[bin_i] = 1;
  end
endmodule



