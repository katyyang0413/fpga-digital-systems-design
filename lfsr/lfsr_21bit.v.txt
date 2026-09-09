module lfsr_21bit(clk, rst, lfsr_out, max_tick_reg);
input clk, rst;
output reg [20:0] lfsr_out;
output reg max_tick_reg;

always @(posedge clk) begin
    if(rst) begin
        lfsr_out <= 21'h155555;
        max_tick_reg <= 0;
    end else begin
        lfsr_out <= {lfsr_out[19:0], ~(lfsr_out[20]^lfsr_out[18])};
        if({lfsr_out[19:0], ~(lfsr_out[20]^lfsr_out[18])} == 21'h155555)
            max_tick_reg <= 1;
        else
            max_tick_reg <= 0;
    end
end
endmodule