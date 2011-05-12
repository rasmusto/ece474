module wr_fifo_sm(
    input   a5_or_c3,
    input   data_ena,
    input   clk_50,
    input   reset_n,
    output  wr_fifo
);

enum reg [2:0]{
    HEADER  = 3'b000,
    BYTE1   = 3'b100,
    BYTE2   = 3'b101,
    BYTE3   = 3'b110,
    BYTE4   = 3'b111,
    XX      = 'x
} wr_fifo_ns, wr_fifo_ps;

always_ff @ (negedge data_ena, negedge reset_n)
    if   (!reset_n) wr_fifo_ps <= HEADER;
    else            wr_fifo_ps <= wr_fifo_ns;

always_comb begin
    wr_fifo_ns = XX;
    case (wr_fifo_ps)
        HEADER : if (a5_or_c3) wr_fifo_ns = BYTE1;
        else wr_fifo_ns = HEADER;
        BYTE1  : wr_fifo_ns = BYTE2;
        BYTE2  : wr_fifo_ns = BYTE3;
        BYTE3  : wr_fifo_ns = BYTE4;
        BYTE4  : wr_fifo_ns = HEADER;
    endcase
end
assign wr_fifo = wr_fifo_ps[2] && !data_ena;
endmodule
