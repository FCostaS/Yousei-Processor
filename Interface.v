module Interface(Clock,DataIO,Swap,Type,MonitorReg,Halt,Output,Display1,Display2,Display3,Display4,Display5,Display6,Display7,Display8,indice);
	input Halt,Swap,Type,Clock;
	input [31:0] MonitorReg,Output,DataIO;
	output [6:0] Display1,Display2,Display3,Display4,Display5,Display6,Display7,Display8;
	output reg [4:0] indice;
	
	wire [3:0] reg01,reg02,reg03,reg04;
	wire [3:0] T1,T2,T3,T4;
	reg [31:0] TEMP;
	
	always@(posedge Clock)
	begin	
		
		// MUX //////////////////////
		if( Halt == 1'B0 )
		begin
			if(Type == 1'B0)
			begin
			TEMP = MonitorReg;
			end
				else
				begin
				TEMP = Output;
				end
		end
			else
			begin
				TEMP = DataIO; // Saída eh Input Data;
			end
	
		////////////////////////////		
	end
	
	always@(posedge Swap)
	begin
	
		indice = indice + 5'B00001;
		
		if( indice == 5'B01010 )
		begin
			indice = 5'B00000;
		end
		
	end
	
	Bin2BCD B2B1(TEMP,T1,T2,T3,T4);
	Bin2BCD B2B2( {{27'B0},indice}, reg01,reg02,reg03,reg04 );
	
	Display7Segmentos Disp1(T1,Display1);
	Display7Segmentos Disp2(T2,Display2);
	Display7Segmentos Disp3(T3,Display3);
	Display7Segmentos Disp4(T4,Display4);
	Display7Segmentos Disp5(reg01,Display5);
	Display7Segmentos Disp6(reg02,Display6);
	Display7Segmentos Disp7({{3'B0},Halt},Display7);
	Display7Segmentos Disp8({{3'B0},Type},Display8);
	
endmodule
