
//Written by Pranav, CS20B029

module BCD_to_ASCII# (parameter N=32,M=16) (ASCII, BCD) ;
input  [M-1:0] BCD;
output [N-1:0]ASCII;

wire [3:0]T;

assign T= 4'b0011;
assign ASCII={T, BCD[15:12] ,T, BCD[11:8],T, BCD[7:4],T, BCD[3:0]};
endmodule
