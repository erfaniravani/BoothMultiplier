module multiple_tb;
  reg [4:0] data_in;
  reg rst, start, clk;
  wire [4:0] data_out;
  wire done;
  
  multiple mt(data_in,rst,start,clk,data_out,done);
  
  
  
  
  initial
  begin
    start = 1'b0;
    rst = 1'b0;
    clk = 1'b0;
    #13 rst = 1'b1;
    #19 rst = 1'b0;
    #11 start = 1'b1;
    #20 start = 1'b0;
     data_in = $random % 16;
    #20 data_in = $random % 16;
    #1000 ;
    #13 rst = 1'b1;
    #19 rst = 1'b0;
    #11 start = 1'b1;
    #20 start = 1'b0;
     data_in = $random % 16;
    #20 data_in = $random % 16;
    #1000 ;
    #13 rst = 1'b1;
    #19 rst = 1'b0;
    #11 start = 1'b1;
    #20 start = 1'b0;
     data_in = $random % 16;
    #20 data_in = $random % 16;
    #1000 ;
    #13 rst = 1'b1;
    #19 rst = 1'b0;
    #11 start = 1'b1;
    #20 start = 1'b0;
     data_in = $random % 16;
    #20 data_in = $random % 16;
    #1000 ;
    #13 rst = 1'b1;
    #19 rst = 1'b0;
    #11 start = 1'b1;
    #20 start = 1'b0;
     data_in = $random % 16;
    #20 data_in = $random % 16;
    #5000 $finish;
  end
  
  always
  begin
    #10 clk = ~clk;
  end
  
  
endmodule

