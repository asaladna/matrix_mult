module MACV(mplier, mcand, aclr, clk, dout);

input [7:0] mplier, mcand;
input aclr, clk;

output [15:0] dout;
reg [15:0] dout;

assign dout = mplier * mcand + dout;

always @ (posedge clk)
	begin
		if(aclr == 1'b1)
			begin
				dout = 16'b0000000000000000;
			end
	end
endmodule
/*
always @(posedge clk or negedge aclr)
	begin
		if(aclr == 1'b0)
			dout = 16'b0000000000000000;
		else if (din === 16'bxxxxxxxxxxxxxxxx)
			dout = 16'b0000000000000000;
		else
			dout = din;
	end
*/
