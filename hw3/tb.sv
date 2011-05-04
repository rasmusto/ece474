`timescale 1ps/1ps

module tb();
parameter WIDTH = 8;

/* Inputs to testbench */
reg reset_n, clk, up_dn, ena, cnt_load, s_reset;
reg     [WIDTH-1:0] cnt_in;
/* Outputs from testbench */
wire    [WIDTH-1:0] cnt_out;
wire term_cnt;

parameter CYCLE = 5000;  //5ns period = 200Mhz
integer out_file;

//define needed internal wires (type reg) to apply signals to 

//create the clock
initial begin
    clk = 0;
    forever #(CYCLE/2) clk = ~clk;
end

//create reset_n
initial begin
    reset_n = 0;       //initalize reset aserted
    @(posedge clk);    //wait 2 clock cycles
    @(posedge clk);   
    #100 reset_n =1;   //release reset_n after 1ns past rising edge
end

//initalize other signals at reset time
initial begin  
    up_dn       = 1;
    ena         = 0;
    cnt_load    = 1;
    s_reset     = 0;
    cnt_in      = 8'h00;
end 

initial begin
    @(posedge reset_n);
    ena = 1;
    #(CYCLE*4);
    //@(posedge clk);
    //@(posedge clk);
    //@(posedge clk);
    //@(posedge clk);
    s_reset = 1;
    @(posedge clk);
    s_reset = 0;
    ena = 0;
    @(posedge clk);
    ena = 1;
    cnt_load = 0;
    cnt_in = 8'h02;
    @(posedge clk);
    ena = 0;
    up_dn = 0;
    @(posedge clk);
    ena = 1;
    cnt_load = 1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    s_reset = 1;
    @(posedge clk);
    //apply stimulus to the counter
end

//open file for results 
initial begin
    out_file = $fopen("updn_cntr.out"); 
    $fdisplay (out_file, "cnt_out  term_cnt    time");
end
//write results to file
always @ (negedge clk)  begin
    $fdisplay (out_file,"%7h   %7b   %5d", cnt_out, term_cnt, $time);
end 

//instantiate the counter here
updn_cntr updn (
    .reset_n (reset_n),
    .clk     (clk),
    .cnt_in  (cnt_in),
    .up_dn   (up_dn),
    .ena     (ena),
    .cnt_load(cnt_load),
    .s_reset (s_reset),
    .cnt_out (cnt_out),
    .term_cnt(term_cnt)
);

endmodule
