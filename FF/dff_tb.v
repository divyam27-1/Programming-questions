`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2023 17:21:21
// Design Name: 
// Module Name: dff_tb
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


module dff_tb;

reg d, clk;
wire q, q_;

dff FF(d, clk, q, q_);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin 
    d <= 1;
    #25; d = 0;
    #25; d = 1;
end
endmodule
