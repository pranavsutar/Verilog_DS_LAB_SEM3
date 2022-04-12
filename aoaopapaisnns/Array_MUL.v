// Benstin Davis EE20B007
// Multiplier Signed and Unsigned
// Baugh-Wooley Multiplier
// ============================



module Array_MUL #(
    parameter N = 8,
    parameter M = 8
) (
    input [N-1:0]num1,
    input [M-1:0]num2,
    input k, // Signed or Unsigned
    output [N+M-1:0]out
);

// Step Involved
// Generate Partial Products
// Baugh-Wooley Logic 
// Shift Partial Products
// Add Partial Products

wire [N+M-1:0]partial_products[M-1:0]; // Partial Product with Shifting
wire [N+M-1:0]partial_products_temp1[M-1:0]; // For extending the numbers to N+M bits
wire [N-1:0]partial_products_temp0[M-1:0]; // Partial Product without Shifting
wire [N+M-1:0]sum[M-1:0]; // Sum of every Partial Product with its previous 
wire [N+M-1:0]partial_product_temp; // For BW Logic 



// Baugh-Wooley Logic : Making Nth bit in first row as k
assign partial_products_temp0[0] = num2[0] ? {k^num1[N-1],num1[N-2:0]}:{k,{(N-1){1'b0}}};
assign partial_products[0] = {{(M-1){1'b0}},k,partial_products_temp0[0]}; 



generate
    genvar i;
    for (i = 1;i < M-1;i=i+1 ) begin: Gen_partial_products
        // Baugh-Wooley Logic : Making MSB to its compliment
        assign partial_products_temp0[i] = num2[i] ? {k^num1[N-1],num1[N-2:0]}:{k,{(N-1){1'b0}}};
        assign partial_products_temp1[i] = {{(M){1'b0}},partial_products_temp0[i]}; 
        assign partial_products[i] = partial_products_temp1[i]<<i;

    end
endgenerate



// Baugh-Wooley Logic : Making Nth bit in last row as k
assign partial_products_temp0[M-1] = num2[M-1] ? {num1[N-1],k ? ~num1[N-2:0] : num1[N-2:0]}:{1'b0,{(N-1){k}}};
assign partial_products_temp1[M-1] = {{(M){1'b0}},partial_products_temp0[M-1]}; 
assign partial_product_temp = partial_products_temp1[M-1]<<M-1;
assign partial_products[M-1] = {k,partial_product_temp[N+M-2:0]};





// Adding the Partial Products
assign sum[0] = partial_products[0];
generate
    genvar j;
    for (j = 1;j<M ;j = j+1 ) begin: Add_partial_products
        assign sum[j] = partial_products[j] + sum[j-1];
    end
endgenerate


assign out = sum[M-1];
endmodule


