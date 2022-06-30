module addorsub (a, b, addsub, s);
  input [4:0] a, b;
  input addsub;
  output [4:0] s;
  
  assign s =(addsub==1)? a + b : a - b;
  
endmodule

