module top;
  logic rst_b;
  logic [3:0] request;
  logic [3:0] grant;
  logic clk = '1;


rra DUT (clk, rst_b, request, grant);

initial
begin

forever #50 clk <= ~clk;
end



initial
begin
rst_b = '0;
@(posedge clk);
rst_b = '1;

	//for(int i=0; i<16; i++) begin
		@(posedge clk);
		request = 3;
		$display("request = %b grant = %b",request,grant);
		@(posedge clk);
		request = 3;
		$display("request = %b grant = %b",request,grant);
	//end
@(posedge clk);
@(posedge clk);
$finish();
end

endmodule