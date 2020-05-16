//`timescale 1ns / 1ps

//module Register_tb();
//reg clock;
//reg resetn;
//reg E;
//reg [3:0] DataB;
//wire [3:0] B;

//REGISTER r(.clk(clock), . resetn(resetn), .E(E), .DataB(DataB), .B(B) );

//initial begin 
//clock= 1'b0;
//resetn= 1'b0;
//E= 1'b0;

//#10 
//resetn=1'b1;

//#10
//E= 1'b1;
//DataB =4'b1001;


//#10
//DataB= 4'b0010;

//end

// always begin 
// clock = #5 ~clock;
// end
//endmodule
