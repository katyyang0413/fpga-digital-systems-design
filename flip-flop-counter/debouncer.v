module debouncer(
    input clk,
    input reset,
    input [4:0] button_in,
    output reg [4:0] button_out
);

reg [19:0] counter;
reg [4:0] previous_button;

always @(posedge clk) begin

    if (reset) begin
        counter <= 0;
        previous_button <= 0;
        button_out <= 0;
    end

    else begin

        // If the button input changes,
        // restart the debounce counter
        if (button_in != previous_button) begin
            counter <= 0;
            previous_button <= button_in;
        end

        else begin

            // Input has stayed stable
            if (counter < 20'd1000000)
                counter <= counter + 1;

            else
                // Accept the stable button value
                button_out <= previous_button;
        end
    end
end

endmodule
