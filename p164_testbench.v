module p164_testbench;
	
        reg clk,reset,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15;
	wire G0,G1,G2,G3;

	clocked_priority_Encoder_16_4  clocked_p164 (clk,reset,G0,G1,G2,G3,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15);
	
	initial begin
		clk=1'b0;
		forever begin
		#5 clk=~clk;
		end
	end
	initial begin 
		$shm_open("shm.db",1);
		$shm_probe("AS");
		#700 $finish;
		#750 $shm_close();
	end
	initial begin 
		#0 reset <=1;
		#5 reset <=0;
	end
        //input here
	initial begin 
		#0 	D0=0;D1=0;D2=0;D3=0;D4=0;D5=0;D6=0;D7=0;D8=0;D9=0;D10=0;D11=0;D12=0;D13=0;D14=0;D15=0;

		#10 	D0=1;D1=0;D2=0;D3=0;D4=1;D5=1;D6=1;D7=1;D8=0;D9=0;D10=0;D11=0;D12=0;D13=0;D14=0;D15=0;

	end

endmodule
