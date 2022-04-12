// Benstin Davis EE20B007
// Adder + Subtractor 
// ============================




module Add_Sub_Nbit #(parameter N=4)(A,B, k, S);
input [N-1:0]A,B; 
input k;  
output [N:0]S;  

wire [N+1:0]C; 

wire [N:0] A1, B1;
wire [N:0]xB;


assign A1 = {A[N-1],A};  
assign B1 = {B[N-1],B};

assign xB = k?~B1:B1; 

assign C[0] = k;

genvar i; 

generate 

for (i = 0; i < N+1; i= i+1) begin : FA  

Full_Adder FA_ (.a(A1[i]), .b(xB[i]), .cin(C[i]), .sum(S[i]), .cout(C[i+1])); 
end

endgenerate




endmodule