`timescale 1ns/1ps
module lfsr_21bit_tb;
reg clk, rst;
wire [20:0] lfsr_out;
wire max_tick_reg;

lfsr_21bit uut(.clk(clk),.rst(rst),.lfsr_out(lfsr_out),.max_tick_reg(max_tick_reg));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    rst = 1;
    #100;
    rst = 0;
    #20971510;
    $finish;
end
endmodule
