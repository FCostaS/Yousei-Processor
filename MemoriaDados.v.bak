module MemoriaDados(Resultado,DadosEscrita,MemRead,MemWrite,ReadData,Clock);
	input  [31:0] Resultado,DadosEscrita;
	input MemRead,MemWrite,Clock;
	output reg [31:0] ReadData;
	integer F = 0;
	
	reg[31:0] Memoria[21:0];
	
	always@(negedge Clock)
	begin

		// Gravando na Memoria	
		if(F == 0)
		begin
		Memoria[0] = 32'b00000000000000000000000000000111;
		Memoria[1] = 32'b00000000000000000000000001000001;
		Memoria[2] = 32'b00000000000000000000000001010001;
		Memoria[3] = 32'b00000000000000000000000001001001;
		F <= 1;
		end
		//////////////////////
	
		if(MemWrite==1'B1)
		begin
			Memoria[Resultado] = DadosEscrita;
		end
		if(MemRead==1'B1)
		begin
			ReadData = Memoria[Resultado];
		end
	end
	
endmodule
