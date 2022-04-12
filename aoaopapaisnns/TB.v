module TB #(
    parameter N = 4
) (
);


reg [N-1:0] A11 , A12, A13 ,A14;
reg [N-1:0] A21 , A22, A23 ,A24;
reg [N-1:0] A31 , A32, A33 ,A34;
reg [N-1:0] A41 , A42, A43 ,A44;


reg [N-1:0] X1 , X2 , X3 , X4;

reg clk,clear,preset;

wire [2*N-1:0] Y1 , Y2 , Y3 , Y4;


Matrix_MUL #(.N(N)) M0 (
    .A1({A11,A12,A13,A14}),
    .A2({A21,A22,A23,A24}),
    .A3({A31,A32,A33,A34}),
    .A4({A41,A42,A43,A44}),
    .X1(X1),
    .X2(X2),
    .X3(X3),
    .X4(X4),
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3),
    .Y4(Y4),
    .clear(clear),
    .clk(clk),
    .preset(preset)
);




initial begin

    clk = 0;
    clear = 0;
    preset = 0;

    #10
    clear = 1;
    preset = 1;
 
    A11 = 1;
    A12 = 2;
    A13 = 3;
    A14 = 4;
        
    A21 = 1;
    A22 = 2;
    A23 = 3;
    A24 = 4;
    
    A31 = 1;
    A32 = 2;
    A33 = 3;
    A34 = 4;
        
    A41 = 1;
    A42 = 2;
    A43 = 3;
    A44 = 4;

    X1 = 1;
    X2 = 1;
    X3 = 1;
    X4 = 1;

end

always begin
    #10 clk = ~clk;
end

endmodule