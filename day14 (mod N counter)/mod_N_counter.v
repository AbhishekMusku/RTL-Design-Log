module mod_N_counter
      #(parameter N = 6,
        parameter LENGTH = 3)
        
       (input clk,rst, output reg [LENGTH-1:0] counter);
        
        always@(posedge clk or posedge rst)
        begin
            if(rst)
            counter <= 0;
            else
                if(counter == N-1)
                counter <= 0;
                else
                counter <= counter + 1;
         end        
endmodule