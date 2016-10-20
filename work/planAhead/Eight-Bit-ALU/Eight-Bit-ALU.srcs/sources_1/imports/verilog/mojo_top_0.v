/*
   This file was generated automatically by the Mojo IDE version B1.3.4.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  reg [7:0] ans;
  
  wire [8-1:0] M_my_adder_ans;
  wire [1-1:0] M_my_adder_z;
  wire [1-1:0] M_my_adder_v;
  wire [1-1:0] M_my_adder_n;
  wire [1-1:0] M_my_adder_cmpz;
  wire [1-1:0] M_my_adder_cmpv;
  wire [1-1:0] M_my_adder_cmpn;
  reg [6-1:0] M_my_adder_alufn;
  reg [8-1:0] M_my_adder_a;
  reg [8-1:0] M_my_adder_b;
  adder_1 my_adder (
    .alufn(M_my_adder_alufn),
    .a(M_my_adder_a),
    .b(M_my_adder_b),
    .ans(M_my_adder_ans),
    .z(M_my_adder_z),
    .v(M_my_adder_v),
    .n(M_my_adder_n),
    .cmpz(M_my_adder_cmpz),
    .cmpv(M_my_adder_cmpv),
    .cmpn(M_my_adder_cmpn)
  );
  
  wire [8-1:0] M_my_comparer_ans;
  reg [6-1:0] M_my_comparer_alufn;
  reg [1-1:0] M_my_comparer_z;
  reg [1-1:0] M_my_comparer_v;
  reg [1-1:0] M_my_comparer_n;
  comparer_2 my_comparer (
    .alufn(M_my_comparer_alufn),
    .z(M_my_comparer_z),
    .v(M_my_comparer_v),
    .n(M_my_comparer_n),
    .ans(M_my_comparer_ans)
  );
  
  wire [8-1:0] M_my_logic_operator_ans;
  reg [6-1:0] M_my_logic_operator_alufn;
  reg [8-1:0] M_my_logic_operator_a;
  reg [8-1:0] M_my_logic_operator_b;
  logic_operator_3 my_logic_operator (
    .alufn(M_my_logic_operator_alufn),
    .a(M_my_logic_operator_a),
    .b(M_my_logic_operator_b),
    .ans(M_my_logic_operator_ans)
  );
  
  wire [8-1:0] M_my_shifter_ans;
  reg [8-1:0] M_my_shifter_a;
  reg [8-1:0] M_my_shifter_b;
  reg [5-1:0] M_my_shifter_alufn;
  shifter_4 my_shifter (
    .a(M_my_shifter_a),
    .b(M_my_shifter_b),
    .alufn(M_my_shifter_alufn),
    .ans(M_my_shifter_ans)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_5 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_my_adder_a = io_dip[8+7-:8];
    M_my_adder_b = io_dip[0+7-:8];
    M_my_adder_alufn = io_dip[16+0+5-:6];
    M_my_logic_operator_a = io_dip[8+7-:8];
    M_my_logic_operator_b = io_dip[0+7-:8];
    M_my_logic_operator_alufn = io_dip[16+0+5-:6];
    M_my_shifter_a = io_dip[8+7-:8];
    M_my_shifter_b = io_dip[0+7-:8];
    M_my_shifter_alufn = io_dip[16+0+5-:6];
    M_my_comparer_alufn = io_dip[16+0+5-:6];
    M_my_comparer_z = M_my_adder_cmpz;
    M_my_comparer_v = M_my_adder_cmpv;
    M_my_comparer_n = M_my_adder_cmpn;
    
    case (io_dip[16+4+1-:2])
      2'h0: begin
        ans = M_my_adder_ans;
      end
      2'h1: begin
        ans = M_my_logic_operator_ans;
      end
      2'h2: begin
        ans = M_my_shifter_ans;
      end
      2'h3: begin
        ans = M_my_comparer_ans;
      end
      default: begin
        ans = 8'h00;
      end
    endcase
    led = ans;
  end
endmodule