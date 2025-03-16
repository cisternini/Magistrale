module adder_c2_4_bit (
   input  signed [3:0] a
  ,input  signed [3:0] b
  ,output signed [3:0] c
);

  assign c = a + b;
  
endmodule
