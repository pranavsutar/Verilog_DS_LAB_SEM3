//Author: Mathew K J
module nbit_comparator #(parameter n = 16) (A,B,G_final,E_final,L_final);

input [n-1:0]A;
input [n-1:0]B;
output G_final;
output L_final;
output E_final;
wire  [n:0]E;
wire  [n:0]G;
wire  [n:0]L;
assign E[0] = 1;
assign G[0] = 0;
assign L[0] = 0;

generate
genvar i;
for(i=0;i<n;i=i+1)
begin
comparator ci (.g(G[i]),
                    .l(L[i]),
                    .e(E[i]),
                    .a(A[i]),
          	    .b(B[i]),
		    .G(G[i+1]),
		    .L(L[i+1]),.E(E[i+1]));
end
endgenerate

assign G_final = G[n];
assign L_final = L[n];
assign E_final = E[n];

endmodule
