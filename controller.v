module controller (clk, reset, cf_load, mux_select1, mux_select2, mux_select3, output_set, output_clr, mem_clr,
					demuxto12_sel, reg96_ld, reg106_ld, demux16bit_sel1, demux16bit_sel2, final_mux_sel,
						MAC_Reset1, MAC_Reset2);

	input clk, reset, cf_load;
	output output_set, output_clr, mem_clr,reg96_ld;
	output reg106_ld, MAC_Reset1, MAC_Reset2;
	
	
	output [1:0] demux16bit_sel1;
	output [2:0] demux16bit_sel2;
	output [3:0] mux_select1, mux_select2, mux_select3; 
	output [3:0] demuxto12_sel, final_mux_sel;
	
	reg output_set, output_clr, mem_clr, reg96_ld, reg106_ld, MAC_Reset1, MAC_Reset2;
	reg [1:0] demux16bit_sel1;
	reg [2:0] demux16bit_sel2;
	reg [3:0] mux_select1, mux_select2, mux_select3; 
	reg [3:0] pstate,nstate,demuxto12_sel, final_mux_sel;
	
	parameter S0=4'b0000, S1=4'b0001,S2=4'b0010,S3=4'b0011, S4=4'b0100,S5=4'b0101,S6=4'b0110, S7=4'b0111,S8=4'b1000,
		S9=4'b1001, S10=4'b1010,S11=4'b1011,S12=4'b1100;
		
	always @ (posedge clk or posedge reset)
		begin
			if (reset == 1'b1) pstate <= S0;
			else pstate <= nstate;
		end
		
	always @ (posedge clk or posedge reset)
		begin
			reg
			//demuxto12_sel
			MAC_Reset1 = 1'b1;
			MAC_Reset2 = 1'b1;
			reg106_ld = 1'b0;
			reg96_ld = 1'b0;
			output_set = 1'b0;
			output_clr = 1'b0;
			//mux_select1 = 1'b0;
			//mux_select2 = 1'b0;
			mem_clr = 1'b0;
			
			case(pstate)		//****TODO ask about  demux1to12_16bit latch warning at always block
				S0: if (cf_load == 1'b1)
						begin
							nstate = S1; //next state
							demuxto12_sel = 4'b0000; //input number for demuxer
							reg96_ld = 1'b1; // registers are open
							mux_select1 = 4'b0000; // mux that has reg value is selected
						end
					else nstate = S0;
				S1: begin
							nstate = S2;
							demuxto12_sel = 3'b001;
							reg96_ld = 1'b1;
							mux_select1 = 4'b0001;
					end
				S2: begin
							nstate = S3;
							demuxto12_sel = 3'b010;
							reg96_ld = 1'b1;
							mux_select1 = 3'b010;
							
							MAC_Reset1 = 1'b0; //MAC releases first value for storage
							demux16bit_sel1 = 2'b00; //passes output MAC value to register 
							reg106_ld = 1'b1; //output register is open to store output data in mem
							final_mux_sel = 4'b0000; //mux sends value from register output to prog output pin
					end		
						
			
			endcase
		end
endmodule


//controller
//we will need to have a select line choose what is inputted into it
//we will also need to implement register to initally store thevalues
//states are not like cases.... they are more like well...states 