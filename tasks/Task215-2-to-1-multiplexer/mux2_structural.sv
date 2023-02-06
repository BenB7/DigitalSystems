module mux2_structural (output logic y, input logic a, b, s);

//Internal wires
wire invS;
wire term1;
wire term3;

//Placing and connecting the gates
not u1 (invS, S);
and u2 (term1, invS, A); 
and u3 (term3, S, B);
or u4 (Y, term1, term3);
endmodule