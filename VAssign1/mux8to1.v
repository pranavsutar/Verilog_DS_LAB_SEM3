//CS20B029
module mux8to1 #(parameter  N=9) (a,b,i2,i1,i3,y);
input i1,i2,i3;  // These are select lines
input [N-1:0] a,b;  // These are input variables
output [N-1:0]y;

wire [N-1:0] y1,y2,y3,y4,y5,y6,y7,y8 ;
wire ic1,ic2,ic3;

assign ic1 = ~i1;
assign ic2 = ~i2;
assign ic3 = ~i3;

assign y1 = (ic1 &( ic2 & ic3))? a & b : 0;
assign y2 = (ic1 &( ic2 & i3))? a | b : 0;
assign y3 = (ic1 & (i2 & ic3))? ~(a & b) : 0;
assign y4 = (ic1 & (i2 & i3))? ~(a|b) : 0;
assign y5 = ((i1 & ic2) & ic3)? a^b : 0;
assign y6 = ((i1 & ic2 )& i3)? ~(a^b): 0;
assign y7 = (i1 & i2 & ic3)? {a[N-2:0] , 1'b0} : 0; // Left Shift
assign y8 = (i1 & (i2 & i3))? {1'b0 ,a[N-1:1]} : 0; // Right Shift

assign y = (y1 + y2) + (y3 + y4) + (y5 + y6 )+( y7 +y8);

endmodule
