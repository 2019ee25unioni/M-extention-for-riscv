`timescale 1ns/1ns

module mul_unit_tb();

    logic clk, m_done,div_start, m_busy, branch_output;
    logic [31:0] a, b, out;
    logic [3:0] m_con;
    
     initial begin 
         clk<=1'b0;
        forever #1 clk<=    ~clk;
    end
  assign branch_output = a < b;
    m_unit uut(clk, a, b, m_con,branch_output, out, m_done, m_busy);

   

    initial begin 
        @(posedge clk)
        
        a = 32'h2; a= ~a +1'b1; b=32'd2; m_con =4'h1;
      @(negedge m_busy)
       
         @(posedge clk)
          m_con=4'h0;
        a = 32'h0000_0009; b=32'd2; b= ~b + 1'b1; m_con =4'h1;
      @(negedge m_busy)
      

         @(posedge clk)
          m_con=4'h0;
        a = 32'h0000_0008; a = ~a +1'b1; b=32'd2; b = ~b+ 1'b1; m_con =4'h1;
      @(negedge m_busy)
       


  
        @(posedge clk)
          m_con=4'h0;
        a = 32'h0000_0009; b=32'd2; m_con =4'h3;
      @(negedge m_busy)
        
    
          @(posedge clk)
          m_con=4'h0;
        a = 32'h0000_0008; b=32'd2; m_con =4'h4;
      @(negedge m_busy)
        m_con=4'h0;

          @(posedge clk)
          m_con=4'h0;
        a = 32'h0000_0008; b=32'd2; m_con =4'h8;
      @(negedge m_busy)
        m_con=4'h0;
       
      

    end

endmodule