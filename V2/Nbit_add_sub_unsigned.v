module Nbit_add_sub_unsigned #(parameter N=4)(A,B, k, S);
//parameter N = 4;
input [N-1:0]A,B; // inputs are N-bits
input k; // sign bit 
output [N:0]S; // output is N+1-bits 

wire [N+1:0]C; // N+1 bits 

wire [N:0] A1, B1;
wire [N:0]xB;


assign A1 = {1'b0,A}; // same size as output 
assign B1 = {1'b0,B};

assign xB = k?~B1:B1; // k XOR B1


assign C[0] = k;

genvar i; 

generate 

for (i = 0; i < N+1; i= i+1) begin : FA

full_adder FA_
(.a(A1[i]), .b(xB[i]), .c(C[i]), .sum(S[i]), .carry(C[i+1]));
 // {Cout, Sum} = a + b + cin
end

endgenerate




endmodule