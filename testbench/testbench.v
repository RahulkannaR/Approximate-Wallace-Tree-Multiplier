`timescale 1ns/1ps

module testbench;

  reg [7:0] A, B;
  wire [15:0] Product;

  wallace_tree_approx uut (
    .A(A),
    .B(B),
    .Product(Product)
  );

  initial begin
    $monitor("Time=%0t | A=%d, B=%d => Product=%d", $time, A, B, Product);

    A = 8'd12; B = 8'd3;  #10;
    A = 8'd5;  B = 8'd7;  #10;
    A = 8'd15; B = 8'd15; #10;
    A = 8'd100; B = 8'd50; #10;

    $finish;
  end

endmodule
