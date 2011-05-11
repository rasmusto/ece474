module rd_fifo_sm(
    input   reset_n,
    input   clk,
    input   empty,
    output  fifo_rd
);

enum reg{
    NO_READ =   1'b0;
    RD_FIFO =   1'b1;
    XX      =   'x} rd_fifo_ns, rd_fifo_ps;

always_ff @ (posedge clk, negedge reset_n)
    if (!reset_n)   rd_fifo_ps <= no_read;
    else            rd_fifo_ps <= rd_fifo_ns;

always_comb begin
    rd_fifo_ns = XX;
    case (rd_fifo_ps)
        no_read : if (!empty)   rd_fifo_ns = rd_fifo;
        rd_fifo :               rd_fifo_ns = no_read;
    endcase
end
assign fifo_rd = rd_fifo_ps;
endmodule
