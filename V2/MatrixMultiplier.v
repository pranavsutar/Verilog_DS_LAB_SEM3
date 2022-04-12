module MatrixMultiplier #(parameter N = 16) (a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,x1,x2,x3,x4,y1,y2,y3,y4);
input [N-1:0] a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,x1,x2,x3,x4;
output [2*N +2:0] y1,y2,y3,y4;
assign y1=0;
assign y2=0;
assign y3=0;
assign y4=0;


MAC_signed #(.N(N), .M(N)) MAC1 (.A(a1 ) , .B(x1 ) ,.C(y1 ) ,.D(y1 ) )  ;
MAC_signed #(.N(N), .M(N)) MAC2 (.A(a2 ) , .B(x2 ) ,.C(y1 ) ,.D(y1 ) )  ;
MAC_signed #(.N(N), .M(N)) MAC3 (.A(a3 ) , .B(x3 ) ,.C(y1 ) ,.D(y1 ) )  ;
MAC_signed #(.N(N), .M(N)) MAC4 (.A(a4 ) , .B(x4 ) ,.C(y1 ) ,.D(y1 ) )  ;

MAC_signed #(.N(N), .M(N)) MAC12 (.A(a5 ) , .B(x1 ) ,.C(y2 ) ,.D(y2 ) )  ;
MAC_signed #(.N(N), .M(N)) MAC22 (.A(a6 ) , .B(x2 ) ,.C(y2 ) ,.D(y2 ) )  ;
MAC_signed #(.N(N), .M(N)) MAC32 (.A(a7 ) , .B(x3 ) ,.C(y3 ) ,.D(y2 ) )  ;
MAC_signed #(.N(N), .M(N)) MAC42 (.A(a8 ) , .B(x4 ) ,.C(y4 ) ,.D(y2 ) )  ;

MAC_signed #(.N(N), .M(N)) MAC13 (.A(a9 ) , .B(x1 ) ,.C(y3 ) ,.D(y3 ) )  ;
MAC_signed #(.N(N), .M(N)) MAC23 (.A(a10 ) , .B(x2 ) ,.C(y3 ) ,.D(y3 ) )  ;
MAC_signed #(.N(N), .M(N)) MAC33 (.A(a11 ) , .B(x3 ) ,.C(y3 ) ,.D(y3 ) )  ;
MAC_signed #(.N(N), .M(N)) MAC43 (.A(a12 ) , .B(x4 ) ,.C(y3 ) ,.D(y3 ) )  ;

MAC_signed #(.N(N), .M(N)) MAC14 (.A(a13 ) , .B(x1 ) ,.C(y4 ) ,.D(y4 ) )  ;
MAC_signed #(.N(N), .M(N)) MAC24 (.A(a14 ) , .B(x2 ) ,.C(y4 ) ,.D(y4 ) )  ;
MAC_signed #(.N(N), .M(N)) MAC34 (.A(a15 ) , .B(x3 ) ,.C(y4 ) ,.D(y4 ) )  ;
MAC_signed #(.N(N), .M(N)) MAC44 (.A(a16 ) , .B(x4 ) ,.C(y4 ) ,.D(y4 ) )  ;

endmodule