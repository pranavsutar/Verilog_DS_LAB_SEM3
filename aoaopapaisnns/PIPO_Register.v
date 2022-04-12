// EE20B007 Benstin Davis D
// Parallel input Parallel output Register


module PIPO_Register #(
    parameter N = 32
) (
    input [N-1:0] D,
    input clk,
    input preset,
    input clear,
    output [N-1:0] Q
);


generate
    genvar i;
    for(i = 0 ; i < N ; i = i + 1) begin: Gen_Reg
        D_FlipFlop_PC DFF_ (.clk(clk),.preset(preset),.clear(clear),.D(D[i]),.Q(Q[i])); 
    end
endgenerate

endmodule