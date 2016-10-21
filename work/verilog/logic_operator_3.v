/*
   This file was generated automatically by the Mojo IDE version B1.3.4.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module logic_operator_3 (
    input [5:0] alufn,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] ans
  );
  
  
  
  always @* begin
    
    case (alufn[1+2-:3])
      3'h4: begin
        ans = a & b;
      end
      3'h7: begin
        ans = a | b;
      end
      3'h3: begin
        ans = a ^ b;
      end
      3'h5: begin
        ans = a;
      end
      3'h6: begin
        ans = ~a;
      end
      3'h1: begin
        ans = b;
      end
      3'h2: begin
        ans = ~b;
      end
      default: begin
        ans = 8'h00;
      end
    endcase
  end
endmodule
