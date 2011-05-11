module zero_sel_sm(
    input   reset_n,
    input   clk,
    input   fifo_rd,
    output  zero_select
);

enum reg{
    SEL_ZERO =   1'b0;
    SEL_FIFO =   1'b1;
    XX      =   'x} zero_sel_ns, zero_sel_ps;

always_ff @ (posedge clk, negedge reset_n)
    if (!reset_n)   zero_sel_ps <= SEL_ZERO;
    else            zero_sel_ps <= SEL_FIFO;

always_comb begin
    zero_sel_ns = XX;
    case (zero_sel_ps)
        SEL_ZERO : if (fifo_rd)  zero_sel_ns = SEL_FIFO;
        SEL_FIFO : if (????)     zero_sel_ns = SEL_ZERO;
    endcase
end
assign zero_select = zero_sel_ps;
endmodule
