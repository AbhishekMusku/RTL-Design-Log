module round_robin_arbiter (
    input wire clk,
    input wire reset,
    input wire [3:0] request,  // 4-bit request input
    output reg [3:0] grant     // 4-bit grant output
);

    reg [1:0] priority;  // Priority pointer (2 bits for 4 requesters)

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            grant <= 4'b0000;
            priority <= 2'b00;  // Initialize priority pointer to 0
        end else begin
            grant <= 4'b0000;  // Default grant value (no grants)

            // Round Robin logic: Grant based on current priority and request
            case (priority)
                2'b00: if (request[0]) grant <= 4'b0001;  // Grant to Requester 0
                       else if (request[1]) grant <= 4'b0010;
                       else if (request[2]) grant <= 4'b0100;
                       else if (request[3]) grant <= 4'b1000;
                2'b01: if (request[1]) grant <= 4'b0010;  // Grant to Requester 1
                       else if (request[2]) grant <= 4'b0100;
                       else if (request[3]) grant <= 4'b1000;
                       else if (request[0]) grant <= 4'b0001;
                2'b10: if (request[2]) grant <= 4'b0100;  // Grant to Requester 2
                       else if (request[3]) grant <= 4'b1000;
                       else if (request[0]) grant <= 4'b0001;
                       else if (request[1]) grant <= 4'b0010;
                2'b11: if (request[3]) grant <= 4'b1000;  // Grant to Requester 3
                       else if (request[0]) grant <= 4'b0001;
                       else if (request[1]) grant <= 4'b0010;
                       else if (request[2]) grant <= 4'b0100;
            endcase

            // Update priority pointer to the next requester
            if (|grant) priority <= priority + 1;
        end
    end

endmodule