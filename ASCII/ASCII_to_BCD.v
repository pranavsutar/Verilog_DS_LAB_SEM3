module ASCII_to_BCD #(parameter N=32, M=16) (ASCII, BCD, valid);

input [N-1:0] ASCII;
output [M-1:0] BCD;

output valid;

wire [3:0] check;

wire [3:0] a, b, c, d;

assign a = ASCII[3:0];

assign b = ASCII[11:8];

assign c = ASCII[19:16];

assign d = ASCII[27:24];

assign BCD = {d [3:0], c [3:0], b [3:0], a[3:0] };

assign check[0] = (!ASCII[7] ) & (!ASCII[6] ) & ASCII[5]  & ASCII[4];

assign check[1] = (!ASCII[15]) & (!ASCII[14]) & ASCII[13] & ASCII[12];

assign check[2] = (!ASCII[23]) & (!ASCII[22]) & ASCII[21] & ASCII[20];

assign check[3] = (!ASCII[31]) & (!ASCII[30]) & ASCII[29] & ASCII[20];

assign valid = check[3] & check[2] & check[1] & check[0];

endmodule