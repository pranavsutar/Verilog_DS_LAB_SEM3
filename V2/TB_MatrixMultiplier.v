module TB_MatrixMultiplier();
parameter M = 16;

reg[M-1:0]  A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,X1,X2,X3,X4;
wire[2*M+2:0] Y1,Y2,Y3,Y4 ;

MatrixMultiplier #( .N(M) ) MAT_MUL (
.a1(A1), .a2(A2),.a3(A3),.a4(A4),
.a5(A5),.a6(A6),.a7(A7), .a8(A8),
.a9(A9)  ,.a10(A10),.a11(A11),.a12(A12),
.a13(A13),.a14(A14),.a15(A15),.a16(A16),

.x1(X1),.x2(X2),.x3(X3),.x4(X4),
.y1(Y1),.y2(Y2),.y3(Y3),.y4(Y4) );

initial
begin

A1=1 ; A2=0 ; A3=0 ; A4=0 ;
A5=0 ; A6=1 ; A7=0 ; A8=0 ;
A9=0 ; A10=0 ; A11=1 ; A12=0 ;
A13=0 ; A14=0 ; A15=0 ; A16=1 ;

X1=1 ; X2=2 ; X3=3 ; X4=4 ;


#20
A1=0 ; A2=0 ; A3=0 ; A4=1 ;
A5=0 ; A6=0 ; A7=1 ; A8=0 ;
A9=0 ; A10=1 ; A11=0 ; A12=0 ;
A13=1 ; A14=0 ; A15=0 ; A16=0 ;

X1=1 ; X2=2 ; X3=3 ; X4=4 ;

#20
A1=1 ; A2=0 ; A3=1 ; A4=0 ;
A5=0 ; A6=1 ; A7=0 ; A8=1 ;
A9=1 ; A10=0 ; A11=0 ; A12=1 ;
A13=0 ; A14=1 ; A15=1 ; A16=0 ;

X1=5 ; X2=10 ; X3=20 ; X4= 10 ;
end
endmodule
