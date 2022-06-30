`define   S0      5'b00000
`define   S1      5'b00001
`define   S2      5'b00010
`define   S3      5'b00011
`define   S4      5'b00100
`define   S5      5'b00101
`define   S6      5'b00110
`define   S7      5'b00111
`define   S8      5'b01000
`define   S9      5'b01001
`define   S10     5'b01010
`define   S11     5'b01011
`define   S12     5'b01100
`define   S13     5'b01101
`define   S14     5'b01110
`define   S15     5'b01111
`define   S16     5'b10000
`define   S17     5'b10001
`define   S18     5'b10010
`define   S19     5'b10011
`define   S20     5'b10100
`define   S21     5'b10101
`define   S22     5'b10110
`define   S23     5'b10111

module control(start, m0, m1, rst, clk, ldy, addsub, ldf, sclrf, shf, lds, shs, sel, sclrr, ldr, done,ps1);
  input start,m0,m1,rst,clk;
  output ldy,addsub,ldf,sclrf,shf,lds,shs,sel,sclrr,ldr,done;
  reg ldy,addsub,ldf,sclrf,shf,lds,shs,sel,sclrr,ldr,done;
  output [4:0] ps1;
  reg [4:0] ps,ns;
  assign ps1 = ps;
  // Sequential part 
  always @(posedge clk)
    if (rst)
      ps <= 5'b00000;
    else
      ps <= ns;
      
      
  always @(ps or start or m0 or m1)
  begin  
  case (ps)
    `S0:  ns = start ? `S1 : `S0;
    `S1:  ns = `S2;
    `S2:  ns = (m0==1 && m1==0)? `S3 :(m0==0 && m1==1)? `S5: `S4;
    `S3:  ns = `S4;
    `S4:  ns = `S6;
    `S5:  ns = `S4;
    `S6:  ns = (m0==1 && m1==0)? `S7 :(m0==0 && m1==1)? `S9: `S8;
    `S7:  ns = `S8;
    `S8:  ns = `S10;
    `S9:  ns = `S8;
    `S10: ns = (m0==1 && m1==0)? `S11 :(m0==0 && m1==1)? `S13: `S12;
    `S11: ns = `S12 ;
    `S12: ns = `S14;
    `S13: ns = `S12;
    `S14: ns = (m0==1 && m1==0)? `S15 :(m0==0 && m1==1)? `S17: `S16;
    `S15: ns = `S16;
    `S16: ns = `S18;
    `S17: ns = `S16;
    `S18: ns = (m0==1 && m1==0)? `S19 :(m0==0 && m1==1)? `S21: `S20;
    `S19: ns = `S20;
    `S20: ns = `S22;
    `S21: ns = `S20;
    `S22: ns = `S23;
    `S23: ns = `S0;
    endcase
  end
  
  
  always @(ps)
  begin
    {ldy,addsub,ldf,sclrf,shf,lds,shs,sel,sclrr,ldr,done} = 11'b000_0000_0000;
    case (ps)
      `S0: ;
      `S1: {lds,sclrf,sclrr} = 3'b111;
      `S2: ldy = 1'b1;
      `S3: {ldf, addsub} = 2'b11;
      `S4: {shs, ldr, shf} = 3'b111;
      `S5: ldf = 1'b1;
      `S6: ;
      `S7: {ldf, addsub} = 2'b11;
      `S8: {shs, ldr, shf} = 3'b111;
      `S9: ldf = 1'b1;
      `S10: ;
      `S11: {ldf, addsub} = 2'b11;
      `S12: {shs, ldr, shf} = 3'b111;
      `S13: ldf = 1'b1;
      `S14: ;
      `S15: {ldf, addsub} = 2'b11;
      `S16: {shs, ldr, shf} = 3'b111;
      `S17: ldf = 1'b1;
      `S18: ;
      `S19: {ldf, addsub} = 2'b11;
      `S20: {shs, ldr, shf} = 3'b111;
      `S21: ldf = 1'b1;
      `S22: done = 1'b1;
      `S23: {sel , done} = 2'b11;
    endcase
  end
  
endmodule