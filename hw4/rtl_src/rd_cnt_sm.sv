module rd_cnt_sm.sv(
    input reset_n,
    input clk,
    input fifo_rd
);

enum reg [1:0]{
    CNT0 = 2'b00;
    CNT1 = 2'b01;
    CNT2 = 2'b10;
    CNT3 = 2'b11;
    XX   = 'x} rd_cnt_ns, rd_cnt_ps;

always_ff @ (posedge clk, negedge reset_n)
    if (!reset_n)   rd_cnt_ps <= CNT0;
    else            rd_cnt_ps <= rd_cnt_ns;

always_comb begin
    rd_cnt_ns = XX;
    case (rd_cnt_ps)
        CNT0 : if (fifo_rd) rd_cnt_ns = CNT1;
        CNT1 : if (fifo_rd) rd_cnt_ns = CNT2;
        CNT2 : if (fifo_rd) rd_cnt_ns = CNT3;
        CNT3 : if (fifo_rd) rd_cnt_ns = CNT0;
    endcase
end
endmodule
