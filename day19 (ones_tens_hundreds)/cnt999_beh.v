module count999_beh (clk, rst, hun, ten, unit);
input clk, rst;
output [3:0] hun, ten, unit;

reg [3:0] unit, ten, hun;

always @(posedge clk or posedge rst) // RajaBandi
begin
    if (rst)
        unit <= 0;
    else
    begin // left-out diagram
        if (unit == 9) unit <= 0; // NBA = BA
        else           unit <= unit + 1;
    end
end

always @(posedge clk or posedge rst)
begin
    if (rst) ten <= 0;
    else
    begin
        if (unit == 9)
        begin // left-out
            if (ten == 9) ten <= 0;
            else          ten <= ten + 1;
        end
        else ten <= ten;
    end
end

always @(posedge clk or posedge rst)
begin
    if (rst) hun <= 0;
    else
    begin
        if (unit == 9 && ten == 9)
        begin
            if (hun == 9) hun <= 0;
            else          hun <= hun + 1;
        end
        else hun <= hun;
    end
end

endmodule

