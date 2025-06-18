module wallace_tree_approx (
    input  [7:0] A,
    input  [7:0] B,
    output [15:0] Product
);
    // Partial product matrix
    wire [15:0] pp [7:0];
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_pp
            assign pp[i] = (B[i]) ? (A << i) : 16'd0;
        end
    endgenerate

    // Approximation: discard some LSBs and skip full carry propagation
    // Simple adder tree (not full Wallace Tree but close for prototype)
    wire [15:0] sum1, sum2, sum3;

    assign sum1 = pp[0] + pp[1];  // LSBs
    assign sum2 = pp[2] + pp[3];
    assign sum3 = pp[4] + pp[5];

    wire [15:0] upper_sum = pp[6] + pp[7];

    // Final sum - approximate: skip carry between groups
    assign Product = sum1 + sum2 + sum3 + upper_sum;

endmodule

