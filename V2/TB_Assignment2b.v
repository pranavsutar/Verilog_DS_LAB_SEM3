module TB_Assignment2b();
parameter N = 32;

reg [N-1:0]A, B;
reg [2*N-1:0] D;
reg [2:0]S;
wire [2*N:0]C  ;

Assignment2b #(.N(N)) MUX (.a(A) , .b(B) , .c(C) , .d(D) , .s(S) ) ;
  
initial
begin
A = 3; B = 8; D = 20;
S = 0;
#10 S =  1;
#10 S =  2;
#10 S =  3;
#10 S =  4;
#10 S =  5;
#10 S =  6;
#10 S =  7;
#10
A = 31; B = 63; D = 100;
S = 0;
#10 S =  1;
#10 S =  2;
#10 S =  3;
#10 S =  4;
#10 S =  5;
#10 S =  6;
#10 S =  7;


end
endmodule