module top_partD(
    input CCLK,
    input rst,
    output [15:0] lfsr_out,
    output max_tick_reg
);

wire clk_1hz;

// Clock divider - 100MHz to 1Hz
// clkscale = 100,000,000 / 2 = 50,000,000
clock clk_div(
    .CCLK(CCLK),
    .clkscale(50000000),
    .clk(clk_1hz)
);

// LFSR instance
lfsr_21bit lfsr_inst(
    .clk(clk_1hz),
    .rst(rst),
    .lfsr_out(lfsr_out),
    .max_tick_reg(max_tick_reg)
);

assign lfsr_out = lfsr_full[15:0}

endmodule
