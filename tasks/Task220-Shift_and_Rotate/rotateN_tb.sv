module rotateN_tb;

logic DIR;
logic [7:0] X,Y;
parameter N=8;

rotateN u1 (Y,X,DIR);

initial
begin
DIR=1;
X=8'b10101100;
#10ps;
     begin
     assert (Y ==({ X[0], X[N-1:1] } || { X[N-2:0], X[N-1] })) $display("PASS");
          else $display ("FAIL");

    end
end
endmodule