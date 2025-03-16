module byte_adder (
   input        clk
  ,input        rst_n
  ,input        init
  ,input        in_valid
  ,input  [7:0] in
  ,output [7:0] out
);

  reg [7:0] previous_byte_reg;
 
  always_ff @ (posedge clk or negedge rst_n)
    if(!rst_n)
      previous_byte_reg <= '0;
    else if(init)
      previous_byte_reg <= 8'd3;
    else if(in_valid)
      previous_byte_reg <= in;
  
  assign out = in + previous_byte_reg;
    
endmodule
  
