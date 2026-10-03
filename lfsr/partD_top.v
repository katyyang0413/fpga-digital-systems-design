module top_partD(
    input CCLK,
    input rst,
    output [15:0] lfsr_out,
    output max_tick_reg
);

wire clk_1hz;
wire [20:0] lfsr_full;

// Clock divider - 100MHz to 1Hz
// clkscale = 100,000,000 / 2 = 50,000,000
clock clk_div(
    .CCLK(CCLK),
    .clkscale(50000000),
    .clk(clk_1hz)
);

// 21-bit LFSR instance
lfsr_21bit lfsr_inst(
    .clk(clk_1hz),
    .rst(rst),
    .lfsr_out(lfsr_full),
    .max_tick_reg(max_tick_reg)
);

// Only show the lower 16 bits on the 16 LEDs
assign lfsr_out = lfsr_full[15:0];

endmodule
