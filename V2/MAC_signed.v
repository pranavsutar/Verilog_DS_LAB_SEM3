module MAC_signed #(parameter N=32, M=32) (A,B,C,D) ;
input [N-1:0]A;
input [M-1:0]B;
input [N+M-1:0]D;
output [N+M:0]C;

wire [N+M-1:0]Yl;
//wire [N+M-1:0] Y2;
//wire [N+M: 0]  Y3;

//assign Y2[N-1:0] = C;
//assign Y2[N+M-1 :N] = {M{C[N-1]}};
//signed_multiplier #(.n(N) , .m(M) ) SM1 (.a(A) , .b(B), .k(1'bl), .y(Y1) ) ;
signed_multiplier #(.n(N), .m(M) ) DUT2 (.a(A), .b(B), .k(1'b1), .y(Y1) );
//Nbit_add_sub NAS # (.N (N+M) )  DUT2 (.A(Y1) , .B(D), .k(l'b0), .Y(Y3) );
Nbit_add_sub #(.N(N+M))  UUT (.A(Y1) , .B(D) , .k(1'b0), .S(C) );

endmodule
