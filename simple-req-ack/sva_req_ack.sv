module sva_req_ack(input clk, rst_n, req, ack);

	// PROPERTY 
	property sva_req_ack_pass1 (clk, rst_n, req, ack);
		@(posedge clk) disable iff(!rst_n)
		req |-> ##2 ack;
	endproperty

	property sva_req_ack_pass2 (clk, rst_n, req, ack);
		@(posedge clk) disable iff(!rst_n)
		$rose(req) |-> ##2 $rose(ack);
	endproperty

	property sva_req_ack_pass3 (clk, rst_n, req, ack);
		@(posedge clk) disable iff(!rst_n)
		$rose(req) |-> ##1 $fell(req) ##1 $rose(ack) ##1 $fell(ack);
	endproperty

	property sva_req_ack_pass4 (clk, rst_n, req, ack);
		@(posedge clk) disable iff(!rst_n)
		$rose(req) |->
			!ack ##1 ($fell(req) & !ack) ##1 ($rose(ack) & !req) ##1 ($fell(ack) & !req);
	endproperty

	// ASSERT PROPERTY
	assert_sva_req_ack1 : assert property( sva_req_ack_pass1(clk, rst_n, req, ack) );
	assert_sva_req_ack2 : assert property( sva_req_ack_pass2(clk, rst_n, req, ack) );
	assert_sva_req_ack3 : assert property( sva_req_ack_pass3(clk, rst_n, req, ack) );
	assert_sva_req_ack4 : assert property( sva_req_ack_pass4(clk, rst_n, req, ack) );

endmodule

