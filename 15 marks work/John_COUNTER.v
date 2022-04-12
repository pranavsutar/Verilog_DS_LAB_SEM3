module John_COUNTER #(parameter N=4) (clock, reset, Q) ;
input clock, reset;
reg [N-1:0] t;
output [N-1:0] Q;

always@(posedge clock or reset)
begin
if(reset == 1)
t = 4'b1000;
else
begin
t<={t[0],t[N-1:1]};
  
end
end
assign Q = ~t;
endmodule
