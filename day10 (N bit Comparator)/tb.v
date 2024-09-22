module tb;
	reg [7:0]a;
	reg [7:0]b;
	wire L,G,E;

	N_bit_comparator dut(a,b,L,G,E);
		
		always begin
			a=42;
			b=88;
			#10;
			a=101;
			b=232;
			#10;
			a=58;
			b=144;
			#10;
			a=75;
			b=165;
			#10;
			a=200;
			b=250;
			#10;
			a=133;
			b=201;
			#10;
			a=54;
			b=178;
			#10;
			a=23;
			b=98;
			#10;
			a=150;
			b=128;
			#10;
			a=199;
			b=189;
			#10;
		end
		initial
        begin $monitor("a= %0d  b= %0d  then L= %0d  G= %0d  E= %0d ",a, b,L,G,E );
        #100 $finish;
    end
endmodule