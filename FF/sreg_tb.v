`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2023 17:25:50
// Design Name: 
// Module Name: sreg_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sreg_tb;

    reg in, clk;
    wire sout;
    
   sreg FM (.in(in), .clk(clk), .sout(sout));
   initial begin
   clk = 0; 
   forever
    #10 clk = ~clk;
   end 
   
   initial begin
    
   #5; in = 1;
   #10; in = 0;
   #10; in = 0;
   #10; in = 1;
   #10; in = 1;
   #10; in = 0;
   #10; in = 0;
   #10; in = 1;
   #10; in = 0;
   
   
   end  

endmodule
