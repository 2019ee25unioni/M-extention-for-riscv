`timescale 1ns/1ns 
module mul_try_tb;

	logic [31:0] a,b;
	logic [63:0] out;
	logic clk, start, busy , done,branch_output;

	initial begin
	clk<=1'b0;
	forever #1 clk <= ~clk;
	end
	assign branch_output = a <b;

	mul_try uut (clk, start,branch_output, a, b, busy, done, out);
	initial begin 
	@(posedge clk ) 
	a=32'h0000_0002 ; b=32'h0000_0002 ; start =1'b1;

	@(posedge clk ) start =1'b0;
	@(negedge busy )
	@(posedge clk ) a =32'h0000_0004 ; b = 32'h0000_0002; 
	@(posedge clk)
	start =1'b1;
@(posedge clk ) start =1'b0;

	@(negedge busy )
	@(posedge clk ) a =32'h0000_0002 ; b = 32'h0000_0004; 
	@(posedge clk)
	start =1'b1;
	@(posedge clk ) start =1'b0;


	@(negedge busy )
	@(posedge clk ) a =32'hffff_fffe ; b = 32'hffff_fff6; 
	@(posedge clk)
	start =1'b1;
	@(posedge clk ) start =1'b0;

	@(negedge busy )
	@(posedge clk ) a =32'hffff_fff6 ; b = 32'hffff_fffe; 
	@(posedge clk)
	start =1'b1;
	@(posedge clk ) start =1'b0;


	end

	

endmodule
