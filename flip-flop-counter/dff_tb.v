`timescale 1ns / 1ps

module dff_tb;

reg clk;
reg reset;
reg d;
wire q;

d_ff_reset uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

/* 20 ns clock period */
initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

/* reset waveform to match handout more closely */
initial begin
    reset = 1;
    #55 reset = 0;
    #90 reset = 1;
    #35 reset = 0;
end

/* d waveform to match handout more closely */
initial begin
    d = 0;
    #40 d = 1;
    #30 d = 0;
    #40 d = 1;
    #110 d = 0;
end

initial begin
    #260;
    $finish;
end

endmodule
