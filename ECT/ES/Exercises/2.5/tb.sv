module tb;

  /* Clock generator */
  reg clk = 1'b0;
  always #5ns clk = !clk;
  
  /* Power-on reset (active-low) */
  reg rst_n = 1'b0;
  initial #12.8ns rst_n = 1'b1;

  /* Stimuli */
  reg       init;
  reg       in_valid;
  reg [7:0] in;
  
  /* Probes */
  wire [7:0] o;
  
  /* DUT */
  byte_adder DUT (
     .clk      (clk)
    ,.rst_n    (rst_n)
    ,.init     (init)
    ,.in_valid (in_valid)
    ,.in       (in)
    ,.out      (o)
  );

  initial begin
    
    init     = 1'b0;  // All zero at beginning of the simulation
    in_valid = 1'b0;
    in       = '0;
        
    /* Initialization */
    #15ns init = 1'b1;  // 15ns = first rising edge of clock after reset de-assertion (which is at 12.8ns)
    #10ns init = 1'b0;  // #10ns = after 10 ns, i.e. at the next rising edge of clock
    
    /* Inputs */
    #10ns in_valid = 1'b1;
    in = $urandom;
    
    #10ns in = $urandom;
    #10ns in = $urandom;
    #10ns in = $urandom;
    #10ns in = $urandom;
    #10ns in = $urandom;
    #10ns in = $urandom;
    
    // Re-initialization
    #10ns in_valid = 1'b0;
    #10ns init     = 1'b1;
    #10ns init     = 1'b0;
    
    #10ns in_valid = 1'b1;
    in = $urandom;
    #10ns in = $urandom;
    #10ns in = $urandom;
    #10ns in = $urandom;
    #10ns in = $urandom;
    #10ns in = $urandom;
    #10ns in = $urandom;
    
    $stop;
    
  end
    
endmodule
  
