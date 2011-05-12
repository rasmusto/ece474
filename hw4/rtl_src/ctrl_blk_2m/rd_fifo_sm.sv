module rd_fifo_sm(
    input   reset_n,
    input   clk_2,
    input   empty,
    output  fifo_rd
);

enum reg{
    NO_READ =   1'b0;
    RD_FIFO =   1'b1;
    XX      =   'x} rd_fifo_ns, rd_fifo_ps;

always_ff @ (posedge clk, negedge reset_n)
    if (!reset_n)   rd_fifo_ps <= NO_READ;
    else            rd_fifo_ps <= RD_FIFO;

always_comb begin
    rd_fifo_ns = XX;
    case (rd_fifo_ps)
        NO_READ : if (!empty)   rd_fifo_ns = RD_FIFO;
        RD_FIFO :               rd_fifo_ns = NO_READ;
    endcase
end
assign fifo_rd = rd_fifo_ps;
endmodule
