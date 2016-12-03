
module demux1to12_16bit(Data_in1, Data_in2, sel1, sel2, Data_out1, Data_out2, Data_out3, Data_out4, Data_out5, Data_out6,
					Data_out7, Data_out8, Data_out9, Data_out10);

//list the inputs and their sizes
    input [15:0] Data_in1;
    input [15:0] Data_in2;
    input [1:0] sel1; //sel1 is squared value & sel 2 is the other
    input [2:0] sel2;
//list the outputs and their sizes 
    output [15:0] Data_out1, Data_out2, Data_out3, Data_out4, Data_out5, Data_out6,
					Data_out7, Data_out8, Data_out9, Data_out10;

//Internal variables
    reg [15:0] Data_out1, Data_out2, Data_out3, Data_out4, Data_out5, Data_out6,
					Data_out7, Data_out8, Data_out9, Data_out10;
//always block with Data_in and sel in its sensitivity list
    always @(Data_in1 or Data_in2 or sel1 or sel2)
    begin
        case (sel1)  //case statement with "sel"
        //multiple statements can be written inside each case.
        //you just have to use 'begin' and 'end' keywords as shown below.
            2'b00 : Data_out1 = Data_in1;
            2'b01 : Data_out2 = Data_in1;
            2'b10 : Data_out3 = Data_in1;
            2'b11 : Data_out4 = Data_in1;
        endcase
		case (sel2)  //case statement with "sel"
        //multiple statements can be written inside each case.
        //you just have to use 'begin' and 'end' keywords as shown below.

            
            3'b000 : Data_out5 = Data_in2;
            3'b001 : Data_out6 = Data_in2;
            3'b010 : Data_out7 = Data_in2;
            
            3'b011 : Data_out8 = Data_in2;
            3'b100 : Data_out9 = Data_in2;
            3'b101 : Data_out10 = Data_in2;
 
        endcase
    end
    
endmodule