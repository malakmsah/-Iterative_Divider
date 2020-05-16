module divider(
input wire clock ,
input wire resetn ,

input wire E ,

input wire [5:0] DataA ,
input wire [3:0] DataB ,

output wire done ,
output wire [5:0] Q,
output wire [3:0] R,
output wire [6:0] SEG
    );

 wire [5:0] A;    
 wire [3:0] B; 
  
 wire  s_L, sclrC, sclrR, LR, ER;
 wire LAB;
 reg [4:0] Y;

 wire zC;
 wire cout;
 wire EA;
 wire EC;
 wire [4:0]yy; 
 wire [4:0] T;
 wire [2:0] fly;
 wire [1:0] ps;
   

REGISTER RB(.clk(clock), .resetn(resetn), .E(LAB), .DataB(DataB), .B(B));
   
LSR1 RA(.clk(clock), .resetn(resetn), .E(EA), .s_L(LAB), .w(cout), .DataA(DataA), .A(A));

counter0to5 Cntr(.clk(clock), .resetn(resetn), .E(EC), .sclr(sclrC), .Q(fly), .zC(zC)); 

adder_sub AdrSub(.B(B), .Y({R,A[5]}), .T(T), .cout(cout));

LSR2 RR(.clk(clock), .resetn(resetn), .E(ER), .s_L(LR), .sclr(sclrR), .w(A[5]), .T(T), .R(R) );

FSM SM(.clk(clock), .resetn(resetn), .cout(cout), .E(E), .zC(zC), .LAB(LAB), .EA(EA), .EC(EC), .sclrC(sclrC), .sclrR(sclrR), .LR(LR) , .ER(ER), .done(done), .present_state(ps));

hex7seg S7(.R(R), .a_to_g(SEG));

assign Q = A;
    
endmodule
