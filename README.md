
# FPGA FPM

Repositório para o projeto **FPGA FPM**, desenvolvido por Vitor Amadeu. Este projeto contém um módulo em Verilog para FPGA, acompanhado do arquivo de constraints.

## Estrutura do Repositório

- `fsm.v` - Código Verilog do módulo principal (FSM).
- `fsm.cst` - Arquivo de constraints para síntese em FPGA.

## Requisitos

- Ferramenta de síntese FPGA compatível (ex.: Quartus, Vivado).

## Como Utilizar

1. Clone o repositório:
   ```bash
   git clone https://github.com/vitor-souza-ime/fpgafpm.git
   cd fpgafpm


2. Importe o arquivo `fsm.v` em seu projeto FPGA.

3. Aplique as constraints do arquivo `fsm.cst` para mapear corretamente os pinos no FPGA.

4. Compile e sintetize o projeto na sua ferramenta FPGA escolhida.

## Licença

Este projeto está sob a [MIT License](LICENSE) (ou outra, se aplicável).

