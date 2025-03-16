module rom (
   input   [3:0] addr
  ,output [31:0] q
);

  reg [31:0] mem [2**4];  // For unpacked dimension use 2 to the power of the bit width of address port (addr -> [3:0] -> 4 bits).
 
  assign q = mem[addr];
 
  // ROM content initialization
  initial
    $readmemh("ROM.hex", mem);
 
endmodule
  
