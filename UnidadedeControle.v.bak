module UnidadedeControle(Opcode,OpIO,OpALU,MemRead,MemWrite,RegWrite,AluSrc,RegDst,Desvio,Mem2Reg,Halt);

	input [5:0] Opcode;
	output reg OpIO,MemRead,MemWrite,RegWrite,AluSrc,RegDst,Desvio,Halt;
	output reg[5:0] OpALU;
	output reg[1:0] Mem2Reg;

	always@(Opcode)
	begin
		Halt = 1'B0;
		case(Opcode)
			6'B000000: // ARITMETICAS
			begin
			OpIO 		= 1'B0;
			RegDst 	= 1'B1;
			RegWrite = 1'B1;
			AluSrc 	= 1'B0;
			Mem2Reg 	= 2'B10;
			MemRead 	= 1'B0;
			MemWrite = 1'B0;
			Desvio 	= 1'B0;
			OpALU 	= 6'B000000;
			end
			
			6'B000001: // LOGICAS
			begin
			OpIO 		= 1'B0;
			RegDst 	= 1'B1;
			RegWrite = 1'B1;
			AluSrc 	= 1'B0;
			Mem2Reg 	= 2'B10;
			MemRead 	= 1'B0;
			MemWrite = 1'B0;
			Desvio 	= 1'B0;
			OpALU 	= 6'B000000;
			end
			
			6'B000010: // ADDI
			begin
			OpIO 		= 1'B0;
			RegDst 	= 1'B0;
			RegWrite = 1'B1;
			AluSrc 	= 1'B1;
			Mem2Reg 	= 2'B10;
			MemRead 	= 1'B0;
			MemWrite = 1'B0;
			Desvio 	= 1'B0;
			OpALU 	= 6'B000000;			
			end
			
			6'B000011: // MOVE
			begin
			OpIO 		= 1'B0;
			RegDst 	= 1'B0;
			RegWrite = 1'B1;
			AluSrc 	= 1'B1;
			Mem2Reg 	= 2'B10;
			MemRead 	= 1'B0;
			MemWrite = 1'B0;
			Desvio 	= 1'B0;
			OpALU 	= 6'B000000;			
			end
			
			6'B000100: // SLT
			begin
			OpIO 		= 1'B0;
			RegDst 	= 1'B1;
			RegWrite = 1'B1;
			AluSrc 	= 1'B0;
			Mem2Reg 	= 2'B10;
			MemRead 	= 1'B0;
			MemWrite = 1'B0;
			Desvio 	= 1'B0;
			OpALU 	= 6'B000000;			
			end
			
			6'B000101: // Jump
			begin
			OpIO 		= 1'B0;
			RegDst 	= 1'B1;
			RegWrite = 1'B0;
			AluSrc 	= 1'B1;
			Mem2Reg 	= 2'B10;
			MemRead 	= 1'B0;
			MemWrite = 1'B0;
			Desvio 	= 1'B1;
			OpALU 	= 6'B000000;			
			end

			6'B000110: // Load
			begin
			OpIO 		= 1'B0;
			RegDst 	= 1'B0;
			RegWrite = 1'B1;
			AluSrc 	= 1'B1;
			Mem2Reg 	= 2'B00;
			MemRead 	= 1'B1;
			MemWrite = 1'B0;
			Desvio 	= 1'B0;
			OpALU 	= 6'B000000;			
			end
			
			6'B000111: // Store
			begin
			OpIO 		= 1'B0;
			RegDst 	= 1'B0;
			RegWrite = 1'B0;
			AluSrc 	= 1'B1;
			Mem2Reg 	= 2'B10;
			MemRead 	= 1'B0;
			MemWrite = 1'B1;
			Desvio 	= 1'B0;
			OpALU 	= 6'B000000;			
			end
			
			6'B001000: // IN
			begin
			Halt     = 1'B1;
			OpIO 		= 1'B1;
			RegDst	= 1'B0;
			RegWrite = 1'B1;
			AluSrc 	= 1'B1;
			Mem2Reg 	= 2'B01;
			MemRead 	= 1'B0;
			MemWrite = 1'B0;
			Desvio 	= 1'B0;
			OpALU 	= 6'B000000;		
			end	
	
			6'B001001: // OUT
			begin
			OpIO 		= 1'B1;
			RegDst 	= 1'B0;
			RegWrite = 1'B0;
			AluSrc 	= 1'B1;
			Mem2Reg 	= 2'B01;
			MemRead 	= 1'B0;
			MemWrite = 1'B0;
			Desvio 	= 1'B0;
			OpALU 	= 6'B000000;		
			end
			
			
			6'B001010: // BEQ
			begin
			OpIO 		= 1'B0;
			RegDst 	= 1'B0;
			RegWrite = 1'B0;
			AluSrc 	= 1'B0;
			Mem2Reg 	= 2'B10;
			MemRead 	= 1'B0;
			MemWrite = 1'B0;
			Desvio 	= 1'B1;
			OpALU 	= 6'B000000;			
			end
			
			6'B001011: // BNE
			begin
			OpIO 		= 1'B0;
			RegDst 	= 1'B0;
			RegWrite = 1'B0;
			AluSrc 	= 1'B0;
			Mem2Reg 	= 2'B10;
			MemRead 	= 1'B0;
			MemWrite = 1'B0;
			Desvio 	= 1'B1;
			OpALU 	= 6'B000000;
			end
			
			default: // Not operation
			begin
			OpIO 		= 1'B0;
			RegDst 	= 1'B0;
			RegWrite = 1'B0;
			AluSrc 	= 1'B0;
			Mem2Reg 	= 2'B10;
			MemRead 	= 1'B0;
			MemWrite = 1'B0;
			Desvio 	= 1'B0;
			OpALU 	= 6'B000000;
			end
		endcase
	end

endmodule
