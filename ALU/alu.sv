// ALU
// Edgar Perez
// ECE474

module alu(
			input        [7:0] in_a     ,  //input a
			input        [7:0] in_b     ,  //input b
			input        [3:0] opcode   ,  //opcode input
			output  reg  [7:0] alu_out  ,  //alu output(result)
			output  reg        alu_zero ,  //logic '1' when alu_output [7:0] is all zeros
			output  reg        alu_carry   //indicates a carry out from ALU
      	);

// c_ to identify constant
// Opcode parameters
      parameter c_add = 4'h1; // in_a + in_b
      parameter c_sub = 4'h2; // in_a - in_b
      parameter c_inc = 4'h3; // in_a + 1
      parameter c_dec = 4'h4; // in_a - 1
      parameter c_or  = 4'h5; // in_a OR in_b
      parameter c_and = 4'h6; // in_a AND in_b
      parameter c_xor = 4'h7; // in_a XOR in_b
      parameter c_shr = 4'h8; // in_a is shifted one place right, zero shifted in
      parameter c_shl = 4'h9; // in_a is shifted one place left, zero shifted in
      parameter c_onescomp = 4'hA; // in_a gets "ones complemented"
      parameter c_twoscomp = 4'hB; // in_a gets "twos complemented"

// Name of registers
reg [8:0] register0;

  always_comb
      case(opcode)

          c_add :	begin
                  {alu_carry, alu_out} = in_a + in_b;
                  end

            			//register0 = in_a + in_b;
            			//alu_out[7:0] = register0[7:0];
            			//alu_carry = register0[8];

          c_sub : begin
                  {alu_carry, alu_out} = in_a - in_b;
            			//register0  = in_a - in_b;
            			//alu_out[7:0] = register0[7:0];
            			//alu_carry = register0[8];
            			end

          c_inc :	begin
                  {alu_carry, alu_out} = in_a + 1;
            			//register0 = in_a + 1;
            			//alu_out[7:0] = register0[7:0];
            			//alu_carry = register0[8];
            			end

          c_dec : begin
                  {alu_carry, alu_out} = in_a - 1;
            			//register0 = in_a - 1;
            			//alu_out[7:0] = register0[7:0];
            			//alu_carry = register0[8];
            			end

          c_or  :	begin
                  // assign alu_out = in_a | in_b;  // Is this the same as bellow??
                  // alu_carry = 0;
            			alu_out[7:0] = in_a | in_b; // bitwise operators
            			alu_carry = 0;
            			end

          c_and : begin
            			alu_out[7:0] = in_a & in_b; // bitwise operators
            			alu_carry = 0;
            			end

          c_xor : begin
            			alu_out[7:0] = in_a ^ in_b; // bitwise operators
            			alu_carry = 0;
            			end

          c_shr : begin
            			alu_out[7:0] = in_a[7:0]>>1;
            			alu_carry = 0;
            			end

          c_shl : begin
            			register0 = in_a[7:0]<<1;
            			alu_out[7:0] = register0[7:0];
            			alu_carry = register0[8];
            			end

     c_onescomp : begin
            			alu_out = ~in_a; // (~) negation
            			alu_carry = 0;
            			end

     c_twoscomp : begin
                  // Two's complements, (~) flip bits then add 1 athe LSB
            			register0 = ~in_a + 1'b1;
            			alu_out = register0[7:0];
            			alu_carry = register0[8];
            			end

        default : begin
            			alu_out = in_a;
            			alu_carry = 0;
            			end
            	endcase

            	assign alu_zero = ~|alu_out;

endmodule
