module top_module(
    input clk,
    input reset,
    input [4:0] button_in,
    output [3:0] anode_select,
    output [6:0] LED_out
);

wire [4:0] button_db;
wire [7:0] Q;
wire [7:0] Q_next;

/* Debouncer */
debouncer db_inst (
    .clk(clk),
    .reset(reset),
    .button_in(button_in),
    .button_out(button_db)
);

/* Next-state logic */
assign Q_next =
    (button_db[0] || button_db[3]) ? (Q + 8'd1) :
    (button_db[1] || button_db[2]) ? (Q - 8'd1) :
    (button_db[4])                 ? 8'd22      :
                                     Q;

/* 8 D flip-flops */
d_ff_reset dff0 (.clk(clk), .reset(reset), .d(Q_next[0]), .q(Q[0]));
d_ff_reset dff1 (.clk(clk), .reset(reset), .d(Q_next[1]), .q(Q[1]));
d_ff_reset dff2 (.clk(clk), .reset(reset), .d(Q_next[2]), .q(Q[2]));
d_ff_reset dff3 (.clk(clk), .reset(reset), .d(Q_next[3]), .q(Q[3]));
d_ff_reset dff4 (.clk(clk), .reset(reset), .d(Q_next[4]), .q(Q[4]));
d_ff_reset dff5 (.clk(clk), .reset(reset), .d(Q_next[5]), .q(Q[5]));
d_ff_reset dff6 (.clk(clk), .reset(reset), .d(Q_next[6]), .q(Q[6]));
d_ff_reset dff7 (.clk(clk), .reset(reset), .d(Q_next[7]), .q(Q[7]));

/* Seven segment display */
seven_segment_controller display_inst(
    .clk(clk),
    .reset(reset),
    .temp(Q),
    .anode_select(anode_select),
    .LED_out(LED_out)
);

endmodule