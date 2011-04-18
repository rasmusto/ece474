module alu(
    input        [7:0] in_a     ,  //input a
    input        [7:0] in_b     ,  //input b
    input        [3:0] opcode   ,  //opcode input
    output  reg  [7:0] alu_out  ,  //alu output
    output  reg        alu_zero ,  //logic '1' when alu_output [7:0] is all zeros
    output  reg        alu_carry   //indicates a carry out from ALU
);
endmodule

parameter c_add = 4'h01;
parameter c_sub = 4'h02;
parameter c_inc = 4'h03;

c_add      =  0001   in_a + in_b
c_sub      =  0010   in_a - in_b
c_inc      =  0011   in_a + 1
c_dec      =  0100   in_a - 1
c_or       =  0101   in_a OR in_b
c_and      =  0110   in_a AND in_b
c_xor      =  0111   in_a XOR in_b
c_shr      =  1000   in_a is shifted one place right, zero shifted in
c_shl      =  1001   in_a is shifted one place left, zero shifted in
c_onescomp =  1010   in_a gets "ones complemented"
c_twoscomp =  1011   in_a gets "twos complemented"
