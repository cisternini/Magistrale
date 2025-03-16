module tb;

  /* Stimuli */
  reg [3:0] addr  = '0; // Initializing to 0 ( = '0 ) -> It corresponds to assigning zero iniside an initial block as first action (before delays)
  
  /* Probes */
  wire [31:0] q;
  
  /* DUT */
  rom ROM (
     .addr  (addr)
    ,.q     (q)
  );

  initial begin
    
        
    /* Stimuli */
    #10ns;
    
    addr = 0;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 1;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 2;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 3;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 4;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 5;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 6;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 7;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 8;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 9;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 10;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 11;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 12;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 13;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 14;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    addr = 15;
    #1ns $display("Addr. 0x%01h >> Q = %08h", addr, q);
    
    #10ns;
    
    $stop;
    
  end
    
endmodule
  
