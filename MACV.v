module MACV(mplier, mcand, aclr, clk, dout);

input signed [7:0] mplier, mcand;
input aclr, clk;

output [15:0] dout;
reg signed [15:0] dout;
wire signed [15:0] feedback, temp;
/*
assign temp = mplier * mcand;
assign signed feedback = temp + feedback;

always @ (posedge clk)
	begin
		if(aclr == 1'b1)
			begin
				dout = feedback;
				assign feedback = 16'b0000000000000000;
			end
	end
	
	*/
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
