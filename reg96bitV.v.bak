module reg96bitV (ld, reset, CLK, Dout1, Dout2, Dout3, Dout4, Dout5, Dout6, Dout7, Dout8, Dout9, Dout10, Dout11, Dout12,
				Din1, Din2, Din3, Din4, Din5, Din6, Din7, Din8, Din9, Din10, Din11, Din12);
	input reset, ld;
	input CLK;
	input [7:0] Din1, Din2, Din3, Din4, Din5, Din6, Din7, Din8, Din9, Din10, Din11, Din12;
	
	output [7:0] Dout1, Dout2, Dout3, Dout4, Dout5, Dout6, Dout7, Dout8, Dout9, Dout10, Dout11, Dout12;
	reg [7:0] Dout1, Dout2, Dout3, Dout4, Dout5, Dout6, Dout7, Dout8, Dout9, Dout10, Dout11, Dout12;
	
	always @ (posedge CLK )
		begin
			/*if(reset)
				begin
					Dout1 <= 0;
					Dout2 <= 0;
					Dout3 <= 0;
					Dout4 <= 0;
					Dout5 <= 0;
					Dout6 <= 0;
					Dout7 <= 0;
					Dout8 <= 0;
					Dout9 <= 0;
					Dout10 <= 0;
					Dout11 <= 0;
					Dout12 <= 0;
				end	
			else*/
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
					Dout11 <= Din11;
					Dout12 <= Din12;
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
					Dout11 <= Dout11;
					Dout12 <= Dout12;
				end
		end
				
endmodule