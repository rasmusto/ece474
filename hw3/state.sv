//enumerated states
enum reg [1:0]{
    IDLE = 2'b00,
    BUSY = 2'b01,
    WAIT = 2'b10,
    FREE = 2'b11,
    XX   =  'x } arbiter_ps, arbiter_ns ;
//infer the present state vctor flip fops
always_ff @(posedge clk, negedge rst_n)
    if (!rst_n) arbiter_ps <= IDLE;
    else        arbiter_ps <= arbiter_ns;
