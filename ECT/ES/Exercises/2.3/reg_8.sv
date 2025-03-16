module reg_8 (
   input            clk
  ,input            rst_n
  ,input      [7:0] d
  ,output reg [7:0] q
);

  always_ff @ (posedge clk or negedge rst_n)
    if(!rst_n)
      q <= '0;
    else
      q <= d;
  
endmodule
