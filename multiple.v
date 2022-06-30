module multiple(data_in,rst,start,clk,data_out,done);
  input [4:0] data_in;
  input rst,start,clk;
  output [4:0] data_out;
  output done;
  
  wire ldy,addsub,ldf,sclrf,shf,lds,shs,sel,sclrr,ldr,m0,m1;
  
  data dp(data_in,clk,ldy,addsub,ldf,sclrf,shf,lds,shs,sel,sclrr,ldr,m0,m1,data_out);
  control cu(start,m0,m1,rst,clk,ldy,addsub,ldf,sclrf,shf,lds,shs,sel,sclrr,ldr,done);
  
  
endmodule
