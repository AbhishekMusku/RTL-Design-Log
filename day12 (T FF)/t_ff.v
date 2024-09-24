module t_ff(
    input t,clk,rst,
    output reg Q
    );
	
    always@(posedge clk or posedge rst) begin
			if(rst)
               Q <= 1'b0;
            else
                begin
                   if(t)
                    Q <= ~Q;
                   else
                    Q <= Q;                     
                end
          end
endmodule