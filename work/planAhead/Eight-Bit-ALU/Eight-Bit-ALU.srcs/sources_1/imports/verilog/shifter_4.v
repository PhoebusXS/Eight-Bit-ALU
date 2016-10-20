/*
   This file was generated automatically by the Mojo IDE version B1.3.4.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter_4 (
    input [7:0] a,
    input [7:0] b,
    input [4:0] alufn,
    output reg [7:0] ans
  );
  
  
  
  always @* begin
    
    case (alufn[0+1-:2])
      2'h0: begin
        ans = a << b;
      end
      2'h1: begin
        ans = a >> b;
      end
      2'h3: begin
        ans = $signed(a) >>> b;
      end
      default: begin
        ans = a;
      end
    endcase
  end
endmodule
