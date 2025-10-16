// 4-bit Ripple Counter using T Flip-Flops
module Bit_RC (
    input wire clk,
    input wire reset,
    output wire [3:0] q
);

wire [3:0] t;

assign t[0] = clk;
assign t[1] = q[0];
assign t[2] = q[1];
assign t[3] = q[2];

t_flipflop t0 (.clk(t[0]), .reset(reset), .q(q[0]));
t_flipflop t1 (.clk(t[1]), .reset(reset), .q(q[1]));
t_flipflop t2 (.clk(t[2]), .reset(reset), .q(q[2]));
t_flipflop t3 (.clk(t[3]), .reset(reset), .q(q[3]));

endmodule

// T Flip-Flop Module
module t_flipflop (
    input wire clk,
    input wire reset,
    output reg q
);

always @(negedge clk or posedge reset) begin
    if (reset)
        q <= 0;
    else
        q <= ~q;
end

endmodule