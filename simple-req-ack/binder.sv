`include "sva_req_ack.sv"

module binder(input clk, rst_n, req, ack);
	// bind [BIND_TARGET] [ASSERTION_NAME] [INSTANCE_NAME_OF_ASSERTION]
	bind bench sva_req_ack i_sva_req_ack(
		// .PORT_OF_ASSERTION(PORT_OF_TARGET)
		.clk(clk),
		.rst_n(rst_n),
		.req(req),
		.ack(ack)
	);
endmodule

