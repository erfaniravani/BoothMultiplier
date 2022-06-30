module data(data_in, clk, ldy, addsub, ldf, sclrf, shf, lds, shs, sel, sclrr, ldr, m0, m1, data_out);
  input [4:0] data_in;
  input clk,ldy,addsub,ldf,sclrf,shf,lds,shs,sel,sclrr,ldr;
  output m0,m1;
  output [4:0] data_out;
  
  wire [4:0] s_out,sum,f_out,y_out;
  wire fsh,ssh;
  
  addorsub a(f_out,y_out,addsub,sum);
  reg_5b y(data_in,ldy,clk,y_out);
  fshreg_5b f(sum,sclrf,ldf,shf,clk,f_out,fsh);
  sshreg_5b s(data_in,fsh,lds,shs,clk,s_out,ssh);
  reg_1b r(ssh,sclrr,ldr,clk,m0);
  mux2in mux(f_out,s_out,sel,data_out);
  assign m1 = ssh;
  
endmodule
  
