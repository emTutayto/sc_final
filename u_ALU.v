`include "0_macro.v"

module ALU (
    output  reg [31:0]  alu_result,

    input       [31:0]  operandA,
    input       [31:0]  operandB,
    input       [3:0]   ALU_sel
);
    always @(*) begin
        case (ALU_sel)
            `ALU_SEL_ADD:   alu_result = operandA + operandB;
            `ALU_SEL_SUB:   alu_result = operandA - operandB;

            `ALU_SEL_AND:   alu_result = operandA & operandB;
            `ALU_SEL_OR:    alu_result = operandA | operandB;
            `ALU_SEL_XOR:   alu_result = operandA ^ operandB;
            
            `ALU_SEL_SLL:   alu_result = operandA << operandB[4:0];
            `ALU_SEL_SRL:   alu_result = operandA >> operandB[4:0];
            `ALU_SEL_SRA:   alu_result = $signed(operandA) >>> operandB[4:0];

            `ALU_SEL_SLT:   alu_result = ($signed(operandA) < $signed(operandB));
            `ALU_SEL_SLTU:  alu_result = (operandA < operandB);

            `ALU_SEL_A:     alu_result = operandA;
            `ALU_SEL_B:     alu_result = operandB;

            default:        alu_result = {32{1'b0}};
        endcase
    end
endmodule