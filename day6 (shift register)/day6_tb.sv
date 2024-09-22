module day6_tb ();

       logic        clk;
       logic        reset;
       logic        x_i;      // Serial input

      logic[3:0]   sr_o;

  day6 DUT (.*);

  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end

  initial begin
    reset = 1'b1;
    @(posedge clk);
    reset = 1'b0;
    @(posedge clk);
    for (int i=0; i<30; i++) 
	begin
      @(posedge clk);
	  x_i=$random;
	end	
    $finish();
  end

endmodule