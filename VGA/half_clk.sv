// This module slows down the internal clock by 1/2*(internal_clock)
// Internal 50Mhz clock

module half_clk (
          input  logic clk,         // Infputclock (internal_clock)
          output logic half = 0     // slow clock
);

//this should make the 50Mhz clock to 25Mhz
always_ff @(posedge clk)
    begin
        half = ~ half; // goes high for a full cycle and goes low for another full cycle
    end
endmodule
