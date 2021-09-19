module musicbox(clk, buzz, led);

input clk;
output buzz;
output reg led;

reg [25:0] counter = 0;
parameter base_limiter = 6_250_000;
reg [29:0] limiter;

reg [10:0] index = 0;
reg [3:0] note = 0;
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
		  	118: begin  note = 1;  pitch = 2;  length = 2;  end  //C
			119: begin  note = 5;  pitch = 2;  length = 2;  end  //G
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
			162: begin  note = 2;  pitch = 2;  length = 1;  end  //D
			default: begin note = 0;  pitch = 0;  length = 6; end
		endcase
	end
end

always @(posedge clk) begin
	if (index >= 200) begin
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