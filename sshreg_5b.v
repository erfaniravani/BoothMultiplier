module sshreg_5b (d, ser_in, ld, sh, clk, q, shout);
  input [4:0] d;
  input ld, sh, clk, ser_in;
  output shout;
  output [4:0] q;
  reg [4:0] q;

  
  
  assign shout = q[0];
  
  always @(posedge clk)
    if (ld)
      q <= d;
    else if (sh)
      q <= {ser_in, q[4:1]};
        
endmodule



