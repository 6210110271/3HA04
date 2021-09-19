module musicbox(clk, buzz, led);

input clk;
output buzz;
output reg led;

reg [25:0] counter = 0;
parameter base_limiter = 6_250_000;
reg [29:0] limiter;

reg [10:0] index = 0;
reg [4:0] note = 0;
reg [1:0] pitch = 0;
reg [4:0] length = 0;
reg [4:0] len = 0;

always @(*) begin
	if (len >= length) begin
		note = 0;
		pitch = 0;
	end else begin
		case(index)
			0: begin  note = 4;  pitch = 2;  length = 1;  end //F
			1: begin  note = 0;  pitch = 2;  length = 1;  end 
			2: begin  note = 4;  pitch = 2;  length = 1;  end //F
			3: begin  note = 0;  pitch = 2;  length = 1;  end 
			4: begin  note = 6;  pitch = 2;  length = 1;  end //A
			5: begin  note = 0;  pitch = 2;  length = 1;  end
			6: begin  note = 6;  pitch = 2;  length = 1;  end //A
			7: begin  note = 0;  pitch = 2;  length = 1;  end
			8: begin  note = 5;  pitch = 2;  length = 5;  end //G
			9: begin  note = 0;  pitch = 2;  length = 1;  end 
			10: begin  note = 5;  pitch = 2;  length = 1;  end //G
			11: begin  note = 6;  pitch = 2;  length = 1;  end //A
			12: begin  note = 0;  pitch = 2;  length = 1;  end
			13: begin  note = 2;  pitch = 2;  length = 2;  end //D
			14: begin  note = 0;  pitch = 2;  length = 1;  end
			15: begin  note = 3;  pitch = 2;  length = 2;  end //E
			16: begin  note = 0;  pitch = 2;  length = 1;  end
			17: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			18: begin  note = 0;  pitch = 2;  length = 1;  end 
			19: begin  note = 6;  pitch = 2;  length = 6;  end  // A ยาว
			20: begin  note = 0;  pitch = 2;  length = 1;  end
			21: begin  note = 4;  pitch = 2;  length = 1;  end //F
			22: begin  note = 0;  pitch = 2;  length = 1;  end 
			23: begin  note = 4;  pitch = 2;  length = 1;  end //F
			24: begin  note = 0;  pitch = 2;  length = 1;  end
			25: begin  note = 6;  pitch = 2;  length = 1;  end //A
			26: begin  note = 0;  pitch = 2;  length = 1;  end
			27: begin  note = 6;  pitch = 2;  length = 1;  end //A
			28: begin  note = 0;  pitch = 2;  length = 1;  end
			29: begin  note = 5;  pitch = 2;  length = 5;  end //G
			30: begin  note = 0;  pitch = 2;  length = 1;  end 
			31: begin  note = 5;  pitch = 2;  length = 1;  end //G
			32: begin  note = 6;  pitch = 2;  length = 1;  end //A
			33: begin  note = 0;  pitch = 2;  length = 1;  end
			34: begin  note = 2;  pitch = 2;  length = 2;  end //D
			35: begin  note = 0;  pitch = 2;  length = 1;  end
			36: begin  note = 3;  pitch = 2;  length = 2;  end //E
			37: begin  note = 0;  pitch = 2;  length = 1;  end
			38: begin  note = 9;  pitch = 2;  length = 1;  end //C5
			39: begin  note = 0;  pitch = 2;  length = 1;  end 
			40: begin  note = 6;  pitch = 2;  length = 6;  end  // A ยาว
			41: begin  note = 0;  pitch = 2;  length = 1;  end 
			42: begin  note = 6;  pitch = 2;  length = 1;  end  // A 
			43: begin  note = 0;  pitch = 2;  length = 1;  end 
			44: begin  note = 6;  pitch = 2;  length = 1;  end  // A 
			45: begin  note = 0;  pitch = 2;  length = 1;  end 
			46: begin  note = 8;  pitch = 2;  length = 1;  end  // Bb 
			47: begin  note = 0;  pitch = 2;  length = 1;  end 
			48: begin  note = 8;  pitch = 2;  length = 1;  end  // Bb 
			49: begin  note = 0;  pitch = 2;  length = 1;  end
			50: begin  note = 9;  pitch = 2;  length = 5;  end  //C5 ยาว
			51: begin  note = 0;  pitch = 2;  length = 1;  end
			52: begin  note = 10;  pitch = 2;  length = 1;  end //D5 
			53: begin  note = 0;  pitch = 2;  length = 1;  end
			54: begin  note = 4;  pitch = 2;  length = 2;  end //F
			55: begin  note = 0;  pitch = 2;  length = 1;  end
			56: begin  note = 5;  pitch = 2;  length = 2;  end //G
			57: begin  note = 0;  pitch = 2;  length = 1;  end
			58: begin  note = 6;  pitch = 2;  length = 1;  end //A
			59: begin  note = 0;  pitch = 2;  length = 1;  end
			60: begin  note = 9;  pitch = 2;  length = 5;  end  //C5 ยาว
			61: begin  note = 10;  pitch = 2;  length = 1;  end //D5 
			62: begin  note = 0;  pitch = 2;  length = 1;  end
			63: begin  note = 3;  pitch = 2;  length = 2;  end //E
			64: begin  note = 0;  pitch = 2;  length = 1;  end
			65: begin  note = 11;  pitch = 2;  length = 2;  end //E5
			66: begin  note = 0;  pitch = 2;  length = 1;  end
			67: begin  note = 1;  pitch = 2;  length = 2;  end  //C
			68: begin  note = 6;  pitch = 2;  length = 8;  end  // A ยาว2
			69: begin  note = 0;  pitch = 2;  length = 2;  end
			70: begin  note = 8;  pitch = 2;  length = 1;  end  // Bb
		   71: begin  note = 6;  pitch = 2;  length = 1;  end  // A 
		   72: begin  note = 5;  pitch = 2;  length = 4;  end  // G
		   73: begin  note = 0;  pitch = 2;  length = 3;  end
		   74: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			75: begin  note = 0;  pitch = 2;  length = 1;  end
		   76: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			77: begin  note = 0;  pitch = 2;  length = 1;  end
		   78: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			79: begin  note = 0;  pitch = 2;  length = 1;  end
		   80: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			81: begin  note = 0;  pitch = 2;  length = 1;  end
			82: begin  note = 2;  pitch = 2;  length = 1;  end  //D  hook1
			83: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			84: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			85: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			86: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			87: begin  note = 0;  pitch = 2;  length = 1;  end
			88: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			89: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			90: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			91: begin  note = 9;  pitch = 2;  length = 1;  end  //C5
			92: begin  note = 6;  pitch = 2;  length = 2;  end  //A
		   93: begin  note = 0;  pitch = 2;  length = 2;  end	
			94: begin  note = 2;  pitch = 2;  length = 1;  end  //D  hook2
			95: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			96: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			97: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			98: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			99: begin  note = 0;  pitch = 2;  length = 1;  end
			100: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			101: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			102: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			103: begin  note = 9;  pitch = 2;  length = 1;  end  //C5
			104: begin  note = 6;  pitch = 2;  length = 2;  end  //A
		   105: begin  note = 0;  pitch = 2;  length = 2;  end
		   106: begin  note = 2;  pitch = 2;  length = 1;  end  //D  hook3
			107: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			108: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			109: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			110: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			111: begin  note = 0;  pitch = 2;  length = 1;  end
			112: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			113: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			114: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			115: begin  note = 9;  pitch = 2;  length = 1;  end  //C5
			116: begin  note = 6;  pitch = 2;  length = 2;  end  //A
		   117: begin  note = 0;  pitch = 2;  length = 2;  end
		  	118: begin  note = 1;  pitch = 2;  length = 2;  end  //C  end 1
			119: begin  note = 5;  pitch = 2;  length = 2;  end  //G  end 1
			120: begin  note = 4;  pitch = 2;  length = 1.5;  end  //F
			121: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			122: begin  note = 2;  pitch = 2;  length = 1.5;  end  //D
			123: begin  note = 1;  pitch = 2;  length = 1.5;  end  //C
			124: begin  note = 2;  pitch = 2;  length = 1;  end  //D
			125: begin  note = 3;  pitch = 2;  length = 1.5;  end  //E
			126: begin  note = 2;  pitch = 2;  length = 1;  end  //D
			127: begin  note = 4;  pitch = 2;  length = 1;  end  //F hook1
			128: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			129: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			130: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			131: begin  note = 0;  pitch = 2;  length = 1;  end
			132: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			133: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			134: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			135: begin  note = 9;  pitch = 2;  length = 1;  end  //C5
			136: begin  note = 6;  pitch = 2;  length = 2;  end  //A
		   137: begin  note = 0;  pitch = 2;  length = 2;  end	
			138: begin  note = 2;  pitch = 2;  length = 1;  end  //D
			139: begin  note = 4;  pitch = 2;  length = 1;  end  //F hook2
			140: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			141: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			142: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			143: begin  note = 0;  pitch = 2;  length = 1;  end
			144: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			145: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			146: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			147: begin  note = 9;  pitch = 2;  length = 1;  end  //C5
			148: begin  note = 6;  pitch = 2;  length = 2;  end  //A
		   149: begin  note = 0;  pitch = 2;  length = 2;  end	
			150: begin  note = 2;  pitch = 2;  length = 1;  end  //D
			151: begin  note = 4;  pitch = 2;  length = 1;  end  //F hook3
			152: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			153: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			154: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			155: begin  note = 0;  pitch = 2;  length = 1;  end
			156: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			157: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			158: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			159: begin  note = 9;  pitch = 2;  length = 1;  end  //C5
			160: begin  note = 6;  pitch = 2;  length = 2;  end  //A
		   161: begin  note = 0;  pitch = 2;  length = 2;  end	
			162: begin  note = 1;  pitch = 2;  length = 2;  end  //C  end  2
			163: begin  note = 5;  pitch = 2;  length = 2;  end  //G  end  2
			164: begin  note = 4;  pitch = 2;  length = 1.5;  end  //F
			165: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			166: begin  note = 2;  pitch = 2;  length = 1.5;  end  //D
			167: begin  note = 1;  pitch = 2;  length = 1.5;  end  //C
			168: begin  note = 2;  pitch = 2;  length = 1;  end  //D
			169: begin  note = 3;  pitch = 2;  length = 1.5;  end  //E
			170: begin  note = 2;  pitch = 2;  length = 1;  end  //D
			171: begin  note = 4;  pitch = 2;  length = 1;  end  //F hook1
			172: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			173: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			174: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			175: begin  note = 0;  pitch = 2;  length = 1;  end
			176: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			177: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			178: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			179: begin  note = 9;  pitch = 2;  length = 1;  end  //C5
			180: begin  note = 6;  pitch = 2;  length = 2;  end  //A
		   181: begin  note = 0;  pitch = 2;  length = 2;  end	
			182: begin  note = 2;  pitch = 2;  length = 1;  end  //D
			183: begin  note = 4;  pitch = 2;  length = 1;  end  //F hook2
			184: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			185: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			186: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			187: begin  note = 0;  pitch = 2;  length = 1;  end
			188: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			189: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			190: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			191: begin  note = 9;  pitch = 2;  length = 1;  end  //C5
			192: begin  note = 6;  pitch = 2;  length = 2;  end  //A
		   193: begin  note = 0;  pitch = 2;  length = 2;  end	
			194: begin  note = 2;  pitch = 2;  length = 1;  end  //D
			195: begin  note = 4;  pitch = 2;  length = 1;  end  //F hook3
			196: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			197: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			198: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			199: begin  note = 0;  pitch = 2;  length = 1;  end
			200: begin  note = 2;  pitch = 2;  length = 2;  end  //D
			201: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			202: begin  note = 4;  pitch = 2;  length = 1;  end  //F
			203: begin  note = 9;  pitch = 2;  length = 1;  end  //C5
			204: begin  note = 6;  pitch = 2;  length = 2;  end  //A
		   205: begin  note = 0;  pitch = 2;  length = 2;  end
		   206: begin  note = 12;  pitch = 2;  length = 2;  end //Db4
		   207: begin  note = 5;  pitch = 2;  length = 2;  end  //G  end  3
			208: begin  note = 4;  pitch = 2;  length = 1.5;  end  //F
			209: begin  note = 3;  pitch = 2;  length = 1;  end  //E
			210: begin  note = 2;  pitch = 2;  length = 1.5;  end  //D
			211: begin  note = 12;  pitch = 2;  length = 1.5;  end  //Db4
			212: begin  note = 2;  pitch = 2;  length = 1;  end  //D
			213: begin  note = 3;  pitch = 2;  length = 1.5;  end  //E	  new end 1
			214: begin  note = 10;  pitch = 2;  length = 10;  end  //D5
		   215: begin  note = 6;  pitch = 2;  length = 2;  end  //A4
	      216: begin  note = 9;  pitch = 2;  length = 2;  end  //C5
	      217: begin  note = 10;  pitch = 2;  length = 5;  end  //D5
	      218: begin  note = 14;  pitch = 2;  length = 1.5;  end  //F5
	      219: begin  note = 15;  pitch = 2;  length = 1;  end  //G5
	      220: begin  note = 14;  pitch = 2;  length = 1;  end  //F5
	      221: begin  note = 13;  pitch = 2;  length = 0.5;  end  //Eb5
	      222: begin  note = 11;  pitch = 2;  length = 2;  end  //E5
	      223: begin  note = 14;  pitch = 2;  length = 1.5;  end  //F5
	      224: begin  note = 10;  pitch = 2;  length = 5;  end  //D5
	      225: begin  note = 0;  pitch = 2;  length = 1;  end  	
	      226: begin  note = 6;  pitch = 2;  length = 2.5;  end  //A4
         227: begin  note = 9;  pitch = 2;  length = 2;  end  //C5
         228: begin  note = 11;  pitch = 2;  length = 1;  end  //E5
         229: begin  note = 14;  pitch = 2;  length = 1.5;  end  //F5
         230: begin  note = 11;  pitch = 2;  length = 5;  end  //E5
         231: begin  note = 0;  pitch = 2;  length = 2;  end
         232: begin  note = 10;  pitch = 2;  length = 3;  end  //D5
         233: begin  note = 14;  pitch = 2;  length = 3;  end  //F5 
         234: begin  note = 15;  pitch = 2;  length = 2;  end  //G5
         235: begin  note = 16;  pitch = 2;  length = 8;  end  //A5 
         236: begin  note = 0;  pitch = 2;  length = 4;  end 
	      237: begin  note = 14;  pitch = 2;  length = 2;  end	//F5	
         238: begin  note = 15;  pitch = 2;  length = 2;  end	//G5
 			239: begin  note = 16;  pitch = 2;  length = 4;  end	//A5
			240: begin  note = 0;  pitch = 2;  length = 2;  end
		   241: begin  note = 15;  pitch = 2;  length = 2;  end  //G5 ;; 
         242: begin  note = 14;  pitch = 2;  length = 2;  end  //F5
	      243: begin  note = 15;  pitch = 2;  length = 1;  end	//G5	
         244: begin  note = 11;  pitch = 2;  length = 2;  end	//E5
 			245: begin  note = 0;  pitch = 2;  length = 1;  end	
			246: begin  note = 9;  pitch = 2;  length = 2;  end	//C5
		   247: begin  note = 10;  pitch = 2;  length = 8;  end	//D5
		   248: begin  note = 0;  pitch = 2;  length = 4;  end
		   249: begin  note = 14;  pitch = 2;  length = 2;  end  //F5		
			250: begin  note = 15;  pitch = 2;  length = 2;  end  //G5
			251: begin  note = 16;  pitch = 2;  length = 4;  end  //A5
			252: begin  note = 0;  pitch = 2;  length = 2;  end  
			253: begin  note = 17;  pitch = 2;  length = 0.5;  end //Fg5 
			254: begin  note = 15;  pitch = 2;  length = 2;  end  //G5
			255: begin  note = 0;  pitch = 2;  length = 1;  end 
		   256: begin  note = 14;  pitch = 2;  length = 2;  end  //F5
		   257: begin  note = 15;  pitch = 2;  length = 1;  end  //G5
		   258: begin  note = 11;  pitch = 2;  length = 1;  end  //E5
	      259: begin  note = 0;  pitch = 2;  length = 2;  end
         260: begin  note = 19;  pitch = 2;  length = 2;  end  //C6    6
         261: begin  note = 16;  pitch = 2;  length = 8;  end  //A5
         262: begin  note = 0;  pitch = 2;  length = 4;  end
         263: begin  note = 14;  pitch = 2;  length = 2;  end  //F5
         264: begin  note = 15;  pitch = 2;  length = 2;  end  //G5
         265: begin  note = 16;  pitch = 2;  length = 4;  end  //A5
         266: begin  note = 0;  pitch = 2;  length = 2;  end
         267: begin  note = 15;  pitch = 2;  length = 2;  end //G5
         268: begin  note = 14;  pitch = 2;  length = 2;  end //F5
         269: begin  note = 15;  pitch = 2;  length = 1;  end //G5
         270: begin  note = 11;  pitch = 2;  length = 1;  end //E5
         271: begin  note = 0;  pitch = 2;  length = 2;  end
         272: begin  note = 9;  pitch = 2;  length = 2;  end // C5
         273: begin  note = 10;  pitch = 2;  length = 14;  end // D5 ยาวมาก 			
			default: begin note = 0;  pitch = 0;  length = 6; end
		endcase
	end
end

always @(posedge clk) begin
	if (index >= 280) begin
		index = 0;
	end else begin
		
		counter = counter + 1;
		if (counter >= base_limiter) begin
			counter = 0;
			len = len + 1;
			led = 1;
			if (len >= length) begin
				len = 0;
				index = index + 1;
			end
		end else if (counter >= base_limiter / 2) begin
			led = 0;
		end
		
	end
end

buzzer bz1(clk, pitch, note, buzz);

endmodule