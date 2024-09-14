module day8_tb();

  // Write your Testbench here...
   reg[4-1:0]     bin_i;
  wire[16-1:0] one_hot_o;

day8 DUT(.*);
initial
begin
for(int i=0; i<10; i++) begin
bin_i=$random;
#1; $display("binary= %d, one_hot=%b", bin_i, one_hot_o);
end
end
endmodule

