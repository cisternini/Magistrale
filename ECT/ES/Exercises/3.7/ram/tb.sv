module tb;

  /* Stimuli */
  reg       w     = '0; // Initializing to 0 ( = '0 ) -> It corresponds to assigning zero iniside an initial block as first action (before delays)
  reg [9:0] addr  = '0; // Initializing to 0 ( = '0 ) -> It corresponds to assigning zero iniside an initial block as first action (before delays)
  reg [7:0] d     = '0; // Initializing to 0 ( = '0 ) -> It corresponds to assigning zero iniside an initial block as first action (before delays)
  
  /* Probes */
  wire [7:0] q;
  
  /* DUT */
  ram RAM (
     .addr  (addr)
    ,.w     (w)
    ,.d     (d)
    ,.q     (q)
  );

  initial begin
    
    /* Stimuli */
    #10ns;
    addr = $urandom;
    #1ns $display("[R] - Addr. 0x%03h >> Q = %02h", addr, q);
    
    #10ns;
    w = 1'b1;
    d = $urandom;
    $display("[W] - Addr. 0x%03h >> D = %02h", addr, d);
    
    #10ns;
    w = 1'b0;
    #1ns $display("[R] - Addr. 0x%03h >> Q = %02h", addr, q);
    
    #10ns;
    addr = $urandom;
    w = 1'b1;
    d = $urandom;
    $display("[W] - Addr. 0x%03h >> D = %02h", addr, d);
    
    #10ns;
    addr = addr + 1;
    d = $urandom;
    $display("[W] - Addr. 0x%03h >> D = %02h", addr, d);
    
    #10ns;
    addr = addr + 1;
    d = $urandom;
    $display("[W] - Addr. 0x%03h >> D = %02h", addr, d);
    
    #10ns;
    addr = addr + 1;
    d = $urandom;
    $display("[W] - Addr. 0x%03h >> D = %02h", addr, d);
    
    #10ns;
    w = 1'b0;
    addr = addr - 3;
    #1ns $display("[R] - Addr. 0x%03h >> Q = %02h", addr, q);
    
    #10ns;
    addr = addr + 1;
    #1ns $display("[R] - Addr. 0x%03h >> Q = %02h", addr, q);
    
    #10ns;
    addr = addr + 1;
    #1ns $display("[R] - Addr. 0x%03h >> Q = %02h", addr, q);
    
    #10ns;
    addr = addr + 1;
    #1ns $display("[R] - Addr. 0x%03h >> Q = %02h", addr, q);
    
    #10ns;
    
    $stop;
    
  end
    
endmodule
  
