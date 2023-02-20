module srgate;

logic S, R, Q, Qbar;

srgate u1 (Q, Qbar, S, R);

initial
	begin

	assert (((S==1)&&(R==0)) {Q, Qbar} <= 2'b10) || (((S==0)&&(R==1)) {Q, Qbar} <= 2'b01) || (((S==1)&&(R==1)) {Q, Qbar} <= 2'bzz);
	$display("PASS");
		else $display ("FAIL");

	end
endmodule