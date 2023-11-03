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


module jkff(
    input j,k,
    input clk,
    input rst,
    output q ,q_
    );
    
    reg Q;
    
    always @ (posedge clk) begin
        if ({j,k} === 2'b01)
            Q = 0;
        else if ({j,k} === 2'b10)
            Q = 1;
        else if ({j,k} === 2'b11)
            Q = ~Q;
        if (rst) 
            Q = 0;
    end
    
    assign q = Q;
    assign q_ = ~Q;
endmodule
