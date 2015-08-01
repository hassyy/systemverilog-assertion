`include "dut.sv"
`include "binder.sv"

module bench #(
	parameter CLK_PERIOD=10,
	parameter RESET_CYCLE=5,
	parameter RESET_ACTIVE=0
);

	logic clk, rst_n;
	logic req, ack;

	// DUT
	dut i_dut( .clk(clk), .rst_n(rst_n), .req(req), .ack(ack) );
	// Instantiate Binder 
	binder i_binder( .clk(clk), .rst_n(rst_n), .req(req), .ack(ack) );

	// TASKs
	task clk_gen();
		clk = 0;
		forever #(CLK_PERIOD/2) clk=!clk;
	endtask

	task rst_gen();
		rst_n = RESET_ACTIVE;
		repeat(RESET_CYCLE) @(posedge clk);
		rst_n <= !RESET_ACTIVE;
		forever @(posedge clk);
	endtask

	task scenario();
			req = 0;
		@(posedge rst_n)

		repeat(5) @(posedge clk);
			req = 1;
		repeat(1) @(posedge clk);
			req = 0;
		repeat(5) @(posedge clk);
	endtask

	initial begin
		fork 
			rst_gen();  // forever
			clk_gen();  // forever
			scenario();
		join_any
		$finish;
	end

endmodule