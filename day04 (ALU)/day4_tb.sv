module day4_tb();
       logic [7:0]   a_i;
       logic [7:0]   b_i;
       logic [2:0]   op_i;

      logic [7:0]   alu_o;
	  
day4 DUT(.*);
	  
initial
begin

for(int i=0; i<8; i++) begin
op_i=i;
a_i=4; b_i=7;
#1;
$display("a=%d,  b=%d,  op_i=%d,        alu_o=%d", a_i,b_i,op_i,alu_o);
#5;
end

end

endmodule