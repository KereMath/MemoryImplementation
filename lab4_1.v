`timescale 1ns / 1ps
module lab4ROM (input [3:0] romAddr, output reg[4:0] romOutput);

always@(*) begin
if(romAddr==4'b0000) begin
	romOutput=5'b00000;
 end
 else if(romAddr==4'b0001) begin
	romOutput=5'b00001;
 end
 
 else if(romAddr==4'b0010) begin
	romOutput=5'b00110;
 end
 else if(romAddr==4'b0011) begin
	romOutput=5'b00111;
 end
 else if(romAddr==4'b0100) begin
	romOutput=5'b01011;
 end
 else if(romAddr==4'b0101) begin
	romOutput=5'b01100;
 end
 else if(romAddr==4'b0110) begin
	romOutput=5'b01101;
 end
 else if(romAddr==4'b0111) begin
	romOutput=5'b01110;
 end
 else if(romAddr==4'b1000) begin
	romOutput=5'b11101;
 end
 else if(romAddr==4'b1001) begin
	romOutput=5'b11110;
 end
 else if(romAddr==4'b1010) begin
	romOutput=5'b11111;
 end
 else if(romAddr==4'b1011) begin
	romOutput=5'b10000;
 end
 else if(romAddr==4'b1100) begin
	romOutput=5'b10111;
 end
 else if(romAddr==4'b1101) begin
	romOutput=5'b11000;
 end
 else if(romAddr==4'b1110) begin
	romOutput=5'b11001;
 end
 else begin
    romOutput=5'b11010;
 end
 end


endmodule
																							
module lab4RAM (
	input ramMode, //0:read, 1:write
	input [3:0] ramAddr, 
	input [4:0] ramInput,
	input  ramOp, //0:polynomial, 1:derivative
	input [1:0] ramArg,  //00:+1, 01:+2, 10:-1, 11:-2
	input CLK, 
	output reg [8:0] ramOutput);

/*Write your code here*/
integer i;
integer x;
integer result;
reg [9:0] ram [0:16];
initial begin
        for (i = 0; i < 16; i=i+1) ram[i] = 0;
    end
always@(posedge CLK) 
if(ramMode==1) begin 

if(ramArg==2'b00) begin
    x=1;
end
else if(ramArg==2'b01) begin
    x=2;
end
else if(ramArg==2'b10) begin
    x=-1;
end
else begin
    x=-2;
end
/* writing polynomes*/

if (ramInput==5'b00000) begin
    if (ramOp==0) begin
    result=x*x*x*x+x*x*x+x*x+x+1;
    end
    else begin
    result=4*x*x*x+3*x*x+2*x+1;
    end
end
else if (ramInput==5'b00001) begin
    if (ramOp==0) begin
    result=x*x*x*x+x*x*x+x*x+x-1;
    end
    else begin
    result=4*x*x*x+3*x*x+2*x+1;
    end
end
else if (ramInput==5'b00010) begin
    if (ramOp==0) begin
    result=x*x*x*x+x*x*x+x*x-x+1;
    end
    else begin
    result=4*x*x*x+3*x*x+2*x-1;
    end
end
else if (ramInput==5'b00011) begin
    if (ramOp==0) begin
    result=x*x*x*x+x*x*x+x*x-x-1;
    end
    else begin
    result=4*x*x*x+3*x*x+2*x-1;
    end
end
else if (ramInput==5'b00100) begin
    if (ramOp==0) begin
    result=x*x*x*x+x*x*x-x*x+x+1;
    end
    else begin
    result=4*x*x*x+3*x*x-2*x+1;
    end
end
else if (ramInput==5'b00101) begin
    if (ramOp==0) begin
    result=x*x*x*x+x*x*x-x*x+x-1;
    end
    else begin
    result=4*x*x*x+3*x*x-2*x+1;
    end
end
else if (ramInput==5'b00110) begin
    if (ramOp==0) begin
    result=x*x*x*x+x*x*x-x*x-x+1;
    end
    else begin
    result=4*x*x*x+3*x*x-2*x-1;
    end
end
else if (ramInput==5'b00111) begin
    if (ramOp==0) begin
    result=x*x*x*x+x*x*x-x*x-x-1;
    end
    else begin
    result=4*x*x*x+3*x*x-2*x-1;
    end
end
else if (ramInput==5'b01000) begin
    if (ramOp==0) begin
    result=x*x*x*x-x*x*x+x*x+x+1;
    end
    else begin
    result=4*x*x*x-3*x*x+2*x+1;
    end
end

else if (ramInput==5'b01001) begin
    if (ramOp==0) begin
    result=x*x*x*x-x*x*x+x*x+x-1;
    end
    else begin
    result=4*x*x*x-3*x*x+2*x+1;
    end
end
else if (ramInput==5'b01010) begin
    if (ramOp==0) begin
    result=x*x*x*x-x*x*x+x*x-x+1;
    end
    else begin
    result=4*x*x*x-3*x*x+2*x-1;
    end
end
else if (ramInput==5'b01011) begin
    if (ramOp==0) begin
    result=x*x*x*x-x*x*x+x*x-x-1;
    end
    else begin
    result=4*x*x*x-3*x*x+2*x-1;
    end
end
else if (ramInput==5'b01100) begin
    if (ramOp==0) begin
    result=x*x*x*x-x*x*x-x*x+x+1;
    end
    else begin
    result=4*x*x*x-3*x*x-2*x+1;
    end
end
else if (ramInput==5'b01101) begin
    if (ramOp==0) begin
    result=x*x*x*x-x*x*x-x*x+x-1;
    end
    else begin
    result=4*x*x*x-3*x*x-2*x+1;
    end
end
else if (ramInput==5'b01110) begin
    if (ramOp==0) begin
    result=x*x*x*x-x*x*x-x*x-x+1;
    end
    else begin
    result=4*x*x*x-3*x*x-2*x-1;
    end
end
else if (ramInput==5'b01111) begin
    if (ramOp==0) begin
    result=x*x*x*x-x*x*x-x*x-x-1;
    end
    else begin
    result=4*x*x*x-3*x*x-2*x-1;
    end
end
else if (ramInput==5'b10000) begin
    if (ramOp==0) begin
    result=-x*x*x*x+x*x*x+x*x+x+1;
    end
    else begin
    result=-4*x*x*x+3*x*x+2*x+1;
    end
end
else if (ramInput==5'b10001) begin
    if (ramOp==0) begin
    result=-x*x*x*x+x*x*x+x*x+x-1;
    end
    else begin
    result=-4*x*x*x+3*x*x+2*x+1;
    end
end
else if (ramInput==5'b10010) begin
    if (ramOp==0) begin
    result=-x*x*x*x+x*x*x+x*x-x+1;
    end
    else begin
    result=-4*x*x*x+3*x*x+2*x-1;
    end
end
else if (ramInput==5'b10011) begin
    if (ramOp==0) begin
    result=-x*x*x*x+x*x*x+x*x-x-1;
    end
    else begin
    result=-4*x*x*x+3*x*x+2*x-1;
    end
end
else if (ramInput==5'b10100) begin
    if (ramOp==0) begin
    result=-x*x*x*x+x*x*x-x*x+x+1;
    end
    else begin
    result=-4*x*x*x+3*x*x-2*x+1;
    end
end
else if (ramInput==5'b10101) begin
    if (ramOp==0) begin
    result=-x*x*x*x+x*x*x-x*x+x-1;
    end
    else begin
    result=-4*x*x*x+3*x*x-2*x+1;
    end
end
else if (ramInput==5'b10110) begin
    if (ramOp==0) begin
    result=-x*x*x*x+x*x*x-x*x-x+1;
    end
    else begin
    result=-4*x*x*x+3*x*x-2*x-1;
    end
end
else if (ramInput==5'b10111) begin
    if (ramOp==0) begin
    result=-x*x*x*x+x*x*x-x*x-x-1;
    end
    else begin
    result=-4*x*x*x+3*x*x-2*x-1;
    end
end
else if (ramInput==5'b11000) begin
    if (ramOp==0) begin
    result=-x*x*x*x-x*x*x+x*x+x+1;
    end
    else begin
    result=-4*x*x*x-3*x*x+2*x+1;
    end
end

else if (ramInput==5'b11001) begin
    if (ramOp==0) begin
    result=-x*x*x*x-x*x*x+x*x+x-1;
    end
    else begin
    result=-4*x*x*x-3*x*x+2*x+1;
    end
end
else if (ramInput==5'b11010) begin
    if (ramOp==0) begin
    result=-x*x*x*x-x*x*x+x*x-x+1;
    end
    else begin
    result=-4*x*x*x-3*x*x+2*x-1;
    end
end
else if (ramInput==5'b11011) begin
    if (ramOp==0) begin
    result=-x*x*x*x-x*x*x+x*x-x-1;
    end
    else begin
    result=-4*x*x*x-3*x*x+2*x-1;
    end
end
else if (ramInput==5'b11100) begin
    if (ramOp==0) begin
    result=-x*x*x*x-x*x*x-x*x+x+1;
    end
    else begin
    result=-4*x*x*x-3*x*x-2*x+1;
    end
end
else if (ramInput==5'b11101) begin
    if (ramOp==0) begin
    result=-x*x*x*x-x*x*x-x*x+x-1;
    end
    else begin
    result=-4*x*x*x-3*x*x-2*x+1;
    end
end
else if (ramInput==5'b11110) begin
    if (ramOp==0) begin
    result=-x*x*x*x-x*x*x-x*x-x+1;
    end
    else begin
    result=-4*x*x*x-3*x*x-2*x-1;
    end
end
else begin
    if (ramOp==0) begin
    result=-x*x*x*x-x*x*x-x*x-x-1;
    end
    else begin
    result=-4*x*x*x-3*x*x-2*x-1;
    end
end

if (result>=0)begin
ram[ramAddr]=result;
end
else begin

    result=-result;
    
    result=result+256;
   
    ram[ramAddr]=result;
end



end
always@(*)
if(ramMode==0) begin
ramOutput=ram[ramAddr];

end

endmodule
module polMEM(input mode, input [3:0] memAddr, input op, input [1:0] arg, input CLK, output wire [8:0] memOutput);

	/*Don't edit this module*/
	wire [4:0]  romOutput;

	lab4ROM RO(memAddr, romOutput);
	lab4RAM RA(mode, memAddr, romOutput, op, arg, CLK, memOutput);



endmodule