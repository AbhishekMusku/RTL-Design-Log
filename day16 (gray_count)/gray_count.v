module gray_counter(
    input clk,rst,
    output [3:0] gray_count
    );

    reg [3:0] bin_count;
   
    always@(posedge clk or posedge rst)
    begin 
        if(rst)
            begin
                bin_count <= 4'b0000;
            end
        else
            begin
                bin_count <= bin_count + 1;
            end
    end

		assign gray_count = {bin_count[3],bin_count[3]^bin_count[2],bin_count[2]^bin_count[1],bin_count[1]^bin_count[0]};
endmodule