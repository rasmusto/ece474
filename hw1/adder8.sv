module adder8 
(
    input  [7:0]  a,       //data in a
    input  [7:0]  b,       //data in b
    output [7:0] sum_out,  //sum output
    output c_out           //carry output
);
wire [7:0] c_out_temp;
fadder fadder_0 (
    .a          (a[0]),
    .b          (b[0]),
    .sum_out    (sum_out[0]),
    .cin        (0'b0),
    .c_out      (c_out_temp[0]));
fadder fadder_1 (
    .a          (a[1]),
    .b          (b[1]),
    .sum_out    (sum_out[1]),
    .cin        (c_out_temp[0]),
    .c_out      (c_out_temp[1]));
fadder fadder_2 (
    .a          (a[2]),
    .b          (b[2]),
    .sum_out    (sum_out[2]),
    .cin        (c_out_temp[1]),
    .c_out      (c_out_temp[2]));
fadder fadder_3 (
    .a          (a[3]),
    .b          (b[3]),
    .sum_out    (sum_out[3]),
    .cin        (c_out_temp[2]),
    .c_out      (c_out_temp[3]));
fadder fadder_4 (
    .a          (a[4]),
    .b          (b[4]),
    .sum_out    (sum_out[4]),
    .cin        (c_out_temp[3]),
    .c_out      (c_out_temp[4]));
fadder fadder_5 (
    .a          (a[5]),
    .b          (b[5]),
    .sum_out    (sum_out[5]),
    .cin        (c_out_temp[4]),
    .c_out      (c_out_temp[5]));
fadder fadder_6 (
    .a          (a[6]),
    .b          (b[6]),
    .sum_out    (sum_out[6]),
    .cin        (c_out_temp[5]),
    .c_out      (c_out_temp[6]));
fadder fadder_7 (
    .a          (a[7]),
    .b          (b[7]),
    .sum_out    (sum_out[7]),
    .cin        (c_out_temp[6]),
    .c_out      (c_out_temp[7]));
assign c_out = c_out_temp[7];
endmodule
