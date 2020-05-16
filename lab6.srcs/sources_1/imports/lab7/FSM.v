module FSM(
input wire clk , 
input wire resetn ,

input wire cout ,
input wire E ,
input wire zC ,

output reg EA ,
output reg EC , 
output reg ER ,

output reg sclrC , 
output reg sclrR ,

output reg LAB , 
output reg LR ,

output reg done,
output reg [1:0] present_state //?
    );
    
reg [1:0] next_state;
parameter S0 = 2'b00; // ??
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

// Present stae
always @ (posedge clk or posedge resetn)
    begin
    if (resetn == 0)
        present_state <= S1;
    else
        present_state <= next_state;
    end

// next start
always @ (*)
begin
    case( present_state )
        S1:
            begin
                if(E == 1) 
                    next_state = S2; 
                else
                    next_state = S1;
            end
       
        S2:
            begin
                if(zC == 1'b0) 
                    next_state = S2;
                else 
                    next_state = S3;
            end
        
        S3:
            begin
                if (E == 0)
                    next_state = S1; 
                else
                    next_state = S3;
            end    
            
        default: next_state= S1;    
    
    endcase
end

always @(*) 
begin
    LAB = 1'b0;
    LR=1'b0;
    
    EA=1'b0;
    EC= 1'b0;
    ER= 1'b0;
    
    sclrC= 1'b0; 
    sclrR= 1'b0;
    
    done=1'b0;

    case(present_state)
    S1: begin
        sclrC = 1'b1; 
        sclrR = 1'b1;
        EC = 1'b1; 
        ER = 1'b1;  
    end

    S2: begin
        LAB = 1'b1;
        EA = 1'b1;
        ER =1'b1;
        if (cout == 1)
            LR = 1'b1;
        if (zC == 0)
            EC = 1'b1;
    end
    
    S3: begin
        done = 1'b1;
    end

    default: ;

    endcase
end

endmodule
