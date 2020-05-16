`timescale 1ns / 1ps
module divider_tb();

reg clock;
reg resetn;

reg E;

reg [5:0] DataA;
reg [3:0] DataB;

wire done;
wire [5:0]Q;
wire [6:0] SEG;

wire [3:0]R;

divider RR_tb (
    .clock(clock),
    .resetn(resetn),
    .E(E), 
    .DataA(DataA),
    .DataB(DataB),
    .R(R),
    .done(done), 
    .Q(Q),
    .SEG(SEG)
);
     
initial begin 

clock = 1'b0;
resetn = 1'b0;
E = 1'b0;
DataA= 6'b000000 ;
DataB= 4'b0000;


resetn = 1'b1;

#60
E= 1'b1;
DataA= 6'b000100 ;
DataB= 4'b0010;


//#10
//E= 1'b0;


#60
E= 1'b1;
DataA= 6'b010100 ;
DataB= 4'b0111;

#10
E= 1'b0;
//#60

//DataA= 6'b101010;
//DataB= 4'b1111;

//#60

//DataA= 6'b100101;
//DataB= 4'b0101;

//#60

//DataA= 6'b001101;
//DataB= 4'b1100;

//#60

//DataA= 6'b001101;
//DataB= 4'b1100;

$finish;
 end
 
 always begin 
    clock = #5 ~clock;
 end

endmodule
