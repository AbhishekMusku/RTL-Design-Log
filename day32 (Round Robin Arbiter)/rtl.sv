module rra(
  input logic clk,
  	          rst_b,
  input logic [3:0] request,
  output logic [3:0] grant
);

logic [1:0] pointer_request, next_pointer_request;
  
  always_ff @(posedge clk or negedge rst_b) begin
    if (!rst_b) pointer_request <= '0;
    else       pointer_request <= next_pointer_request;//next_pointer_request;
  end
  
  always_comb begin
    next_pointer_request = pointer_request;
    casez (grant)
      4'b0001: next_pointer_request = 2'b01;
      4'b0010: next_pointer_request = 2'b10;
      4'b0100: next_pointer_request = 2'b11;
      4'b1000: next_pointer_request = 2'b00;
    endcase
  end 

always_comb begin
	case (pointer_request)
		2'b00 :
			if (request[0]) grant = 4'b0001;
			else if (request[1]) grant = 4'b0010;
			else if (request[2]) grant = 4'b0100;
			else if (request[3]) grant = 4'b1000;
			else grant = 4'b0000;
		2'b01 :
			if (request[1]) grant = 4'b0010;
			else if (request[2]) grant = 4'b0100;
			else if (request[3]) grant = 4'b1000;
			else if (request[0]) grant = 4'b0001;
			else grant = 4'b0000;
      		2'b10 :
			if (request[2]) grant = 4'b0100;
			else if (request[3]) grant = 4'b1000;
			else if (request[0]) grant = 4'b0001;
			else if (request[1]) grant = 4'b0010;
			else grant = 4'b0000;
		2'b11 :
			if (request[3]) grant = 4'b1000;
			else if (request[0]) grant = 4'b0001;
			else if (request[1]) grant = 4'b0010;
			else if (request[2]) grant = 4'b0100;
			else grant = 4'b0000;
	endcase // case(request)
end

endmodule
