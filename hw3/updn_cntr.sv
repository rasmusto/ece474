module updn_cntr #(WIDTH=8)(
    input                   reset_n  ,  //asynchronous reset, active low
    input                   clk      ,  //clock input
    input       [WIDTH-1:0] cnt_in   ,  //counter parallel input
    input                   up_dn    ,  //up, down control; up=1, down=0
    input                   ena      ,  //enable, active high
    input                   cnt_load ,  //count/load control; cnt=1, load=0
    input                   s_reset  ,  //synchronous reset, active high
    output  reg [WIDTH-1:0] cnt_out  ,  //counter output
    output                  term_cnt    //terminal cnt, assert when cnt_out=0
);

always @ (posedge clk, negedge reset_n)
    if      (!reset_n)  cnt_out <= WIDTH'b0;
    else if (!s_reset)  cnt_out <= WIDTH'b0;
    else if (ena)
        if(cnt_load) cnt_out <= cnt_in;
        else if (up_dn == 1'b1) cnt_out <= cnt_out + 1'b1;
        else if (up_dn == 0'b1) cnt_out <= cnt_out - 1'b1;
    if (cnt_out == 1'b0)
        term_cnt = 1'b1;
    end

endmodule
