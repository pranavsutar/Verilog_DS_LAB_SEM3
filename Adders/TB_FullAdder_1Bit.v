module TB_FullAdder_1Bit();

reg A,B,CIN;
wire Sum,Carry;

FullAdder_1Bit DUT (.a(A), .b(B), .cin(CIN),
			.sum(Sum), .carry(Carry));
initial
begin
A=0; B=0; CIN =0;
#10 A=0 ; B=0 ; CIN=1 ;
#10 A=0 ; B=1 ; CIN=0 ;
#10 A=0 ; B=1 ; CIN=1 ;
#10 A=1 ; B=0 ; CIN=0 ;
#10 A=1 ; B=0 ; CIN=1 ;
#10 A=1 ; B=1 ; CIN=0 ;
#10 A=1 ; B=1 ; CIN=1 ;
end
endmodule
