`include "0_macro.v"

module ImmGen (
    output  reg [31:0]  immediate,

    input       [31:0]  instruction,
    input       [ 2:0]  imm_sel
);
    always @(*) begin
        case (imm_sel)
            `IMM_SEL_I: immediate = {{20{instruction[31]}}, instruction[31:20]};
            `IMM_SEL_S: immediate = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
            `IMM_SEL_B: immediate = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};
            `IMM_SEL_J: immediate = {{11{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0};
            `IMM_SEL_U: immediate = {instruction[31:12], 12'b0};
            default:    immediate = {32{1'b0}};
        endcase
    end
endmodule