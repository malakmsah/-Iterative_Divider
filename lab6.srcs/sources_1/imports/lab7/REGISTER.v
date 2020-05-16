// For B ( the divisor )
module REGISTER(
    input wire clk ,
    input wire resetn ,
    input wire E ,
    input wire [3:0] DataB ,
    output reg [3:0] B 
);

//	4-bit register with Enable
always @(posedge clk or posedge resetn)
	if(resetn == 0)
		B <= 0;
	else if(E == 1)
		B <= DataB;

endmodule
