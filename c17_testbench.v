module c17_testbench;
	reg clk,sync_reset,N1,N2,N3,N6,N7;
	wire N22,N23;

	clocked_c17 c17_mod(clk,sync_reset,N1,N2,N3,N6,N7,N22,N23);
	
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
		#0 sync_reset <=1;
		#5 sync_reset <=0;
	end

	//input here
	initial begin 
		#0 	N1=0;
			N2=0;
			N3=0;
			N6=0;
			N7=0;

		#10 	N1=1;
			N2=1;
			N3=0;
			N6=0;
			N7=1;
	end
endmodule 
