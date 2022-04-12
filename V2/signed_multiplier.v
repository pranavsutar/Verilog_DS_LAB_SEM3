
/*
module signed_multiplier # (parameter N=4) (a, b, c) ;
input [N-1:0] a,b;
output [2*N-1:0]c;
wire [N-1:0] temp [0:N-1];

wire [N-1:0] temporary;
genvar i,j;
generate
for (1=0;1<N;i=i+1)
begin
assign temp[i] = b[i] ?(!a[N-1], a[N-2:0]):[1'b1, ((N-1) (1'bo}}]:
end
endgenerate
wire [N-1:0]S[0:N-1];
assign {S[0], c[0]} = {1'bl, temp [0] };

generate
for (j=0;j<N-2;j = j+1)
begin
assign (S[j+1], c[j+1]} = temp[j+1]+ S[j] :
end
endgenerate
assign temporary[N-1:0] = temp [N-1];

wire temp3;
assign {temp3, S[N-1], c[N-1]} ={1'b0, S[N-2]}+{1'bl, !temporary [N-1], ~temporary [N-2:0]}:
assign c[2*N-1:N] = S[N-1];

endmodule */

module signed_multiplier #(parameter n,m)(a,b,k,y);

input[n-1:0]a;
input[m-1:0]b;
input k;
output [n+m+1:0]y;
wire[n-1:0] p[0:m-1];
wire[n-1:0] s[0:m-1];

generate
genvar i;

for(i=0;i<m-1;i=i+1)
begin: gen_partial_products
assign p[i]=b[i]?{k^a[n-1],a[n-2:0]}:{k,{(n-1){1'b0}}};
end
endgenerate

assign p[m-1]=b[m-1]?{a[n-1],k?~(a[n-2:0]):a[n-2]}:{1'b0,{(n-1){k}}};

assign {s[0],y[0]}={k,p[0]};

generate
genvar j;

for(j=0;j<m-1;j=j+1)
begin: add_partials
assign {s[j+1],y[j+1]}=p[j+1]+s[j];
end
endgenerate

wire[n-1:0]q;
assign q=s[m-1];
wire t;
assign t=k^q[n-1];

assign y[n+m-1:m]={t,q[n-2:0]};

endmodule