`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2023 16:43:06
// Design Name: 
// Module Name: jkff_tb
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


module jkff_tb;

reg clk, j, k, rst;
wire q, q_;

jkff FF(j,k,clk,rst,q,q_);

initial begin
  clk=0;
     forever #10 clk = ~clk;  
end
initial begin 
    rst = 1; j <= 1; k <= 0;
    #100; rst  = 1; j <= 1; k <= 0;
    #100; rst = 0; j <= 0; k <= 1;
    #100; rst = 0; j <= 1; k <= 1;
    #100; rst = 0; j <= 0; k <= 0;
end
endmodule
