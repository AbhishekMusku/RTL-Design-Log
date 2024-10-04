module tb;

reg clk=0, rst=1;
wire [6:0] cnt;
always #5 clk=!clk;

initial
begin
    rst=1;
    #2;
    rst=0;
    #2000;
    $finish;
end

updown_double4_during_down KABALI (clk,rst,cnt);

endmodule
