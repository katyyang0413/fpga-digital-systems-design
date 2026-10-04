// Reconstructed helper module.
// Original source was not recovered from the original Vivado project.

module seven_segment_controller(
    input clk,
    input reset,
    input [7:0] temp,
    output reg [3:0] anode_select,
    output reg [6:0] LED_out
);

reg [19:0] refresh_counter;
wire [1:0] digit_select;

wire [3:0] ones;
wire [3:0] tens;
wire [3:0] hundreds;

reg [3:0] digit_value;


// Refresh counter
always @(posedge clk) begin
    if (reset)
        refresh_counter <= 0;
    else
        refresh_counter <= refresh_counter + 1;
end

assign digit_select = refresh_counter[19:18];


// Split value into decimal digits
assign ones     = temp % 10;
assign tens     = (temp / 10) % 10;
assign hundreds = temp / 100;


// Choose which digit is active
always @(*) begin
    case (digit_select)

        2'b00: begin
            anode_select = 4'b1110;
            digit_value = ones;
        end

        2'b01: begin
            anode_select = 4'b1101;
            digit_value = tens;
        end

        2'b10: begin
            anode_select = 4'b1011;
            digit_value = hundreds;
        end

        default: begin
            anode_select = 4'b0111;
            digit_value = 4'd15;
        end

    endcase
end


// Convert decimal digit to seven-segment pattern
always @(*) begin
    case (digit_value)

        4'd0: LED_out = 7'b1000000;
        4'd1: LED_out = 7'b1111001;
        4'd2: LED_out = 7'b0100100;
        4'd3: LED_out = 7'b0110000;
        4'd4: LED_out = 7'b0011001;
        4'd5: LED_out = 7'b0010010;
        4'd6: LED_out = 7'b0000010;
        4'd7: LED_out = 7'b1111000;
        4'd8: LED_out = 7'b0000000;
        4'd9: LED_out = 7'b0010000;

        default:
            LED_out = 7'b1111111;

    endcase
end

endmodule
