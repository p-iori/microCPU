# MicroCPU - Processador Educacional de 4 bits

Projeto desenvolvido para a disciplina **SSC0118 - Sistemas Digitais** do Instituto de Ciências Matemáticas e de Computação (ICMC - USP), sob orientação do **Prof. Denis F. Wolf**.

---

## 📌 Visão Geral

O projeto consiste no projeto e implementação de uma **Micro CPU** capaz de ler instruções e dados codificados em formato binário armazenados em memória (ROM) e executá-los sequencialmente ou via desvios de fluxo. 

A arquitetura conta com exibição em tempo real do estado dos registradores através de mostradores/displays após cada ciclo de instrução.

---

## 📐 Especificações Arquiteturais

* **Tamanho da Palavra de Memória:** 16 bits (dividida entre opcode da instrução e operandos/dados).
* **Largura dos Registradores:** 4 bits (Registradores positivos/unsigned).
* **Largura da ULA:** 4 bits (operações aritméticas e lógicas básicas).
* **Interface do Usuário:** Entrada via sinal de **Clock** (manual ou automático) e saídas visuais conectadas aos registradores.
* **Componentes Utilizados:** Implementação estrita utilizando portas lógicas, flip-flops e blocos de memória (`LPM_ROM`) nativos do Quartus.

---

## 🏗️ Estrutura do Processador

O sistema é composto pelos seguintes blocos principais:

1. **Contador de Programa (PC / Contador):** Armazena o endereço da próxima instrução a ser buscada na memória.
2. **Memória de Instruções (`LPM_ROM`):** Memória inicializada via arquivo `.mif` (16 bits por palavra).
3. **Unidade de Controle (UC):** Decodifica a palavra de 16 bits e gera os sinais de controle para o restante do circuito.
4. **Unidade Lógica e Aritmética (ULA):** Realiza as operações matemáticas e de comparação.
5. **Banco de Registradores:** Registradores genéricos de 4 bits (ex: `RA`, `RB`, `RC`).
6. **Displays de Saída:** Exibição do valor contido em cada registrador.

---

## 📜 Conjunto de Instruções (ISA)

### Instruções Básicas

| Instrução | Sintaxe Exemplo | Descrição |
| :--- | :--- | :--- |
| **ADD** | `ADD RA, RB` / `ADD val, RA` | Soma o conteúdo de dois registradores ou um valor imediato ao registrador. |
| **SUB** | `SUB RA, RB` / `SUB val, RA` | Subtrai dois registradores ou um valor imediato de um registrador. |
| **MUL** | `MUL RA, RB` / `MUL val, RA` | Multiplica o valor de dois registradores ou de um valor imediato com um registrador. |
| **DIV** | `DIV RA, RB` / `DIV val, RA` | Divide o valor entre dois registradores ou por um valor imediato. |
| **MOV** | `MOV RA, RB` / `MOV val, RA` | Copia o conteúdo de um registrador para outro ou carrega um valor imediato. |
| **JMP** | `JMP end` | Altera a sequência de execução saltando incondicionalmente para o endereço especificado. |
| **RST** | `RST` | Zera todos os registradores e reinicia a execução no endereço `0x00`. |

### Instruções Avançadas

| Instrução | Sintaxe Exemplo | Descrição |
| :--- | :--- | :--- |
| **CMP** | `CMP RA, RB` | Compara o conteúdo de dois registradores e atualiza as flags da ULA. |
| **JZ** | `JZ end` / `JZ RA` | Salta para o endereço determinado se o conteúdo do registrador testado (ou flag) for Zero. |
| **JE** | `JE end` | Salta para o endereço determinado se o resultado da última comparação (`CMP`) for "Igual". |

---

## 🛠️ Configuração da Memória (`LPM_ROM`)

Para o correto funcionamento da memória no Quartus:
1. Adicione o componente `LPM_ROM`.
2. Nas **Propriedades do Símbolo**, desabilite as portas `inclock` e `memenab` (ajuste para `UNREGISTERED` na leitura assíncrona/direta conforme necessário).
3. Vincule um arquivo de inicialização de memória `.mif` pré-preenchido com as instruções em binário/hexadecimal.

---

## 🚀 Como Executar o Projeto

1. Abra o arquivo de projeto `.qpf` no **Intel / Altera Quartus Prime**.
2. Certifique-se de que o arquivo `.mif` com o programa em código de máquina está configurado no módulo `LPM_ROM`.
3. Compile o projeto (`Processing -> Start Compilation`).
4. Execute a simulação via **University Program VWF** ou faça o *download* para a placa de desenvolvimento (FPGA) conectando o clock e verificando as saídas nos displays.

---

## 👨‍💻 Autores e Créditos

* **Disciplina:** SSC0118 - Sistemas Digitais
* **Docente:** Prof. Denis F. Wolf
* **Instituição:** ICMC - Universidade de São Paulo (USP)