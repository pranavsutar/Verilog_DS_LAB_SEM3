module TB_signed_multiplier( );

parameter M=8,N=8;

reg [N-1:0]A;
reg [M-1:0]B;
reg sg;
wire [N+M-1:0]Y;



//---- Instantiation of main test module----
//Array_MUL_USign #(64,64) UUT(A,B,Y); //M=4,N=6
signed_multiplier #(.n(N),.m(M)) UUT(.a(A),.b(B),.k(sg),.y(Y));


// initializing the inputs to the test module
initial
repeat(50)
begin
#10 A = $random; B = $random; sg =$random;
#100//give required simulation time to complete the operation one by one.
#100
#10
//-----VERIFICATION OF THE OBTAINED RESULT WITH EXISTING RESULT------
if(sg == 1'b1)
begin
	$display(" A=%d,B=%d,sg=%d,Y=%d",$signed(A),$signed(B),sg,$signed(Y));

	if( $signed(A)*$signed(B) != $signed(Y)) // logic verification.
		$display(" *ERROR* ");

end
else 
begin
	$display(" A=%d,B=%d,sg=%d,Y=%d",A,B,sg,Y);

	if( A*B != Y) // logic verification.
		$display(" *ERROR* ");
end

end



endmodule