program pgm_tb (dff_intf vif) ;
  
  
	reg [3:0] C1;
	reg [3:0] expv;
	int matched, mismatched;

  
  initial begin 
	vif.top_rst = 0;
    
    // Apply reset
    #1;
    vif.top_rst = 1;
	exp.push_front(0);
    #1;
    vif.top_rst = 0;
	end

reg unsigned [3:0] exp[$], dur[$];
	
	initial begin
	// Store the initial value of D
	C1 = $urandom();
	vif.top_d <= C1;
	end
	

  initial begin

	repeat(10) 
	begin
		@(posedge vif.clk);
		vif.top_d <= $urandom();
		C1=vif.top_d;
		exp.push_front(C1);
		// Check if C1 matches top_q after reset

	end
	result();
	$finish;
  end
  
  
  initial begin
	forever @(vif.top_q) begin
		#1;
		dur.push_front(vif.top_q);
		expv = exp.pop_back();
		if(expv == vif.top_q) begin
		matched++;
		$display(" Matched exp = %d  actual = %d  at time t=%0t", expv, vif.top_q, $time);
		end
		else begin
		mismatched++;
		$display("Mismatched exp = %d  actual = %d  at time t=%0t", expv, vif.top_q, $time);
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




