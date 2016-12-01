module controller (clk, reset, cf_load, mux_select1, mux_select2, output_set, output_clr, mem_clr);

	input clk, reset, cf_load;
	output mux_select1, mux_select2, output_set, output_clr, mem_clr;
	
	reg output_set, output_clr, mem_clr;
	
	reg [2:0] mux_select1;
	reg [2:0] mux_select2; 
	reg [3:0] pstate,nstate;
	
	parameter S0=4'b0000, S1=4'b0001,S2=4'b0010,S3=4'b0011, S4=4'b0100,S5=4'b0101,S6=4'b0110, S7=4'b0111,S8=4'b1000,
		S9=4'b1001, S10=4'b1010,S11=4'b1011,S12=4'b1100;
		
	always @ (posedge clk or posedge reset)
		begin
			if (reset == 1'b1) pstate <= S0;
			else pstate <= nstate;
		end
		
	always @ (posedge clk or posedge reset)
		begin
			output_set = 1'b0;
			output_clr = 1'b0;
			mux_select1 = 1'b0;
			mux_select2 = 1'b0;
			mem_clr = 1'b0;
			
			case(pstate)
				S0: if (cf_load == 1'b1)
						begin
							nstate = S1;
							output_set = 1'b0;
						end
					else nstate = S0;
						
			
			endcase
		end
endmodule


//controller
//we will need to have a select line choose what is inputted into it
//we will also need to implement register to initally store thevalues
//states are not like cases.... they are more like well...states 