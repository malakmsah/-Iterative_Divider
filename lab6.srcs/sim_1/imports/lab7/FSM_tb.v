`timescale 1ns / 1ps


module FSM_tb();
reg clock;
reg resetn;
reg cout;
reg E;
reg zC;
wire LAB;
wire EA;
wire EC;
wire sclrC;
wire sclrR;
wire ER;
wire LR;
wire done;
wire [1:0]ps;

FSM mm( .clk(clock), .resetn(resetn), .cout(cout), .E(E), .zC(zC), .LAB(LAB), .EA(EA), .EC(EC), .sclrC(sclrC), .sclrR(sclrR), .LR(LR), .ER(ER), .done(done), .present_state(ps));

initial begin
clock=1'b0;
resetn=1'b0;
cout=1'b1;
E= 1'b0;
zC=1'b0;


#40
resetn=1'b1;
E=1'b1;
cout=1'b0;

#40
cout=1'b1;
zC=1'b1;


#40
cout=1'b0;
zC=1'b1;


#40
cout=1'b1;
zC=1'b0;


#40
E=1'b0;


#40 
E=1'b1;

#40
zC= 1'b1;

end


 always begin 
 clock = #5 ~clock;
 end

endmodule
