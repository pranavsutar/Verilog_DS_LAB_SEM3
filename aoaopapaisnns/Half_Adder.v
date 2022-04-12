// Benstin Davis EE20B007
// Half Adder
// ============================


module Half_Adder(a, b, sum, cout);

input a, b; 
output sum, cout; 

assign sum = a ^ b; 
assign cout = a & b; 

endmodule