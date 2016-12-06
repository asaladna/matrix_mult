
module pos_delay( din, dout, clk, reset);
/*
	input clk, reset;
	input  din;
	output  dout;
	reg pstate;
	reg dout;


		
	always @ (posedge clk)
		begin
			if (reset == 1'b1) dout = din;

			else if (reset == 1'b0)  dout = din;
		end

	
endmodule
*/

	input clk, reset;
	input  din;
	output  dout;
	reg pstate;
	reg dout;


	parameter S0=1'b0, S1=1'b1;
		
	always @ (posedge clk)
		begin
			if (reset == 1'b1) pstate = S0;

			else if (reset == 1'b0)  pstate = S1;
		end
		
	always @ (pstate)
		begin
			
			case(pstate)		
				S0: dout = din;
				S1: dout = din;
			endcase
		end
		
		

endmodule