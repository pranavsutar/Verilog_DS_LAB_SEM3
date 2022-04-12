// Benstin Davis EE20B007
// Accumulator
// ============================



module MAC #(
    parameter N = 32
) (
    input clk,
    input clear,
    input preset,

    input [N-1:0]A,
    input [N-1:0]B,
    //output [N-1:0]C,
    //output [N-1:0]D,
    output [2*N-1:0]out
);

wire [2*N-1:0] ab;
wire [2*N:0] sum;
wire [2*N-1:0] ds;


//PIPO_Register #(.N(N)) RA (.clk(clk),.preset(preset),.clear(clear),.D(A),.Q(C));
//PIPO_Register #(.N(N)) RB (.clk(clk),.preset(preset),.clear(clear),.D(B),.Q(D));


Array_MUL #(.N(N),.M(N)) MUL (.num1(A),.num2(B),.k(1'b1),.out(ab));
Add_Sub_Nbit #(.N(2*N)) ADD (.A(ab),.B(ds),.k(1'b0),.S(sum));

PIPO_Register #(.N(2*N)) RC (.clk(clk),.preset(preset),.clear(clear),.D(sum[2*N-1:0]),.Q(ds));

assign out = ds;

endmodule