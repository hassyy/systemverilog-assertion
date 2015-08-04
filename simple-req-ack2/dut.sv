module dut (
	input  clk,
	input  rst_n,

	input  req,
	output ack
);
	logic req_ff, ack_ff;

	always_ff @(negedge rst_n, posedge clk)
		if (!rst_n)
			req_ff <= '0;
		else
			if (req_ff)
				req_ff <= '0;
			else
				req_ff <= req;

	always_ff @(negedge rst_n, posedge clk)
		if (!rst_n)
			ack_ff <= '0;
		else
		if (ack_ff)
			ack_ff <= '0;
		else
		if (req_ff)
			ack_ff <= '1;

	assign ack = ack_ff;

endmodule