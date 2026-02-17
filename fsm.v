module maquina_estados_debounce (
    input wire clk,              // Clock (ex: 50MHz)
    input wire reset,
    input wire botao,
    output reg [2:0] leds
);

    parameter DEBOUNCE_TIME = 1000000; // ~20ms para 50MHz
    
    reg [2:0] estado_atual;
    reg [19:0] contador_debounce;
    reg botao_estavel, botao_anterior;
    wire botao_pressionado;
    
    // Debounce do botão
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            contador_debounce <= 0;
            botao_estavel <= 0;
        end else begin
            if (botao == botao_estavel) begin
                contador_debounce <= 0;
            end else begin
                contador_debounce <= contador_debounce + 1;
                if (contador_debounce >= DEBOUNCE_TIME) begin
                    botao_estavel <= botao;
                    contador_debounce <= 0;
                end
            end
        end
    end
    
    // Detector de borda de subida
    always @(posedge clk or posedge reset) begin
        if (reset)
            botao_anterior <= 0;
        else
            botao_anterior <= botao_estavel;
    end
    
    assign botao_pressionado = botao_estavel & ~botao_anterior;
    
    // Máquina de estados
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            estado_atual <= 3'b000;
            leds <= 3'b000;
        end else if (botao_pressionado) begin
            estado_atual <= estado_atual + 1;  // Incrementa estado (0-7)
            leds <= estado_atual + 1;          // Atualiza LEDs
        end else begin
            leds <= estado_atual;              // Mantém LEDs
        end
    end

endmodule
/*
## Diagrama de Estados:
Estado S0 (000) → [botão] → Estado S1 (001)
Estado S1 (001) → [botão] → Estado S2 (010)
Estado S2 (010) → [botão] → Estado S3 (011)
Estado S3 (011) → [botão] → Estado S4 (100)
Estado S4 (100) → [botão] → Estado S5 (101)
Estado S5 (101) → [botão] → Estado S6 (110)
Estado S6 (110) → [botão] → Estado S7 (111)
Estado S7 (111) → [botão] → Estado S0 (000) [volta ao início]
*/
