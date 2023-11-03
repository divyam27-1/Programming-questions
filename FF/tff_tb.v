`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2023 17:06:51
// Design Name: 
// Module Name: tff_tb
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


module tff_tb;

reg t, clk, rst;
wire q, q_;

tff FF(t, clk, rst, q, q_);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin 
    rst = 1; t <= 1;
    #100; rst = 0; t <= 0;
    #100; rst = 0; t <= 1;
end
endmodule
