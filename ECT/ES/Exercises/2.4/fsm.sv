module fsm (
   input            clk
  ,input            rst_n
  ,input            en
  ,output reg [1:0] out_code
);

  /* State labels */
  localparam S0 = 2'b00;
  localparam S1 = 2'b01;
  localparam S2 = 2'b10;
  localparam S3 = 2'b11;

  /* Logic signals */
  reg [1:0] current_state;
  reg [1:0] next_state;
  
  /* State Register (SR) */
  always_ff @ (posedge clk or negedge rst_n)
    if(!rst_n)
      current_state <= S0;
    else
      current_state <= next_state;
  
  /* Next-state/Output logic (F/G) */
  always_comb
    
    case(current_state)
      
      S0: begin
        out_code    = 2'd0;
        next_state  = en ? S1 : S0;
      end
      
      S1: begin
        out_code    = 2'd1;
        next_state  = en ? S2 : S1;
      end
      
      S2: begin
        out_code    = 2'd2;
        next_state  = en ? S3 : S2;
      end
      
      S3: begin
        out_code    = 2'd3;
        next_state  = en ? S0 : S3;
      end
      
    endcase
    
endmodule
  
