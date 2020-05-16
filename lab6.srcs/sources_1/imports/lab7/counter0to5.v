
module counter0to5(
input wire clk,
input wire resetn,
input wire E,
input wire sclr,
output wire [2:0] Q,
output reg zC
    );
    
reg [2:0] counter_up;

always @(posedge clk or posedge resetn)
    begin
        if (resetn == 0 | ( E == 1 && sclr == 1) ) 
            counter_up <= 0;
            
        else if (counter_up == 3'b101)
                    begin
                        counter_up <= 0; 
                        zC <= 1'b1;
                    end
        else if ( E == 1 )
                    begin 
                        counter_up <= counter_up + 3'b001;
                        zC <= 1'b0;
                    end  
            
     
    end

assign Q = counter_up;

endmodule
