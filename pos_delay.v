
module pos_delay( din, dout, clk);

	input clk;
	input  din;
	output  dout;

	reg dout;

    always @(posedge clk)
		begin
			dout = din;
		end
		
endmodule