module ModuloIO(Clock,Reset,Switches,Set,HaltIAS,OpIO,Endereco,DadosSaida,Output,detector_out,DataIO);
	input OpIO,HaltIAS,Set,Clock,Reset;
	input [31:0] Endereco,DadosSaida;
	input [12:0] Switches;
	output wire [31:0] DataIO;
	output reg [31:0] Output;
	output reg detector_out;
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
	
	parameter  A=1'b0, B=1'b1;
			  
	reg current_state, next_state;

	always @(negedge Clock, negedge Reset)
	begin
	 if(Reset==1) 
		current_state <= A;
		 else
		 current_state <= next_state;
	end 

	
	always @(current_state,HaltIAS,Set)
	begin
	
	 case(current_state) 
		 A:begin
		  if(HaltIAS==0)
				next_state <= A;
		  else
			next_state <= B;
		 end
		 B:begin
		  if(Set==1)
			next_state <= B;
		  else
			next_state <= A;
		 end
		 default: next_state <= A;
	 endcase
	 
	end

	always @(current_state)
	begin 
	 case(current_state) 
		 A:  detector_out <= 0;
		 B:  detector_out <= 1;
	 endcase
	end
	
	
endmodule
