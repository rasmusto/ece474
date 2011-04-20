module alu(
    input        [7:0] in_a     ,  //input a
    input        [7:0] in_b     ,  //input b
    input        [3:0] opcode   ,  //opcode input
    output  reg  [7:0] alu_out  ,  //alu output
    output  reg        alu_zero ,  //logic '1' when alu_output [7:0] is all zeros
    output  reg        alu_carry   //indicates a carry out from ALU
);

wire [7:0] add_out;
wire c_out;

adder8 add  (   .a          (in_a),
                .b          (in_b),
                .sum_out    (add_out)
                .c_out      (alu_carry));

parameter c_add         =   4'h01;  //in_a + in
parameter c_sub         =   4'h02;  //in_a - in
parameter c_inc         =   4'h03;  //in_a + 1
parameter c_dec         =   4'h04;  //in_a - 1
parameter c_or          =   4'h05;  //in_a OR in_b
parameter c_and         =   4'h06;  //in_a AND in_b
parameter c_xor         =   4'h07;  //in_a XOR in_b
parameter c_shr         =   4'h08;  //in_a is shifted one place right, zero shifted in
parameter c_shl         =   4'h09;  //in_a is shifted one place left, zero shifted in
parameter c_onescomp    =   4'h0A;  //in_a gets "ones complemented"
parameter c_twoscomp    =   4'h0B;  //in_a gets "twos complemented"

endmodule
