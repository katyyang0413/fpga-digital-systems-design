module d_ff_reset(
    input clk,
    input reset,
    input d,
    output reg q
);

always @(posedge clk) begin
    if (reset)
        q <= 1'b0;   // Reset stored bit to 0
    else
        q <= d;      // Store input d on rising clock edge
end

endmodule
