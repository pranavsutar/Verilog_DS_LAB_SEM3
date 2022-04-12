// Benstin Davis EE20B007
// Full Adder
// ============================


module Full_Adder(a, b, cin, sum, cout);

input a, b, cin; 
output sum, cout; 

wire S0, C1, C2;
Half_Adder HA1 (.a(a), .b(b), .sum(S0), .cout(C1));

Half_Adder HA2 (.a(cin), .b(S0), .sum(sum), .cout(C2));

assign cout = C1 | C2; 

endmodule