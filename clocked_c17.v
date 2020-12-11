module clocked_c17 (clk,sync_reset,N1,N2,N3,N6,N7,N22,N23);

input clk;

input sync_reset;

input N1,N2,N3,N6,N7;

output N22,N23;

wire N10,N11,N16,N19,Q1,Q2,Q3,Q6,Q7;

Dff dff_1 (.D(N1),
.clk(clk),
.sync_reset(sync_reset),
.Q(Q1));
Dff dff_2 (.D(N2),
.clk(clk),
.sync_reset(sync_reset),
.Q(Q2));
Dff dff_3 (.D(N3),
.clk(clk),
.sync_reset(sync_reset),
.Q(Q3));
Dff dff_4 (.D(N6),
.clk(clk),
.sync_reset(sync_reset),
.Q(Q6));
Dff dff_5 (.D(N7),
.clk(clk),
.sync_reset(sync_reset),
.Q(Q7));

nand NAND2_1 (N10, Q1, Q3);
nand NAND2_2 (N11, Q3, Q6);
nand NAND2_3 (N16, Q2, N11);
nand NAND2_4 (N19, N11, Q7);
nand NAND2_5 (N22, N10, N16);
nand NAND2_6 (N23, N16, N19);

endmodule


module Dff (D,clk,sync_reset,Q);
input D; // Data input
input clk; // clock input
input sync_reset; // synchronous reset
output reg Q; // output Q
always @(posedge clk)
begin
if(sync_reset==1'b1)
Q <= 1'b0;
else
Q <= D;
end

endmodule
