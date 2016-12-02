//Verilog module for 1:4 DEMUX
module demux1to12(Data_in,sel, Data_out1, Data_out2, Data_out3, Data_out4, Data_out5, Data_out6,
					Data_out7, Data_out8, Data_out9, Data_out10, Data_out11, Data_out12);

//list the inputs and their sizes
    input [7:0] Data_in;
    input [3:0] sel;
//list the outputs and their sizes 
    output [7:0] Data_out1, Data_out2, Data_out3, Data_out4, Data_out5, Data_out6,
					Data_out7, Data_out8, Data_out9, Data_out10, Data_out11, Data_out12;

//Internal variables
    reg [7:0] Data_out1, Data_out2, Data_out3, Data_out4, Data_out5, Data_out6,
					Data_out7, Data_out8, Data_out9, Data_out10, Data_out11, Data_out12;
   

    always @ *
    begin

		if(sel == 4'b0001) Data_out1 = Data_in;
		else if(sel == 4'b0010) Data_out2 = Data_in;
        else if(sel == 4'b0011) Data_out3 = Data_in;
        else if(sel == 4'b0100) Data_out4 = Data_in;
        else if(sel == 4'b0101) Data_out5 = Data_in;
        else if(sel == 4'b0110) Data_out6 = Data_in;
        else if(sel == 4'b0111) Data_out7 = Data_in;
        else if(sel == 4'b1000) Data_out8 = Data_in;
        
        else if(sel == 4'b1001) Data_out9 = Data_in;
        else if(sel == 4'b1010) Data_out10 = Data_in;
        else if(sel == 4'b1011) Data_out11 = Data_in;
        else if(sel == 4'b1100) Data_out12 = Data_in;        
 
    end
    
endmodule