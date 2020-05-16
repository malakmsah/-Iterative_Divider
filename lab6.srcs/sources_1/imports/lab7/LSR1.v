// LSR for A
module LSR1(
input wire clk ,
input wire resetn ,
input wire E ,
input wire s_L ,
input wire w,
input wire [5:0] DataA ,
output reg [5:0] A 
);

always @(posedge clk or posedge resetn)
begin
	if(resetn == 0) 
		A <= 0;
	else if(s_L == 1) // LAB ( load A & load B )| w=cout, when w=1 means that n1<d  so shift left will be enabled
	   A <= DataA;
	else if ( E == 1)
	   A <= {A[4:0], w}; // A or DataA 
end		      
endmodule
