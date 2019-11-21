module h_sync (
					input  logic clk,			// 25Mhz clock
					output logic h_sync,		// horizontal sync signal(pulse)
					output logic h_display,		// enable horizontal display (conected to AND)
					output logic ena_line		// when line reaches 800 then this is enable
);

reg [9:0] h_counter;

always_ff @(posedge clk)
begin
		if (h_counter < 799) //@ each clock cycle increase 1
			begin
				h_counter <= h_counter + 1;
				ena_line <= 0;
			end

		else	// reset h_counter and
			begin
				h_counter <= 0;
				ena_line <= 1; // end of line count has reached 800
			end
end

always_ff @(posedge clk)
	begin
		/* if(h_counter < 96)
				h_sync=1'b0;		// If count has not reach 96 pixels = 0

		// HSYNC pulse =  back porh + display interval + front porch
		// HSYNC pulse = (48+640+16)
		else if ((h_counter >= 96) && (h_counter < 800))
				h_sync=1'b1; */
			if ( (h_counter >= 96) && (h_counter < 800) )	h_sync=1'b1;
			else	h_sync=1'b0;
	end

always_ff @(posedge clk)
	begin
			if(h_counter < 144)	h_display=1'b0;

			else if (h_counter < 784)
			//else if ( (h_counter >= 144) && (h_counter < 784) )
				h_display=1'b1;
			else
			//else if ((h_counter >= 784) && (h_counter < 800))
				h_display=1'b0;
	end

endmodule
