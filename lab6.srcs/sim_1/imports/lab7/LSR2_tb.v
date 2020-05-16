`timescale 1ns / 1ps
module LSR2_tb();

reg clock;
reg resetn;
reg E;
reg s_L;
reg sclr;
reg w;
reg [4:0] T;
wire [3:0] R;

LSR2 LS(.clk(clock), .resetn(resetn), .E(E), .s_L(s_L), .sclr(sclr), .w(w), .T(T), .R(R));

initial begin
clock=1'b0;
resetn=1'b0;
E=1'b0;
s_L=1'b0;
sclr=1'b0;
w=1'b0;

#20
resetn=1'b1;
E=1'b1;
s_L=1'b1;

T= 5'b01101;
w=1'b0;


#20
T=5'b11000;
w=1'b1;

#10
w=1'b0;


#20
T= 5'b11101;
s_L=1'b1;

#20
s_L=1'b0;

#20
T= 5'b11111;

end

 always begin 
 clock = #5 ~clock;
 end

endmodule
