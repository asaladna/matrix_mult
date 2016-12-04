module reg160bitV (Dout1, Dout2, Dout3, Dout4, Dout5, Dout6, Dout7, Dout8, Dout9, Dout10,
				Din1, Din2, Din3, Din4, Din5, Din6, Din7, Din8, Din9, Din10, ld, reset, CLK);
	input reset, ld;
	input CLK;
	input [15:0] Din1, Din2, Din3, Din4, Din5, Din6, Din7, Din8, Din9, Din10;
	
	output [15:0] Dout1, Dout2, Dout3, Dout4, Dout5, Dout6, Dout7, Dout8, Dout9, Dout10;
	reg [15:0] Dout1, Dout2, Dout3, Dout4, Dout5, Dout6, Dout7, Dout8, Dout9, Dout10;
	
	always @ (negedge CLK )
		begin
			 if (ld ==1'b1)
				begin
					Dout1 <= Din1;
					Dout2 <= Din2;
					Dout3 <= Din3;
					Dout4 <= Din4;
					Dout5 <= Din5;
					Dout6 <= Din6;
					Dout7 <= Din7;
					Dout8 <= Din8;
					Dout9 <= Din9;
					Dout10 <= Din10;

				end
			else
				begin
					Dout1 <= Dout1;
					Dout2 <= Dout2;
					Dout3 <= Dout3;
					Dout4 <= Dout4;
					Dout5 <= Dout5;
					Dout6 <= Dout6;
					Dout7 <= Dout7;
					Dout8 <= Dout8;
					Dout9 <= Dout9;
					Dout10 <= Dout10;

				end
		end
				
endmodule