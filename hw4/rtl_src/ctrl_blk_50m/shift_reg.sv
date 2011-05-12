module shift_reg (
    input           serial_data,
    input           data_ena,
    input           clk_50,
    input           reset_n,
    output [7:0]    parallel_data
);

always_ff @ (posedge clk_50, negedge reset_n)
    if      (!reset_n)   parallel_data <= 8'h00;
    else if (data_ena)   parallel_data <= {serial_data,parallel_data[7:1]};
end
endmodule
