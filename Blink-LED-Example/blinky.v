module blinky (
    input wire clk,    // 27MHz input clock
    output reg led     // LED output
);
    reg [24:0] counter = 0;  // 25-bit counter

    always @(posedge clk) begin
        if (counter == 13500000) begin  // Toggle LED every 0.5 sec
            counter <= 0;
            led <= ~led;
        end else begin
            counter <= counter + 1;
        end
    end
endmodule

