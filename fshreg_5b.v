module fshreg_5b (d, sclr, ld, sh, clk, q, shout);
  input [4:0] d;
  input sclr, ld, sh, clk;
  output shout;
  output [4:0] q;
  reg [4:0] q;
  
  assign ser_in = q[4];
  assign shout = q[0];
  always @(posedge clk)
    if (sclr)
      q <= 5'b0000;
    else if (ld)
      q <= d;
    else if (sh)
      q <= {ser_in, q[4:1]};
        
endmodule

