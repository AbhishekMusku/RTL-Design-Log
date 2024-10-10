module FFOp(b, v, p);
parameter w = 4;
input [0:w-1] b;
output reg v;
output reg [0:$clog2(w)-1]p;

reg [0:w-1] t;

always_comb
    begin
    v = '0;
    p = '0;
    if (b != 0)
        begin
        t = 1 << (w - 1);
        v = 1'b1;
        while (!(b & t))
            begin
            t = t >> 1;
            p = p + 1'b1;
            end
        end
    end
endmodule