module buzzer(clk, pitch, note, buzz);

input clk;
input [4:0] note;  
input [1:0] pitch;
output reg buzz;

reg [25:0] limiter = 25_000_000;
reg [25:0] counter = 0;

always @(*) begin
	
	if (pitch == 0) begin
		limiter = 0;
	end else begin
		case (note)
			1: limiter = 25_000_000 / (262 * pitch); // C4
			2: limiter = 25_000_000 / (294 * pitch); // D4
			3: limiter = 25_000_000 / (330 * pitch); // E4
			4: limiter = 25_000_000 / (349 * pitch); // F4
			5: limiter = 25_000_000 / (392 * pitch); // G4
			6: limiter = 25_000_000 / (440 * pitch); // A4
			7: limiter = 25_000_000 / (494 * pitch); // B4
			8: limiter = 25_000_000 / (454 * pitch); // Bb4
			9: limiter = 25_000_000 / (524 * pitch); // C5
			10: limiter = 25_000_000 / (588 * pitch); // D5
			11: limiter = 25_000_000 / (659 * pitch); // E5
			12: limiter = 25_000_000 / (282 * pitch); // Db4
         13: limiter = 25_000_000 / (619 * pitch); // Eb5
			14: limiter = 25_000_000 / (698 * pitch); // F5
			15: limiter = 25_000_000 / (784 * pitch); // G5
			16: limiter = 25_000_000 / (880 * pitch); // A5
			17: limiter = 25_000_000 / (754 * pitch); // Fg5
			18: limiter = 25_000_000 / (988 * pitch); // B5
			19: limiter = 25_000_000 / (1047 * pitch); // C6
			20: limiter = 25_000_000 / (1174 * pitch); // D6
			default: limiter = 0;
		endcase
	end
	
end

always @(posedge clk) begin
	
	counter = counter + 1;
	if (counter >= limiter) begin
		if (limiter > 0)
			buzz = ~buzz;
		else
			buzz = 0;
		counter = 0;
	end
	
end

endmodule