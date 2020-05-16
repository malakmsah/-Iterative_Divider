`timescale 1ns / 1ps

module counter_tb();

reg clock;
reg resetn;
reg E;
reg sclr;
wire [2:0]Q;
wire zC;

counter0to5 CC(.clk(clock), .resetn(resetn), .E(E), .sclr(sclr), .Q(Q), .zC(zC));

initial begin
clock= 1'b0;
resetn=1'b0;
E=1'b0;
sclr= 1'b0;

#20
resetn=1'b1;
E=1'b1;

end

 always begin 
 clock = #5 ~clock;
 end

endmodule
