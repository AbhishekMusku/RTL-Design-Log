//Mod 15 counter ( Skip 7,8)
module mod_N_counter
      #(parameter N = 14,
        parameter LENGTH = 4)
        
       (input clk,rst, output reg [LENGTH-1:0] counter);
        
        always@(posedge clk or posedge rst)
        begin
            if(rst)
            counter <= 0;
            else
                if(counter == N-1)
					counter <= 0;
                else if(counter == 6)
					counter <= 9;
				else
					counter <= counter + 1;
         end        
endmodule