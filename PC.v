module PC (
    output      [31:0]  pc,

    input       [31:0]  next_pc,
    input               clk,
    input               enable,
    input               reset_n
);
    d_ff_arstn_en # (
        .DATA_WIDTH (32)
    ) PC (
        .dout       (pc),
        
        .din        (next_pc),
        .clk        (clk),
        .enable         (enable),
        .reset_n      (reset_n)
    );
endmodule
