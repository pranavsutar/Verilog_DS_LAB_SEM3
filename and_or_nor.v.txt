
module and_or_nor #(parameter N=32)(A,B,AND,OR,NOR);
//parameter N = 4;
input [31:0]A,B; // inputs are N-bits 
output [31:0]AND,OR,NOR; // output is N+1-bits 




genvar i; 

generate 

for (i = 0; i < 32; i= i+1) begin 

and(AND[i], A[i],B[i]);
or(OR[i], A[i],B[i]);
nor(AND[i], A[i],B[i]);


end

endgenerate

endmodule