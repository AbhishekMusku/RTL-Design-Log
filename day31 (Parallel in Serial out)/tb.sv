module day11_tb ();

  logic      clk;
  logic      reset;
  logic 	 start;   
  logic      empty_o;
  logic[3:0] parallel_i;
  logic      serial_o;
  logic      valid_o;

  piso DAY11 (.*);

  // Clock
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  // Stimulus
  initial begin
    reset <= 1'b1;
    parallel_i <= 4'h0;
    @(negedge clk);
    reset <= 1'b0;
    @(posedge clk);
    for (int i=0; i<15; i=i+1) begin
			start=1;
      parallel_i <= $urandom_range(0, 4'hF);
      @(posedge clk);
	  start=0;
	  repeat(4) @(posedge clk);
    end
    $finish();
  end

endmodule