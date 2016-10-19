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
  
  wire [8-1:0] M_myAdder_ans;
  wire [1-1:0] M_myAdder_z;
  wire [1-1:0] M_myAdder_v;
  wire [1-1:0] M_myAdder_n;
  wire [1-1:0] M_myAdder_cmpz;
  wire [1-1:0] M_myAdder_cmpv;
  wire [1-1:0] M_myAdder_cmpn;
  reg [6-1:0] M_myAdder_alufn;
  reg [8-1:0] M_myAdder_a;
  reg [8-1:0] M_myAdder_b;
  adder_1 myAdder (
    .alufn(M_myAdder_alufn),
    .a(M_myAdder_a),
    .b(M_myAdder_b),
    .ans(M_myAdder_ans),
    .z(M_myAdder_z),
    .v(M_myAdder_v),
    .n(M_myAdder_n),
    .cmpz(M_myAdder_cmpz),
    .cmpv(M_myAdder_cmpv),
    .cmpn(M_myAdder_cmpn)
  );
  
  wire [8-1:0] M_myComparer_ans;
  reg [6-1:0] M_myComparer_alufn;
  reg [1-1:0] M_myComparer_z;
  reg [1-1:0] M_myComparer_v;
  reg [1-1:0] M_myComparer_n;
  comparer_2 myComparer (
    .alufn(M_myComparer_alufn),
    .z(M_myComparer_z),
    .v(M_myComparer_v),
    .n(M_myComparer_n),
    .ans(M_myComparer_ans)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_3 reset_cond (
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
    M_myAdder_a[0+7-:8] = io_dip[8+7-:8];
    M_myAdder_b[0+7-:8] = io_dip[0+7-:8];
    M_myAdder_alufn[0+5-:6] = io_dip[16+0+5-:6];
    M_myComparer_alufn[0+5-:6] = io_dip[16+0+5-:6];
    M_myComparer_z = M_myAdder_cmpz;
    M_myComparer_v = M_myAdder_cmpv;
    M_myComparer_n = M_myAdder_cmpn;
    
    case (io_dip[16+4+1-:2])
      2'h0: begin
        ans = M_myAdder_ans;
      end
      2'h3: begin
        ans = M_myComparer_ans;
      end
      default: begin
        ans = 8'h00;
      end
    endcase
    led = ans;
  end
endmodule