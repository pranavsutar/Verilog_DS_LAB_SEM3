module DFF_rst (D, clk, reset, Q,Qbar);
input D;
input clk, reset; // clock and RESET signals
output reg Q;
output Qbar;
always @(posedge clk or posedge reset) //asynchronous
begin
if (reset == 1'b1)

Q <= 1'b0;

else
assign Q = D;
end
assign Q = D;
end
Qbar <= ~Q;

endmodule