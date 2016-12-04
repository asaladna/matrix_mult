
module demux1to12_16bit( Data_in1, Data_in2, sel1, sel2, Data_out1, Data_out2, Data_out3, Data_out4, Data_out5, Data_out6,
					Data_out7, Data_out8, Data_out9, Data_out10, , Data_out11, Data_out12, clk);

	input clk;
    input [15:0] Data_in1;
    input [15:0] Data_in2;
    input [2:0] sel1; //sel1 is squared value & sel 2 is the other
    input [2:0] sel2;

    output [15:0] Data_out1, Data_out2, Data_out3, Data_out4, Data_out5, Data_out6,
					Data_out7, Data_out8, Data_out9, Data_out10, Data_out11, Data_out12;


    reg [15:0] Data_out1, Data_out2, Data_out3, Data_out4, Data_out5, Data_out6,
					Data_out7, Data_out8, Data_out9, Data_out10, Data_out11, Data_out12;

    always @(posedge clk)
		begin
				if(sel1 == 3'b000) Data_out1 = Data_in1;
				else if(sel1 == 3'b001) Data_out2 = Data_in1;
				else if(sel1 == 3'b010) Data_out3 = Data_in1;
				else if(sel1 == 3'b011) Data_out4 = Data_in1;
				else if (sel1 == 3'b111) Data_out12 = Data_in2;

				if(sel2 == 3'b000) Data_out5 = Data_in2;
				else if(sel2 == 3'b001) Data_out6 = Data_in2;
				else if(sel2 == 3'b010) Data_out7 = Data_in2;
				else if(sel2 == 3'b011) Data_out8 = Data_in2;
				else if(sel2 == 3'b100) Data_out9 = Data_in2;
				else if(sel2 == 3'b101) Data_out10 = Data_in2;
				else if (sel2 == 3'b111) Data_out11 = Data_in2;


			/*    
				3'b000 : Data_out5 = Data_in2;
				3'b001 : Data_out6 = Data_in2;
				3'b010 : Data_out7 = Data_in2;
				
				3'b011 : Data_out8 = Data_in2;
				3'b100 : Data_out9 = Data_in2;
				3'b101 : Data_out10 = Data_in2;
	 */

		end
    
endmodule



