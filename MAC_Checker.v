module MAC_Checker(aclr, clk, din, dout, feedback);

input [15:0] din;
input aclr, clk;

output [15:0] dout, feedback;
reg [15:0] dout, feedback;

always @(negedge clk)
	begin
		if(aclr == 1'b1)
			begin
				dout = feedback;
				feedback = 16'b0000000000000000;
				dout = din;
			end
		else
			feedback = din;
			
	end

endmodule