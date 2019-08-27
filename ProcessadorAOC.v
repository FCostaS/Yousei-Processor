module ProcessadorAOC(Clock50M,Reset,Type,Set,Swap,Switches,Display1,Display2,Display3,
Display4,Display5,Display6,Display7,Display8,Output);
	input Clock50M,Reset,Set,Swap,Type;
	input [12:0] Switches;

	wire[31:0] Resultado,ImediatoExtendido,Offset,DataIO,ReadData,ResultadoSoma,OutADD,
	InputPC,Saida_Dados_2,Endereco,Instrucao,M2R,Dados_1,Dados_2,MonitorReg;
	wire Zero;
	wire[4:0] WR,indice;
	wire SetDebounce;
	
	// Variáveis Unidade de Controle
	wire RegWrite,OpIO,BlockSystem,HaltIAS,TypeJR,Clock;
	wire [1:0] Mem2Reg;
	wire [5:0] OpALU;
	wire MemRead,MemWrite,AluSrc,RegDst,Desvio;
	
	// Variaveis Dispositivos
	output wire [6:0] Display1,Display2,Display3,Display4,Display5,Display6,Display7,Display8;
	output wire [31:0] Output;
	ProgramCounter PC(InputPC,Endereco,Clock,Reset,BlockSystem);  											// Contador do Programa 
	MemoriaInstrucoes MI(Endereco,Clock,Instrucao);		 												// Memória de Instruções
	ADD_Offset AO(Endereco,32'B00000000000000000000000000000001,OutADD);							// ADD com Offset
	MUX_Mem2Reg MM2R(Instrucao[20:16],Instrucao[15:11],RegDst,WR);									// MUX Memória de Instruções p/ Registradoress
	Registradores Reg(indice,Instrucao[25:21],Instrucao[20:16],
							WR,M2R,RegWrite,Dados_1,Dados_2,Clock,MonitorReg);	 						// Banco de Registradores
	MUX_Reg2ALU MR2A(Dados_2,ImediatoExtendido,AluSrc,Saida_Dados_2); 							// MUX do AluSrc
	ExtensorDeSinal ES(Instrucao[15:0],ImediatoExtendido);											// Extensor de Sina																					
	ADD A(TypeJR,Dados_1,ImediatoExtendido,ResultadoSoma);						 								// ADD do Deslocador de Bits
	ULA ULA(Dados_1,Saida_Dados_2,Instrucao[31:26],Instrucao[5:0],OpALU,Zero,Resultado);	// Unidade Lógica e Aritmética
	MemoriaDados MD(Resultado,Dados_2,MemRead,MemWrite,ReadData,Clock);
	Mux_PCSrc MPCS(Zero,Desvio,ResultadoSoma,OutADD,InputPC);										// MUX para PCSrc
	Mux_4 Mux_4(ReadData,DataIO,Resultado,Mem2Reg,M2R);												// MUX Memory/ModuloIO/ULAResult																												//
	UnidadedeControle UC(Instrucao[31:26],OpIO,OpALU,MemRead,MemWrite,RegWrite
								,AluSrc,RegDst,Desvio,Mem2Reg,HaltIAS,TypeJR);
	ModuloIO ModuloIO(Clock,Switches,SetDebounce,HaltIAS,OpIO,ImediatoExtendido,Dados_1,Output,BlockSystem,DataIO); // Modulo I/O										 		 // Extensor de Sina																					
	Interface TEC(Clock,DataIO,Swap,Type,MonitorReg,BlockSystem,Output,Display1,Display2,Display3,Display4,
	Display5,Display6,Display7,Display8,indice); 														 // Interface de Comunicacao
	Temporizador TEMP2S(Clock50M,Clock);
	DeBounce DB(Clock50M,0,~Set,SetDebounce);
endmodule
