module controller (clk, reset, cf_load, mux_select1, mux_select2, mux_select3, output_set, output_clr, mem_clr,
					demuxto12_sel, reg96_ld, reg106_ld, demux16bit_sel1, demux16bit_sel2, final_mux_sel,
						MAC_Reset1, MAC_Reset2);

	input clk, reset, cf_load;
	output output_set, output_clr, mem_clr,reg96_ld;
	output reg106_ld, MAC_Reset1, MAC_Reset2;
	
	
	output [2:0] demux16bit_sel1;
	output [2:0] demux16bit_sel2;
	output [3:0] mux_select1, mux_select2, mux_select3; 
	output [3:0] demuxto12_sel, final_mux_sel;
	
	reg output_set, output_clr, mem_clr, reg96_ld, reg106_ld, MAC_Reset1, MAC_Reset2;
	reg [2:0] demux16bit_sel1;
	reg [2:0] demux16bit_sel2;
	reg [3:0] mux_select1, mux_select2, mux_select3; 
	reg [3:0] demuxto12_sel, final_mux_sel;
	reg [4:0] pstate, nstate;
	parameter S0=5'b00000, S1=5'b00001, S2=5'b00010, S3=5'b00011, S4=5'b00100,S5=5'b00101,S6=5'b00110, S7=5'b00111,S8=5'b01000,
		S9=5'b01001, S10=5'b01010, S11=5'b01011, S12=5'b01100, S13 = 5'b01101, S14 = 5'b01110, S15 = 5'b01111, S16 = 5'b10000,
			S17 = 5'b10001, S18 = 5'b10010, S19 = 5'b10011, S20 = 5'b10100, S21 = 5'b10101, S22 = 5'b10110, S23 = 5'b10111, S24 = 5'b11000,
				S25 = 5'b11001, S26 = 5'b11010, S27 = 5'b11011, S28 = 5'b11100, S29 = 5'b11101, S30 = 5'b11110, S31 = 5'b11111;
		
	always @ (negedge clk or posedge reset)
		begin
			if (reset == 1'b1) 
			begin
				pstate <= S0;
			end
			else pstate <= nstate;
		end
		
	always @ (pstate)
		begin
			reg
			//demuxto12_sel
			
			//MAC_Reset1 = 1'b1;
			//MAC_Reset2 = 1'b1;
			//reg106_ld = 1'b0;
			//reg96_ld = 1'b0;

			//mux_select1 = 1'b0;
			//mux_select2 = 1'b0;
			mem_clr = 1'b0;
			
			case(pstate)		//****TODO ask about  demux1to12_16bit latch warning at always block
				S0:
					if (cf_load == 1'b1)
						begin
							output_set = 1'b0;
							MAC_Reset1 = 1'b0;
							MAC_Reset2 = 1'b0;
							nstate = S1; //next state
							demuxto12_sel=4'b1111;
							mux_select1=4'b1111;
							mux_select2=4'b1111;
							mux_select3=4'b1111;
							demux16bit_sel1 = 3'b111;
							demux16bit_sel2 = 3'b111;
							final_mux_sel = 4'b1011;		
							 //input number for demuxer
							reg96_ld = 1'b1; // registers are open
							reg106_ld = 1'b0;
							//mux_select1 = 4'b0001; // mux that has reg value is selected
						end
					else
						begin
							nstate = S0;
							reg96_ld = 1'b0;
							final_mux_sel = 4'b1011;
							demuxto12_sel=4'b1111;
							mux_select1=4'b1111;
							mux_select2=4'b1111;
							mux_select3=4'b1111;
							demux16bit_sel1 = 3'b111;
							demux16bit_sel2 = 3'b111;
							MAC_Reset1 = 1'b1;
							MAC_Reset2 = 1'b1;
							output_set = 1'b0;
						end
				
				S1:begin
					nstate = S2;
					demuxto12_sel=4'b0000;
					reg96_ld = 1'b1;
					output_set = 1'b0;				
				end	

				S2:begin
					nstate = S3;
					MAC_Reset1 = 1'b0;
					MAC_Reset2 = 1'b0;
					demuxto12_sel=4'b0001;
					mux_select1 = 4'b0000;
					reg96_ld = 1'b1;
					output_set = 1'b0;				
				end	

				S3:begin
					nstate = S4;
					demuxto12_sel=4'b0010;
					mux_select1 = 4'b0001;
					reg96_ld = 1'b1;
					output_set = 1'b0;			
					
				end	

				S4:begin
	
					nstate = S5;
					demuxto12_sel=4'b0011;
					mux_select1 = 4'b0010;
					reg96_ld = 1'b1;
					mux_select2 = 4'b1111;
					MAC_Reset1 = 1'b1;
					output_set = 1'b0;				

				end	

				S5:begin
					// need another line
					nstate = S6;
					demuxto12_sel=4'b0100;
					mux_select1 = 4'b0011;
					reg96_ld = 1'b1;
					MAC_Reset1 = 1'b0;

					mux_select2 = 4'b0000;
					mux_select3 = 4'b0011;
					
					demux16bit_sel1 = 3'b000;
					output_set = 1'b0;					

				end	

				S6:begin
						
					nstate = S7;
					demuxto12_sel=4'b0101;
					mux_select1 = 4'b0100;
					reg96_ld = 1'b1;
					MAC_Reset1 = 1'b0;
						
					reg106_ld = 1'b1;
					mux_select2 = 4'b0100;
					mux_select3 = 4'b0001;
					output_set = 1'b0;					
					demux16bit_sel1 = 3'b111;
				end	
			
				S7:begin
					nstate = S8;
					demuxto12_sel=4'b0110;
					mux_select1 = 4'b0101;
					reg96_ld = 1'b1;
					MAC_Reset1 = 1'b1;	
	
					mux_select2 = 4'b0010;
					mux_select3 = 4'b0101;
					MAC_Reset2 = 1'b1;
					output_set = 1'b0;					

				end	
				
				S8:begin
					nstate = S9;
					demuxto12_sel=4'b0111;
					mux_select1 = 4'b0110;
					reg96_ld = 1'b1;
					MAC_Reset1 = 1'b0;
					MAC_Reset2 = 1'b0;			

					mux_select2 = 4'b0000;//1
					mux_select3 = 4'b0110;//7
					output_set = 1'b0;					
					demux16bit_sel1 = 3'b001;
					demux16bit_sel2 = 3'b000;
				end
			
					
				S9:begin
					nstate = S10;
					demuxto12_sel=4'b1000;
					mux_select1 = 4'b0111;
					reg96_ld = 1'b1;
					output_set = 1'b0;					
					mux_select2 = 4'b0001;//2
					mux_select3 = 4'b0111;//8
					demux16bit_sel1 = 3'b111;
					demux16bit_sel2 = 3'b111;
				end	
				S10:begin
					nstate = S11;
					demuxto12_sel=4'b1001;
					mux_select1 = 4'b1000;
					reg96_ld = 1'b1;
					MAC_Reset1 = 1'b1;
					
					mux_select2 = 4'b0010;//3
					mux_select3 = 4'b1000;//9	
					MAC_Reset2 = 1'b1;
					
					output_set = 1'b0;
				end	
				S11:begin
					nstate = S12;
					demuxto12_sel=4'b1010;
					mux_select1 = 4'b1001;
					reg96_ld = 1'b1;
					MAC_Reset1 = 1'b0;
					output_set = 1'b0;					
					mux_select2 = 4'b1001;//10
					mux_select3 = 4'b0000;//1					
					MAC_Reset2 = 1'b0;
					
					demux16bit_sel1 = 3'b010;
					demux16bit_sel2 = 3'b001;
				end	

				S12:begin
					nstate = S13;   
					demuxto12_sel=4'b1011;
					mux_select1 = 4'b1010;
					output_set = 1'b0;
					reg96_ld = 1'b1;
					MAC_Reset1 = 1'b0;
					
					mux_select2 = 4'b1010;//11
					mux_select3 = 4'b0001;//2
					
					demux16bit_sel1 = 3'b111;
					demux16bit_sel2 = 3'b111;	
				end	
				S13:begin
					nstate = S14;
					demuxto12_sel=4'b1111;
					mux_select1 = 4'b1011;
					MAC_Reset1 = 1'b1;
					reg96_ld = 1'b0;
					
					mux_select2 = 4'b1011;//12
					mux_select3 = 4'b0010;//3	
					MAC_Reset2 = 1'b1;
					
					final_mux_sel = 4'b1001;
					
					output_set = 1'b1;
				end	


				S14:begin
					nstate = S15;
					output_set = 1'b1;
					demuxto12_sel=4'b1111;
					mux_select1=4'b1111;
					MAC_Reset1 = 1'b0;
						
					mux_select2 = 4'b0110;//7
					mux_select3 = 4'b0011;//4						
					MAC_Reset2 = 1'b0;	
					
					demux16bit_sel1 = 3'b011;
					demux16bit_sel2 = 3'b010;
					
					final_mux_sel = 4'b0101;	
				end


				S15:begin
					nstate = S16;
					output_set = 1'b1;
					demuxto12_sel=4'b1111;
					mux_select1=4'b1111;
					demux16bit_sel1 = 3'b111;
					mux_select2 = 4'b0111;//8
					mux_select3 = 4'b0100;//5					
					
					demux16bit_sel1 = 3'b111;
					demux16bit_sel2 = 3'b111;
					final_mux_sel = 4'b0100;
				end
				S16:begin
					nstate = S17;
					mux_select1=4'b1111;
					MAC_Reset1 = 1'b1;	
					output_set = 1'b1;			
					mux_select2 = 4'b0101;//6
					mux_select3 = 4'b1000;//9
					MAC_Reset2 = 1'b1;	
					final_mux_sel = 4'b0011;					
				end
				S17:begin
					nstate = S18;
					mux_select1=4'b1111;
					demuxto12_sel=4'b1111;///////
								
					mux_select2 = 4'b1001;//10
					mux_select3 = 4'b0011;//4
					MAC_Reset2 = 1'b0;	
					
					demux16bit_sel2 = 3'b011;	
					output_set = 1'b1;
					final_mux_sel = 4'b0101;				
				end
				S18:begin
					nstate = S19;
					mux_select1=4'b1111;
								
					mux_select2 = 4'b1010;//11
					mux_select3 = 4'b0100;//5
					demux16bit_sel2 = 3'b111;
					output_set = 1'b1;
					final_mux_sel = 4'b1000;	
				end
				S19:begin
					nstate = S20;
					mux_select1=4'b1111;
					output_set = 1'b1;			
					mux_select2 = 4'b0101;//6
					mux_select3 = 4'b1011;//12
					MAC_Reset2 = 1'b1;	
					
					final_mux_sel = 4'b0010;	
				
				end
				S20:begin
					nstate = S21;
					mux_select1=4'b1111;
								
					mux_select2 = 4'b1001;//10
					mux_select3 = 4'b0110;//7
					MAC_Reset2 = 1'b0;	
					output_set = 1'b1;
					demux16bit_sel2 = 3'b100;
					
					final_mux_sel = 4'b1010;	//167	
					
					MAC_Reset1 = 1'b0;					
					//stage 2
					demuxto12_sel=4'b0000;			
				end
				S21:begin
					nstate = S22;
					output_set = 1'b1;
								
					mux_select2 = 4'b0111;//8
					mux_select3 = 4'b1010;//11
					
					demux16bit_sel2 = 3'b111;
					
					final_mux_sel = 4'b0100;
					
					//stage 2
					demuxto12_sel=4'b0001;	
					mux_select1 = 4'b0000;
				end
				S22:begin
					nstate = S23;
					output_set = 1'b1;
								
					mux_select2 = 4'b1011;//12
					mux_select3 = 4'b1000;//9
					MAC_Reset2 = 1'b1;
					final_mux_sel = 4'b0010;//
					//stage 2
					demuxto12_sel=4'b0010;
					mux_select1 = 4'b0001;
							
				end
				S23:begin
					nstate = S24;
					output_set = 1'b1;
					mux_select2 = 4'b1111;//
					mux_select3 = 4'b1111;//	////////////////	
					MAC_Reset2 = 1'b0;	
					demux16bit_sel2 = 3'b101;
					
					final_mux_sel = 4'b0111;//0111
					
					//stage 2

					MAC_Reset1 = 1'b1;
					demuxto12_sel=4'b0011;
					mux_select1 = 4'b0010;
					
				end
				S24:begin
					nstate = S25;
					output_set = 1'b1;
					demux16bit_sel2 = 3'b111;
					
					final_mux_sel = 4'b0000;
					
					
					//stage2

					MAC_Reset1 = 1'b0;	
					demuxto12_sel=4'b0100;


					mux_select1 = 4'b0011;	
					
					mux_select2 = 4'b0000;
					mux_select3 = 4'b0011;
					
					demux16bit_sel1 = 3'b000;

	
				end
				
				S25:begin
					nstate = S26;
					output_set = 1'b1;
					demux16bit_sel2 = 3'b111;
					
					final_mux_sel = 4'b0011;	
					
					
					//stage 2	

					demuxto12_sel=4'b0101;
					mux_select1 = 4'b0100;

					mux_select2 = 4'b0100;
					mux_select3 = 4'b0001;


								
				end				
				S26:begin
					nstate = S27;

					output_set = 1'b1;
					
					final_mux_sel = 4'b0001;
					
					//stage 2

					demuxto12_sel=4'b0110;
					mux_select1 = 4'b0101;
					reg96_ld = 1'b1;
					MAC_Reset1 = 1'b1;	
	
					mux_select2 = 4'b0010;
					mux_select3 = 4'b0101;
					MAC_Reset2 = 1'b1;
			
				end				
				//after this start dout
				S27:begin
					nstate = S28;
					output_set = 1'b1;

					final_mux_sel = 4'b0000;	
					//stage 2

					demuxto12_sel=4'b0111;
					mux_select1 = 4'b0110;

					MAC_Reset1 = 1'b0;
					MAC_Reset2 = 1'b0;			

					mux_select2 = 4'b0000;//1
					mux_select3 = 4'b0110;//7
					
					demux16bit_sel1 = 3'b001;
					demux16bit_sel2 = 3'b000;
		
				end
				S28:begin
					nstate = S29;
					output_set = 1'b1;
					demux16bit_sel2 = 3'b111;
					
					final_mux_sel = 4'b0110;
					
					//state 2
					demuxto12_sel=4'b0110;
					demuxto12_sel=4'b1000;
					mux_select1 = 4'b0111;
					reg96_ld = 1'b1;
					
					mux_select2 = 4'b0001;//2
					mux_select3 = 4'b0111;//8
					demux16bit_sel1 = 3'b111;
					demux16bit_sel2 = 3'b111;			
				end	
				S29:begin
					nstate = S30;
					demuxto12_sel=4'b1001;
					mux_select1 = 4'b1000;
					reg96_ld = 1'b1;
					MAC_Reset1 = 1'b1;
					
					mux_select2 = 4'b0010;//3
					mux_select3 = 4'b1000;//9	
					MAC_Reset2 = 1'b1;
					output_set = 1'b0;					
					final_mux_sel = 4'b1011;
				end	
				S30:begin
					nstate = S12;
					demuxto12_sel=4'b1010;
					mux_select1 = 4'b1001;
					reg96_ld = 1'b1;
					MAC_Reset1 = 1'b0;
					
					mux_select2 = 4'b1001;//10
					mux_select3 = 4'b0000;//1					
					MAC_Reset2 = 1'b0;
					
					demux16bit_sel1 = 3'b010;
					demux16bit_sel2 = 3'b001;
					output_set = 1'b0;
				end			
			endcase
		end
endmodule


//controller
//we will need to have a select line choose what is inputted into it
//we will also need to implement register to initally store thevalues
//states are not like cases.... they are more like well...states 