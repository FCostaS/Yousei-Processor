module ModuloIO(Clock,Switches,Set,HaltIAS,OpIO,Endereco,DadosSaida,Output,RegTemp,DataIO);
	input OpIO,HaltIAS,Set,Clock;
	input [31:0] Endereco,DadosSaida;
	input [12:0] Switches;
	output wire [31:0] DataIO;
	output reg [31:0] Output;
	output reg RegTemp;
	reg [31:0] Data[1:0];
	
	assign DataIO = {{19{1'B0}},Switches};
	
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
	
	always@(negedge Clock)
	begin
	
		if( OpIO && HaltIAS ) // Eh IO e quero Halt
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
		
	end
	
	
endmodule
