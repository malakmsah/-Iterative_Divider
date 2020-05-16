
module adder_sub ( 
input wire [4:0] Y ,
input wire [3:0] B ,
output reg [4:0] T ,
output reg cout 
);

always @(*)
begin

    T = Y - {1'b0,B};
    if (B > Y)
        cout = 1'b1;
    else 
        cout = 1'b0;

end

endmodule
