module TB_mux8to1();
parameter M=9;
reg [M-1:0] A,B;
reg s0,s1,s2;

wire [M-1:0]Y;

mux8to1 #(.N(M)) Main ( .a(A), .b(B),
			.i1(s2), .i2(s1), .i3(s0),
			.y(Y) );

initial
begin
A=5'b1111; B = 5'b110;
     s2 = 0; s1 =0 ; s0 = 0; //000

#10  s2 =0 ; s1 =0 ; s0 =1 ; //001
#10  s2 = 0; s1 = 1; s0 =0 ; //010
#10  s2 =0 ; s1 = 1; s0 =1 ; //011
#10  s2 =1 ; s1 = 0; s0 =0 ; //100
#10  s2 =1 ; s1 = 0; s0 =1 ; //101
#10  s2 =1 ; s1 = 1; s0 =0 ; //110
#10  s2 =1 ; s1 = 1; s0 =1 ; //111


end
endmodule