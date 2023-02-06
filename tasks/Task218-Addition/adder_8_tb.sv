module adder_8_tb;

	parameter N = 3;

	logic [N-1:0] P1, Q1;
	logic [N-1:0] SUM1;
	logic Cout1;
	logic Cin1;
	logic [N-1:0] P2, Q2;
	logic [N-1:0] SUM2;
	logic Cout2;
	logic Cin2;
	
	//Most significant bit of SUM = Cout
	adder_N #(.N(N)) u1(SUM1, Cout1, P1, Q1, Cin1); u2(SUM2, Cout2, P2, Q2, Cin2); 

	initial 
	begin
	  automatic int S1;
	  for (int c1 = 0; c1<= 1; c1 = c1 + 1) begin
            Cin1 = c1;
	    for (int i1=0; i1<2**N; i1 = i1 + 1) begin
              for (int j1=i1; j1<2**N; j1 = j1 + 1) begin
                P1 = i1;
                Q1 = j1;
		S1 = c1 + i1 + j1;	//Integer summation
	begin
	  automatic int S2;
            Cin2 = Cout1;
	    for (int i2=0; i2<2**N; i2 = i2 + 1) begin
              for (int j2=i2; j2<2**N; j2 = j2 + 1) begin
                P2 = i2;
                Q2 = j2;
		S2 = i2 + j2;	//Integer summation
                #10ps;
		assert ({Cout1,SUM1} == S1) $display("PASS"); else $display("ERROR %d + %d + %d <> %d", c1, i1, j1, SUM1);
		assert ({Cout2,SUM2} == S2) $display("PASS"); else $display("ERROR %d + %d <> %d", i2, j2, SUM2);
             	    end
           	  end
	 	end
              end
            end
	  end
	end
endmodule