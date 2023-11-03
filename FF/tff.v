`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2023 16:28:41
// Design Name: 
// Module Name: jkff
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


module tff(
    input t,clk,rst,
    output q, q_
    );
    
    wire j_, k_;
    assign j_ = t;
    assign k_ = t;
    
    jkff FF1(j_, k_, clk, rst, q, q_);
    
endmodule
