
module pos_delay( din, dout, clk);

	input clk;
	input [3:0] din;
	output [3:0] dout;

	reg [3:0]dout;

    always @(posedge clk)
		begin
			dout <= din;
		end
		
endmodule