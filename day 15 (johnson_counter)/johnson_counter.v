/* For an n-bit Johnson counter, you also use n flip-flops
The Johnson counter cycles through 2n unique states */

module johnson_counter #(parameter N=4)
    (input clk, rst,
    output reg [3:0] counter);

always@(posedge clk or posedge rst)
    begin
        if(rst) 
            counter <= 0; 
        else 
            counter <= {~counter[0], counter[N-1:1]};  
    end 
endmodule