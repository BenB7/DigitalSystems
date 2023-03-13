module d_ff1_tb;

logic CLK = 0;
logic D, Q, n_Reset;

//Instantiate a DFF
d_ff1 u1(Q,D,CLK,n_Reset);

//Generate 5 clock cycles
initial begin
	CLK=0;
     	repeat(10) 
		#50ps CLK = ~CLK;

	n_Reset=0;
	repeat(10)
		#100ps n_Reset=~n_Reset;
end 

//Tests (synchronous - write on falling edge of the clock; read on rising)
initial begin
	//Initialise

	D = 0;
	@(negedge n_Reset);
	Q = 0;
	@(posedge n_Reset);
	#1 assert (Q == 0) $display("PASS"); else $error("FAIL");	//Check Q

	D=1;
	@(posedge n_Reset);
	Q = D
	@(negedge n_Reset);
	#1 assert (Q == D) $display("PASS"); else $error("FAIL");	//Check Q

	//Test for when D = 1
	@(negedge CLK);	//Wait for negative edge of clock
	D = 1;		//Set D = 1
	@(posedge CLK);	//Wait for positive edge of clock
	#1 assert(Q == D) $display("PASS"); else $error("FAIL");	//Check Q

	//Test for when D = 0
	@(negedge CLK);	//Wait for negative edge of clock
	D = 0;		//Set D = 0
	@(posedge CLK);	//Wait for negative edge of clock
	#1 assert(Q == D) $display("PASS"); else $error("FAIL");	//Check Q

end
endmodule