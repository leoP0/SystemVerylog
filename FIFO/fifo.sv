// Homework 4
// Edgar Perez
// ECE474
// FIFO

module fifo (
       input              wr_clk,   //write clock
       input              rd_clk,   //read clock
       input              reset_n,  //reset async active low
       input              wr,       //write enable
       input              rd,       //read enable
       input        [7:0] data_in,  //data in
       output reg   [7:0] data_out, //data out
       output reg         empty,    //empty flag
       output reg         full      //full flag
       );

        reg	[3:0]	rd_addr;	// 1000
       	reg [3:0]	wr_addr;	// when empty 0000 and full @ 1000 
		reg [3:0]	keeper; 	// to keep track of the rd_addr and wr_addr

// 8-bit wide and 8 byte deep
// datapath varaibles and reg
       	reg	[7:0] byte_0, byte_1, byte_2, byte_3, byte_4, byte_5, byte_6, byte_7;

	// Logc to write to fifo
	always_ff @(posedge wr_clk, negedge reset_n) begin
		if(!reset_n)	wr_addr <= '0;     // set reset to be 0
		else if(wr)		wr_addr <= wr_addr + 1; // if wr is enable, then increment wr_addr to write in next byte
		else if(wr_addr == 8) wr_addr <= '0;     // set wr_addr to 0
			else 	 	wr_addr <= wr_addr; // if not, hold the value
	end

       //write to memory logic
       always_ff @(posedge wr_clk, negedge reset_n) begin
			if(!reset_n) begin //if reset is 0
				byte_0   <= '0; // fill everithing with 0's
				byte_1   <= '0;
				byte_2   <= '0;
				byte_3   <= '0;
				byte_4   <= '0;
				byte_5   <= '0;
				byte_6   <= '0;
				byte_7   <= '0;
			end

			else if(wr) begin
				unique case (wr_addr[2:0])
						3'b000 : byte_0 <= data_in;
						3'b001 : byte_1 <= data_in;
						3'b010 : byte_2 <= data_in;
						3'b011 : byte_3 <= data_in;
						3'b100 : byte_4 <= data_in;
						3'b101 : byte_5 <= data_in;
						3'b110 : byte_6 <= data_in;
						3'b111 : byte_7 <= data_in;
					default: begin
							byte_0 <= byte_0;
							byte_1 <= byte_1;
							byte_2 <= byte_2;
							byte_3 <= byte_3;
							byte_4 <= byte_4;
							byte_5 <= byte_5;
							byte_6 <= byte_6;
							byte_7 <= byte_7;
							end
				endcase
			end
       end


// Logic for reading
always_ff @(posedge rd_clk, negedge reset_n)
	begin
	if(!reset_n)	rd_addr <= 0;
	else if(rd)	  rd_addr <= rd_addr + 1;	// when rd enable increase rd_addr
	else          rd_addr <= rd_addr;     	// if not, stay the same
end

// Determine to which register would contain the data
always_comb begin
data_out = 0;
	unique case (rd_addr[2:0])
		3'b000 : data_out = byte_0;
		3'b001 : data_out = byte_1;
		3'b010 : data_out = byte_2;
		3'b011 : data_out = byte_3;
		3'b100 : data_out = byte_4;
		3'b101 : data_out = byte_5;
		3'b110 : data_out = byte_6;
		3'b111 : data_out = byte_7;
	endcase
end

	//full and empty flag logic
	always_comb 
	begin
		empty = 1'b1; //set empty to 1
		full  = 1'b0; //set full to 0

			// when wr_addr=1000 and rd_addr=0000 (full)
			// when wr_addr=1000 and rd_addr=1000 (empty)
			if(rd_addr[2:0] == wr_addr[2:0])	//Compare the first 3 bits
			begin
				// If read is 1000 and write 1000 (the MSB) is 1
				// it means that read has gone 8 times => EMPTY
				if(rd_addr[3] == wr_addr[3])	 
				begin
					full  = 1'b0; // set full to 0 when not full
					empty = 1'b1; // set empty to 1 when fifo has emptied the data
				end

				else begin
					full  = 1'b1; // FIFO is full
					empty = 1'b0;
				end
			end

			else begin
				full  = 1'b0; // fifo not full
				empty = 1'b0; // fifo not empty
			end
	end

endmodule
