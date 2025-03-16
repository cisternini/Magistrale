module ram (
   input  [9:0] addr
  ,input        w
  ,input  [7:0] d
  ,output [7:0] q
);

  reg [7:0] mem [2**10];  // For unpacked dimension use 2 to the power of the bit width of address port (addr -> [9:0] -> 10 bits).
 
  always_comb
    if(w)
      mem[addr] = d;
 
  assign q = mem[addr];
  
endmodule
  
