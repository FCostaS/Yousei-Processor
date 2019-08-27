module ModuloIO(Clock,Switches,Set,HaltIAS,OpIO,Endereco,DadosSaida,Output,RegTemp,DataIO);
	input OpIO,HaltIAS,Set,Clock;
	input [31:0] Endereco,DadosSaida;
	input [12:0] Switches;
	
	// Data for Output
	output wire [31:0] DataIO;
	output reg [31:0] Output;
	
	// State Machine for IO
	output reg RegTemp;
	parameter  A=1'b0, B=1'b1;
	reg current_state, next_state;
	wire Input;
	//wire SetDebounce;
	
	assign DataIO = {{19{1'B0}},Switches};
	assign Input = OpIO && HaltIAS;

	always@(posedge Clock)
	begin
		if(OpIO == 1'B1)
		begin
			if(HaltIAS == 1'B0)
			begin
				Output <= DadosSaida;
			end
		end
	end

	/*always@(negedge Clock)
	begin
	
		if( Input ) // Eh IO e quero Halt
		begin
			
			if(~RegTemp)
			begin
				RegTemp = 1'B1;
			end
			
			if(~Set)
			begin
				RegTemp = 1'B0;
			end
		
		end
		
	end*/

	always @(negedge Clock)
	begin
		current_state <= next_state;
	end 

	
	always @(current_state,Input,Set)
	begin
	
	 case(current_state)
		 A:
		 begin
		  if(Input)
				next_state <= B;
		  else
				next_state <= A;
		 end
		 
		 B:
		 begin
		  if(Set)
			next_state <= A;
		  else
			next_state <= B;
		 end
		 
	 endcase
	 
	end

	always @(current_state)
	begin 
	 case(current_state) 
		 A:  RegTemp <= 0;
		 B:  RegTemp <= 1;
	 endcase
	end
	
	
endmodule
