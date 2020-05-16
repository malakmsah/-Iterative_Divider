`timescale 1ns / 1ps
module LSR1_tb();

reg clock;
reg resetn;
reg E;
reg s_L;
reg w;
reg [5:0] DataA;
wire [5:0] A;

LSR1 LL(.clk(clock), .resetn(resetn), .E(E), .s_L(s_L), .w(w), .DataA(DataA), .A(A));

initial begin
clock=1'b0;
resetn=1'b0;
E=1'b0;
s_L=1'b0;
w=1'b0;

#10
resetn=1'b1;
E=1'b1;
s_L=1'b1;
w=1'b0;

DataA= 6'b101101;

#10
s_L=1'b0;
w=1'b0;

#10
E = 0;
w=1'b1;

#10
w=1'b1;
//#10
//DataA= 6'b101101;


//#10
//DataA= 6'b101101;

end

 always begin 
 clock = #5 ~clock;
 end

endmodule
