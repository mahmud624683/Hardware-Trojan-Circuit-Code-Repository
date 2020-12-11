module clocked_priority_Encoder_16_4 (clk,reset,
G0,G1,G2,G3,
D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15);

input clk;
input reset;
input D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15;
output G0,G1,G2,G3;




wire Dx,Dy,
Qx,

Dm,Dn,
Qm,


Da,Db,
Qa,


Da1,Da2,
Qa1;



/////////////////////////////// for G3 //////////////////////////////////////////

//assign G3=D15 || D14 || D13 || D12 || D11 || D10 || D9 || D8;

assign Da1 = D15 || D14 || D13 || D12 ;

DFF dff_0(.D(Da1),
.clk(clk),
.sync_reset(reset),
.Q(Qa1) );

assign Da2 = Qa1 || D11 || D10 || D9 || D8 ;

DFF dff_1(.D(Da2),
.clk(clk),
.sync_reset(reset),
.Q(G3) );

/////////////////////////////////////////////////////////////////

////////////////// for G2 ///////////////////////////////

//assign G2= D15 || D14 || D13 || D12 || ((!D11) && (!D10) && (!D9) && (!D8) && (D7 || D6 || D5 || D4)) ;


assign Dx = D15 || D14 || D13 || D12 || ((!D11) && (!D10) );

DFF dff_2(.D(Dx),
.clk(clk),
.sync_reset(reset),
.Q(Qx) );
assign Dy = Qx && (!D9) && (!D8) && (D7 || D6 || D5 || D4 );

DFF dff_3(.D(Dy),
.clk(clk),
.sync_reset(reset),
.Q(G2) );



///////////////////// for G1 /////////////////////////////////////

//assign G1= D15 || D14 || (!D13) && ( !D12)&& (D11||D10||(!D9)&&(!D8)&&(D7||D6||(!D5) && (!D4) && (D3 || D2)));
assign Dm = (!D8) &&(D7 || D6 || (!D5) && (!D4) && (D3 || D2) );

DFF dff_4(.D(Dm),
.clk(clk),
.sync_reset(reset),
.Q(Qm));

assign Dn = D15 || D14 || ( !D13) && ( !D12) && ( D11 || D10 || (!D9) && Qm );


DFF dff_5(.D(Dn),
.clk(clk),
.sync_reset(reset),
.Q(G1) );


/////////////////////////////////////////////////////////////////
//////////////////////for G0 ////////////////////////////////////

//assign G0 = D15||(!D14)&& (D13||(!D12)&&(D11||(!D10)&&(D9||(!D8)&& (D7||(!D6)&&(D5||(!D4)&&(D3||(!D2)&&D1)))))) ; /// It's alright ;
assign Da = (!D8)&& (D7||(!D6)&&(D5||(!D4)&&(D3||(!D2)&&D1)));

DFF dff_6 (.D(Da),
.clk(clk),
.sync_reset(reset),
.Q(Qa));

assign Db = D15||(!D14)&& (D13||(!D12)&&(D11||(!D10)&&(D9||Qa)));

DFF dff_7 (.D(Db),
.clk(clk),
.sync_reset(reset),
.Q(G0));


//////////////////////////////////////////////////////////////////////////////////////
endmodule

module DFF (D,clk,sync_reset,Q);
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
