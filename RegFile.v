module RegFile (
    output  reg [31:0]  read_data1,
    output  reg [31:0]  read_data2,

    input       [31:0]  write_data,
    input       [ 4:0]  write_addr,
    input       [ 4:0]  read_addr1,
    input       [ 4:0]  read_addr2,
    input               clk,
    input               write_enable,
    input               rst_n
);
    reg [31:0] registers [0:31];
    integer i;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= {32{1'b0}};
            end
        end else begin
            if (write_enable && write_addr != 0) begin
                registers[write_addr] <= write_data;
            end
        end
    end
    
    always @(*) begin
        read_data1 = (read_addr1) ? registers[read_addr1] : {32{1'b0}};
        read_data2 = (read_addr2) ? registers[read_addr2] : {32{1'b0}};
    end
endmodule