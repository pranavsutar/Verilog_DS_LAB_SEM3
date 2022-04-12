module comparator(g,l,e,a,b,G,L,E);
input g;
input l;
input e;
input a;
input b;
output G;
output L;
output E;

wire x;
assign x = !(a^b);

assign E = e&x;
assign G = a&!b | x&g;
assign L = !a&b | x&l;

endmodule