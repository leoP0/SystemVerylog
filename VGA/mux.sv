module muxx(
				input logic clk,					//should be 25MHz
				input logic select_input, // This is where the h_display and v_display go through an AND gate
				input logic [1:0] R_in, G_in, B_in,
				output logic [3:0] R,G,B
);

// save the color and send it to R,G,B only if select_input = 1
reg [3:0] R_color_hold, G_color_hold, B_color_hold;

//selection of color logic
always_comb
begin

		case(R_in)
				0: R_color_hold = 4'b0000;
				1: R_color_hold = 4'b0101;
				2: R_color_hold = 4'b1010;
				3: R_color_hold = 4'b1111;
				default: R_color_hold = 4'b0000;
		endcase

		case(G_in)
				0: G_color_hold = 4'b0000;
				1: G_color_hold = 4'b0101;
				2: G_color_hold = 4'b1010;
				3: G_color_hold = 4'b1111;
				default: G_color_hold = 4'b0000;
		endcase

		case(B_in)
				0: B_color_hold = 4'b0000;
				1: B_color_hold = 4'b0101;
				2: B_color_hold = 4'b1010;
				3: B_color_hold = 4'b1111;
				default: B_color_hold = 4'b0000;
		endcase
end

always_comb
begin

	case(select_input)
				0: begin
						R = 4'b0000;
						G = 4'b0000;
						B = 4'b0000;
					 end

				1: begin
						R = R_color_hold;
						G = G_color_hold;
						B = B_color_hold;
				 	end

				default: begin
									R = 4'b0000;
									G = 4'b0000;
									B = 4'b0000;
					 			 end
	endcase
end

endmodule