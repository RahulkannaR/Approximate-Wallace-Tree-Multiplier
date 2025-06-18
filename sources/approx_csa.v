module approx_csa(
    input  A, B, Cin,
    output Sum, Cout
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin); // Approx: skip carry in some cases
endmodule
