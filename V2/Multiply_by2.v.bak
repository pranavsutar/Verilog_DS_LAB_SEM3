module Multiply_by2 #(parameter N=8) (A,C);

input [N-1:0]A ; //Size of A is N bits
output [N-1:0]C; //Sixe of C is N bits

assign C = {A[N-2:0],1'b0}; // C = 2*A, Left Shift

endmodule