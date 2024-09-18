module dut (dff_intf.dut dif);

always @(posedge dif.clk or posedge dif.top_rst)
begin
  if (dif.top_rst) dif.top_q <= 0;
  else dif.top_q <= dif.top_d;
end

endmodule