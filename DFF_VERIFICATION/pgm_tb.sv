program pgm_tb (p_clk, p_rst, p_d, p_q) ;
  input p_clk;
  output p_rst;
  output [3:0] p_d;
  input [3:0] p_q;
  
  
	reg [3:0] C1;
	reg [3:0] expv;
	int matched, mismatched;
	
	reg p_rst;
	reg [3:0] p_d;
  
  initial begin 
	p_rst = 0;
    
    // Apply reset
    #1;
    p_rst = 1;
	exp.push_front(0);
    #1;
    p_rst = 0;
	end

reg unsigned [3:0] exp[$], dur[$];
	
	initial begin
	// Store the initial value of D
	C1 = $urandom();
	p_d <= C1;
	end
	

  initial begin

	repeat(10) 
	begin
		@(posedge p_clk);
		p_d <= $urandom();
		C1=p_d;
		exp.push_front(C1);
		// Check if C1 matches p_q after reset

	end
	result();
	$finish;
  end
  
  
  initial begin
	forever @(p_q) begin
		#1;
		dur.push_front(p_q);
		expv = exp.pop_back();
		if(expv == p_q) begin
		matched++;
		$display(" Matched exp = %d  actual = %d  at time t=%0t", expv, p_q, $time);
		end
		else begin
		mismatched++;
		$display("Mismatched exp = %d  actual = %d  at time t=%0t", expv, p_q, $time);
		end
		/*if(mismatched==5)
		$display("mismatch exceeded");*/
		end
	end

task result();
	$display("%p", exp);
	$display("%p", dur);
endtask

endprogram




