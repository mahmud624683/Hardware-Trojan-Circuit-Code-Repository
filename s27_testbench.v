module s27_testbench;
	reg CK,G0,G1,G2,G3,reset;
	wire G17;

	s27 s27_mod(CK,G0,G1,G17,G2,G3,reset);
	
	initial begin
		CK=1'b0;
		forever begin
		#5 CK=~CK;
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
		#0 	G0=0;G1=0;G2=0;G3=0;
		#10 	G0=0;G1=0;G2=0;G3=0;
	end
endmodule 
