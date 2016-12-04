module dontCareFilter(din, dout, clk);

input clk;
input [15:0] din;
output [15:0] dout;
reg [15:0] dout;


always@(posedge clk)
	begin
		if (din === 16'bxxxxxxxxxxxxxxxx)
					dout = 16'b0000000000000000;
		else
			dout = din;

	end	
endmodule