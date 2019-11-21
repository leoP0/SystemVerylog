module v_sync (
					input  logic clk,			// 25Mhz clock
					input  logic in_ena_line,	// enable line after it has reached 800(end of line)
					output logic v_sync, 		// vertical sync signal(pulse)
					output logic v_display 		// enable vertical display (conected to AND)
);

reg [9:0] v_counter;

// Logic for v_counter
always_ff@(posedge clk)
	begin
			if (in_ena_line)
			begin
				// Increase the v_counter
				if (v_counter < 524)			// Count to 525
						v_counter <= v_counter + 1;
				else
						v_counter <= 0;
			end //end of if (in_ena_line)
	end

// VSYNC pulse =  back porh + display interval + front porch
// VSYNC pulse = (33+480+10)

// Logic for VSYNC
always_ff@(posedge clk)
	begin
		v_sync <= 1'b0; // start at 0
			if(v_counter < 2)	v_sync<=1'b0;
			else if ((v_counter >= 2) && (v_counter < 525))	v_sync<=1'b1;
	end

// Logic for v_display
always_ff@(posedge clk)
	begin
		v_display<=1'b0; //start at 0 
			if(v_counter < 35) 
							v_display<=1'b0;
					else if ((v_counter >= 35) && (v_counter < 515)) // v_display(display_interval) = 480 lines
							v_display<=1'b1;
					else if ((v_counter > 515) && (v_counter < 525))
							v_display<=1'b0;
	end

endmodule
