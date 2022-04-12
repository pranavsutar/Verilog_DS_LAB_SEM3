module top ( input wire [5:0] instr , input wire op , output z);
 reg[1:0] r1 , r2;
wire [3:0] w1 , w2;
 fulladd FA1 (.x(instr [0]) , .y(instr [1]) , .z(instr [2]) ,
 .cout(r1 [1]) , .z1(r1 [0]));

 fulladd FA2 (.x(instr [3]) , .y(instr [4]) , .z(instr [5]) ,
 .z1(r2 [0]) , .cout(r2 [1]));

 assign z = r1 | op;
 assign w1 = r1 + 1;
 assign w2 = r2 << 1;
assign op = r1 ? r2;

endmodule