
module tb_DFF_rst();
reg D;
reg clk;
reg Reset;
wire Q. Qbar;
DFF_rst uut ( .D(D), .clk(clk), .rst(Reset), .Q(Q), .Qbar(Qbar) );
initial begin
// Initialize Inputs
D = 1'b0;
clk = 1'b0;
Reset = 1'b1;
// Wait 100 ns for global reset to finish
#100;
// Add stimulus here
Reset = 1'b0;
#20;
forever #50 D = ~ D;
end
// Generating clock with 20 ns time period
always #10 clk = ~clk;

endmodule