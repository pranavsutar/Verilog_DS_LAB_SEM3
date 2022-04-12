//-------Self checking TESTBENCH ----ARRAY SIGNED MULTIPLIER-----

module Array_MUL_USign_TB( );


parameter M=8,N=8;

reg [N-1:0]A;
reg [M-1:0]B;
wire [N+M-1:0]Y;



//---- Instantiation of main test module----
Array_MUL_USign #(.N(N),.M(M)) UUT(.A(A),.B(B),.Y(Y));


// initializing the inputs to the test module
initial
begin
repeat(50)
begin
#10 A = $random; B = $random;
#100//give required simulation time to complete the operation one by one.
#100
#10
//-----VERIFICATION OF THE OBTAINED RESULT WITH EXISTING RESULT------

	$display("A=%d,B=%d,Y=%d",A,B,Y);

	if( A*B != Y) // logic verification.
		$display(" *ERROR* ");

end

#100
$display(" Worst Case ");

A = {(N){1'b1}}; B = {(M){1'b1}}; 

#10 $display("A=%d,B=%d,Y=%d",A,B,Y);

#100
A = {(N){1'b1}}; B = {(M){1'b0}}; 

#10 $display("A=%d,B=%d,Y=%d",A,B,Y);
#100
A = {(N){1'b0}}; B = {(M){1'b0}}; 

#10 $display("A=%d,B=%d,Y=%d",A,B,Y);
#100
A = {(N){1'b0}}; B = {(M){1'b1}}; 

#10 $display("A=%d,B=%d,Y=%d",A,B,Y);

end

endmodule