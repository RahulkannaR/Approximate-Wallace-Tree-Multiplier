module partial_products(
    input  [7:0] A, B,
    output [63:0] P
);
    genvar i, j;
    generate
        for (i = 0; i < 8; i = i + 1) begin: genA
            for (j = 0; j < 8; j = j + 1) begin: genB
                assign P[i*8 + j] = A[i] & B[j];
            end
        end
    endgenerate
endmodule
