// Benstin Davis EE20B007
// 4x4 X 4x1 Matrix Multiplier 
// ============================



module Matrix_MUL #(
    parameter N = 32
) (
    input [4*N-1:0] A1,A2,A3,A4,  // For each row a 4N bit long number 
    input [N-1:0] X1,X2,X3,X4,
    input clk,
    input clear,
    input preset,
    output [2*N-1:0] Y1,Y2,Y3,Y4
);

reg preset0;
reg clk0;
reg clear0;


assign preset0 = preset;
assign clk0 = clk;
assign clear0 = clear;



reg [N-1:0] A1j,A2j,A3j,A4j;
reg [N-1:0] Xi;




wire [4*N-1:0] X;
assign X = {X1,X2,X3,X4};


MAC #(.N(N)) M0 (.clk(clk0),.preset(preset0),.clear(clear0),.A(A1j),.B(Xi),.out(Y1));
MAC #(.N(N)) M1 (.clk(clk0),.preset(preset0),.clear(clear0),.A(A2j),.B(Xi),.out(Y2));
MAC #(.N(N)) M2 (.clk(clk0),.preset(preset0),.clear(clear0),.A(A3j),.B(Xi),.out(Y3));
MAC #(.N(N)) M3 (.clk(clk0),.preset(preset0),.clear(clear0),.A(A4j),.B(Xi),.out(Y4));


reg [2:0] count;


always @(negedge clear) begin
    count <= 0 ;
    preset0 <= 0;
end


always @ (posedge clk) begin
    case(count)
        3'b000 : begin
            Xi <= X1; 
            A1j <= A1[4*N-1:3*N];
            A2j <= A2[4*N-1:3*N];
            A3j <= A3[4*N-1:3*N];
            A4j <= A4[4*N-1:3*N];
        end

        3'b001 : begin
            Xi <= X2; 
            A1j <= A1[3*N-1:2*N];
            A2j <= A2[3*N-1:2*N];
            A3j <= A3[3*N-1:2*N];
            A4j <= A4[3*N-1:2*N];
        end

        3'b010 : begin
            Xi <= X3; 
            A1j <= A1[2*N-1:N];
            A2j <= A2[2*N-1:N];
            A3j <= A3[2*N-1:N];
            A4j <= A4[2*N-1:N];
        end

        3'b011 : begin
            Xi <= X4; 
            A1j <= A1[N-1:0];
            A2j <= A2[N-1:0];
            A3j <= A3[N-1:0];
            A4j <= A4[N-1:0];        
        end

        3'b100 : begin
            count = count - 1;
            // A1j = 0;
            // A2j = (N){1'b0};
            // A3j = (N){1'b0};
            // A4j = (N){1'b0};
            Xi <= 0;
        end
    endcase
    count = count + 1;
end
endmodule



