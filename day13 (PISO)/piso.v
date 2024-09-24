module piso (   
    input clk, rst, load, 
    input [2:0]parallel_in,
    output serial_out
    );

  reg [2:0]q;
  
  always @ (posedge clk or posedge rst) 
  begin
    if(rst) q<= 0;
    else begin
    if (load)
      q <= parallel_in;
    else
    begin 
      q[0] <= q[1];
      q[1] <= q[2];
      q[2] <= 1'bx;
    end
  end
  end
  assign serial_out= q[0];
endmodule