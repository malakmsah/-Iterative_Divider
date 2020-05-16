// Reminder
module LSR2(
input wire clk,
input wire resetn,
input wire E,
input wire s_L,
input wire sclr,
input wire w,
input wire [4:0] T,
output reg [3:0] R 
);


always @(posedge clk or posedge resetn)
begin
	if(resetn == 0 | ( E == 1 && sclr == 1 )) //*
		R <= 0;
	else if(s_L == 1) // load T
		R <= T[3:0];
	else if(E == 1) 
		R <= {T[2:0], w}; 
end		     
endmodule