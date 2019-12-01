//Edgar Perez
//Set up bellow is for DE10-Lite board OSU
//VGA top level

module VGA(
					input  logic MAX10_CLK1_50,		// Internal 50Mhz clock
					input  logic [1:0] R_in, G_in, B_in,	//Inputs connected to the board's switheces
					output logic [3:0] R,G,B,		// 4-bit output to to DAC 
					output logic h_sync,			// horizontal sync signal(pulse)
					output logic v_sync 			// vertical sync signal(pulse)
);

logic enable_line;						
logic bus_disp_v, bus_disp_h;			//Bus to the AND gate
logic half_and_half;					//bus for 25Mhz clock 

half_clk half_clk01(
          .clk(MAX10_CLK1_50),				// Inputclock (internal_clock)
          .half(half_and_half)				// slow clock 25Mhz
);

muxx muxx01(
		.clk(half_and_half),
		.select_input(bus_disp_h & bus_disp_v), //AND horizontal and vertical display
		.R_in(R_in),
		.G_in(G_in),
		.B_in(B_in),
		.R(R),
		.G(G),
		.B(B)
);


h_sync h_sync01(
		.clk(half_and_half),
		.h_sync(h_sync),
		.h_display(bus_disp_h),			//this line needs to be AND with v_display
		.ena_line(enable_line)
);

v_sync v_sync01(
		.clk(half_and_half),
		.in_ena_line(enable_line),
		.v_sync(v_sync),
		.v_display(bus_disp_v)			//this line needs to be AND with h_display
);

endmodule