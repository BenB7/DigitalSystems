module demux_tb;

logic [7:0]Y;
logic D;
logic [2:0]SEL;

demux u1 (Y, D, SEL);

initial
begin
D=1;
//forever #10ps D=~D;
SEL=3'b010;
	begin
	     assert (Y==8'b00000100) $display ("PASS");
	     else $display ("FAIL");
	end
end
endmodule
