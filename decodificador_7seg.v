// ============================================================================
// Módulo: decodificador_7seg
// Descrição: Decodificador Hexadecimal de 4 bits para Display de 7 Segmentos
// Lógica de Saída: Ativo em Nível Baixo (0 = Segmento Aceso / 1 = Segmento Apagado)
// Mapeamento dos Segmentos: segments[6..0] = {g, f, e, d, c, b, a}
// ============================================================================

module decodificador_7seg (
    input  wire [3:0] hex_digit,  // Entrada hexadecimal de 4 bits (0 a F)
    output reg  [6:0] segments   // Saída de 7 segmentos
);

    always @(*) begin
        case (hex_digit)
            //                        g_f_e_d_c_b_a
            4'h0: segments = 7'b100_0000; // Exibe '0'
            4'h1: segments = 7'b111_1001; // Exibe '1'
            4'h2: segments = 7'b010_0100; // Exibe '2'
            4'h3: segments = 7'b011_0000; // Exibe '3'
            4'h4: segments = 7'b001_1001; // Exibe '4'
            4'h5: segments = 7'b001_0010; // Exibe '5'
            4'h6: segments = 7'b000_0010; // Exibe '6'
            4'h7: segments = 7'b111_1000; // Exibe '7'
            4'h8: segments = 7'b000_0000; // Exibe '8'
            4'h9: segments = 7'b001_0000; // Exibe '9'
            4'hA: segments = 7'b000_1000; // Exibe 'A'
            4'hB: segments = 7'b000_0011; // Exibe 'b'
            4'hC: segments = 7'b100_0110; // Exibe 'C'
            4'hD: segments = 7'b010_0001; // Exibe 'd'
            4'hE: segments = 7'b000_0110; // Exibe 'E'
            4'hF: segments = 7'b000_1110; // Exibe 'F'
            default: segments = 7'b111_1111; // Apaga todos os segmentos
        endcase
    end

endmodule