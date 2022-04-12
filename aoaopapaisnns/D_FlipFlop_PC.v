// EE20B007 Benstin Davis D
// D Flop code with Preset and clear

module D_FlipFlop_PC(
    input clk, 
    input preset,
    input clear,
    input D,
    output reg Q

);

always@(negedge clk) 
begin
    if (clear == 0)
        Q <= 1'b0;
    else if(preset == 0)
        Q <= 1'b1;
    else
        Q <= D;
end

endmodule