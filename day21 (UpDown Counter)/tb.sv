module tb;
reg clk=0; always #5 clk=!clk;
reg rst=1; initial #2 rst=0;
wire [3:0] cnt;
initial #200 $finish;

updown KABALI (clk,rst,cnt);

endmodule

