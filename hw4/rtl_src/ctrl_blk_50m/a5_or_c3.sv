module a5_or_c3 (
    input [7:0] data_in,
    output      a5_or_c3
);

always_comb begin
    if(data_in == 8'hA5 || data_in == 8'hC3)
        a5_or_c3 <= 1'b1;
    else
        a5_or_c3 <= 1'b0;
end
endmodule
