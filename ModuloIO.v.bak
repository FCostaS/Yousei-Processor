module ModuloIO(Clock,Reset,Switches,Set,HaltIAS,OpIO,Endereco,DadosSaida,Output,RegTemp,DataIO);
	input OpIO,HaltIAS,Set,Clock,Reset;
	input [31:0] Endereco,DadosSaida;
	input [12:0] Switches;
	output wire [31:0] DataIO;
	output reg [31:0] Output;
	output reg RegTemp;
	reg [31:0] Data[1:0];
	reg INPUT;
	wire ResetCorrection;
	
	reg [1:0] state;

	assign DataIO = {{19{1'B0}},Switches};
	//assign INPUT = (OpIO && HaltIAS);
	
	assign ResetCorrection = ~Reset;

	always@(posedge Clock)
	begin
		if(OpIO == 1'B1)
		begin
			if(~HaltIAS)
			begin
				Data[Endereco] = DadosSaida;
				Output = Data[Endereco];
			end

		end
	end
	
	always @( posedge Clock, posedge ResetCorrection )
   begin
		INPUT = OpIO && HaltIAS;
		if( ResetCorrection )
			 state <= 1'b0;
		else
		begin
			case( state )
			1'b0: // A
			begin
				 if(INPUT == 1'B0 && Set == 1'B0)
				 begin
					state <= 1'B0;
				 end
				 else if (INPUT == 1'B0 && Set == 1'B1)
				 begin
					state <= 1'B0 ;
				 end
				 else if (INPUT == 1'B1 && Set == 1'B0)
				 begin
					state <= 1'B1;
				 end
				 else
				 begin
					state <= 1'B1;
				 end
			end

			1'b1: // B
			begin
				if(INPUT == 1'B0 && Set == 1'B0)
				begin
					state <= 1'B0;
				end
				else if (INPUT == 1'B0 && Set == 1'B1)
				begin
					state <= 1'B1;
				end
				else if (INPUT == 1'B1 && Set == 1'B0)
				begin
					state <= 1'B0;
				end
				else
				begin
					state <= 1'B1;
				end
			end
		   endcase
		end
	end
	
	always @( posedge Clock, posedge ResetCorrection )
	begin
		if( ResetCorrection )
		begin
			RegTemp <= 0;
		end
			else if( state == 1'b0 )
			begin
				RegTemp <= 0;
			end
				else
				begin
					RegTemp <= 1;
				end
	end
	
	
endmodule
