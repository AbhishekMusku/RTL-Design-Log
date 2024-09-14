module day9 #(
  parameter VEC_W = 4
)(
  input     wire[VEC_W-1:0] bin_i,
  output    wire[VEC_W-1:0] gray_o

);

 // Generate the Gray code from the binary input
  assign gray_o[VEC_W-1] = bin_i[VEC_W-1];                // MSB remains the same
  generate
    genvar i;
    for (i = 0; i < VEC_W-1; i = i + 1) begin : gen_gray
      assign gray_o[i] = bin_i[i+1] ^ bin_i[i];            // XOR for each bit
    end
  endgenerate

endmodule
