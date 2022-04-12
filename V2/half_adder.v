module half_adder(a,b,sum,carry);
input a,b;
output sum,carry;
assign sum = a^b;
assign carry = (a==1)?b:0;
endmodule