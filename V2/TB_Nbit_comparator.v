module TB_Nbit_comparator();

parameter n =4;
reg [n-1:0]A;
reg [n-1:0]B;
wire L;
wire G;
wire E;

Nbit_comparator #(.n(n)) a (.A(A),.B(B),.G_final(G),.L_final(L),.E_final(E));

initial
begin
A = 4'b1000;
B = 4'b1000;

#10 A = 4'b1000; B = 4'b1001;
#10 A = 4'b0111; B = 4'b1000;
#10 A = 4'b1010; B = 4'b1001;

end

endmodule