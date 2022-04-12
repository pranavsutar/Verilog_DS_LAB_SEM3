module TB_full_adder();
reg A,B,C;
wire SUM, CARRY;

full_adder FA( .a(A) , .b(B), .c(C) , .sum(SUM), .carry(CARRY) );

initial
begin
A = 1'b0 ; B = 1'b0 ; C = 1'b0 ;

#10  A = 1'b1 ; B = 1'b0 ; C = 1'b0 ;

#10  A = 1'b1 ; B = 1'b0 ; C = 1'b1 ;

#10  A = 1'b0 ; B = 1'b1 ; C = 1'b1 ;

#10  A = 1'b1 ; B = 1'b1 ; C = 1'b1 ;

end
endmodule