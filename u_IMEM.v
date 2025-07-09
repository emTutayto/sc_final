module IMEM #(
    parameter MEM_DEPTH = 256
) (
    output  reg [31:0]  instruction,
    input       [31:0]  address
);
    reg [31:0] memory [0:MEM_DEPTH-1];

    always @(*) begin
        instruction = (address[31:2] < MEM_DEPTH) ? memory[address[31:2]] : 32'h00000013;
    end
endmodule