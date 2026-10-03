module clock(
    input CCLK,
    input [31:0] clkscale,
    output reg clk = 0
);

reg [31:0] clkq = 0;

always @(posedge CCLK) begin

    if (clkq >= clkscale - 1) begin
        clkq <= 0;
        clk  <= ~clk;
    end
    else begin
        clkq <= clkq + 1;
    end

end

endmodule
