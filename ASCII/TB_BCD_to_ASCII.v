//made by Pranav , CS20B029
module TB_BCD_to_ASCII();
parameter n = 32;
parameter m = 16;
reg [m-1:0]bcd;
wire [n-1:0]ascii;
 
BCD_to_ASCII #( .N(n), .M(m)) DUT( .ASCII(ascii), .BCD(bcd) );

initial
begin
bcd = 16'h3272;
#20 bcd = 16'h7007;
#20 bcd = 16'd50876;
#20 bcd = 16'o43242;
end
endmodule