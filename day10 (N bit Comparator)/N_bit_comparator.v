module N_bit_comparator(a,b,L,G,E);
    parameter N=8;
    input [N-1:0]a,b;
    output L,G,E;
    reg L=0,G=0,E=0;
    always@(*) begin
        if(a<b)
            begin
                L=1'b1;
                E=1'b0;
                G=1'b0;
            end
        else if (a>b)
            begin
                L=1'b0;
                E=1'b0;    
                G=1'b1;
            end
        else
            begin
                L=1'b0;
                E=1'b1;
                G=1'b0;
            end
    end
endmodule