# Public Tests
The tests provided by the professor.

## Summary

### Entrega Intermédia
* 001 - Menu só com algumas opções
* 002 - Menu inicial com as opções todas
* 003 - Ver todos os menus
* 004 - Ver o conteúdo de duas células (uma de cada vez) que têm literais
* 005 - Ver conteúdo de intervalo horizontal com inteiros
* 006 - Ver conteúdo de intervalo vertical com inteiros
* 007 - Ver o conteúdo de uma gama inválida (com dimensão maior que folha)
* 008 - Ver conteúdo de uma gama com apenas uma célula
* 009 - Guardar "saved09"
* 010 - Abrir "saved09" e ver duas células que têm literais
* 011 - Ver célula vazia
* 012 - Ver gama inválida, não é um intervalo vertical ou horizontal
* 013 - Ver referência para célula com um inteiro
* 014 - Ver gama de células que refere células com referências e literais
* 015 - Ver célula que refere referência para uma célula vazia
* 016 - Ver célula com referência para outra célula com uma referência para uma célula com inteiro
* 017 - Ver célula com referência para outra célula com uma referência para uma célula vazia
* 018 - Guardar folha com literais e referências
* 019 - Abrir folha e ver duas células
* 020 - Testar o New e ver uma célula que fique vazia
* 021 - Ver célula com função ADD(referência, número)
* 022 - Ver célula com função SUB(número,número)
* 023 - Ver célula que refere função MUL(referência,referência)
* 024 - Ver cálula que refere função DIV(número,referência) e guarda
* 025 - Abrir e ver célula com função
* 101 - Ver células com inteiros e strings
* 102 - Ver célula com função com referência para célula vazia
* 103 - Ver célula com uma função com uma referência para célula vazia
* 104 - Ver célula com uma função com uma referência para célula com string
* 105 - Ver célula com com função para uma referência para uma célula com uma função que tem valor inválido

### Procura por valor
* 026 - procura por valor existente num literal 
* 027 - procura por valor existente num literal e referencia
* 029 - procura por valor não existente em literal, funcão binária e referencia
* 122 - procura por string em função

### Procura por função
* 031 - procura por função binária ADD (existente)
* 032 - procura por função binária DIV (não existente)
* 034 - procura por função SUB (existente em várias posições)
* 091 - procura  por função com nome igual a valor existente num literal e referencia
* 124 - Procura por função cujo nome contém a string de pesquisa no início  

### Funções intervalo
* 035 - Mostra valor de função intervalo AVERAGE de linha válida
* 036 - Mostra valor de função intervalo AVERAGE de coluna válida 
* 038 - Mostra valor de função intervalo AVERAGE com referência por uma célula sem valor
* 039 - Mostra valor de uma função binária para uma função binária sem valor
* 111 - Mostra Concat de gama só com cadeias de caracteres  
* 114 - Mostra COASLECE de gama só com cadeias de caracteres 
* 115 - Mostra COASLECE de gama com cadeias de caracteres, inteiros e vazio

### Inserir
* 040 - Inserir um literal e ver o valor
* 041 - Inserir uma referência para um literal
* 044 - Inserir uma função PRODUCT
* 045 - Inserir literal num intervalo vertical
* 046 - Inserir SUB(1;1,3)  num intervalo horizontal
* 108 - Inserir uma cadeia de caracteres e ver o valor 

### Alterar
* 047 - Alterar literal e ver a referência para ele com novo valor
* 048 - Alterar literal e ver a referência para ele com novo valor e referência para esta referência também com novo valor
* 049 - Alterar contéudo de (2;2) e ver que função ADD(2,2;3) muda
* 127 - Ter função inválida e torná-la válida

### Copiar
* 053 - Copiar uma célula com um literal e ver
* 054 - Copiar uma linha com um literais e referências e ver
* 056 - Copiar uma gama inválida
* 057 - Copiar uma linha com funções e literais e ver
* 058 - Copiar uma linha vazia e ver

### Apagar
* 061 - Apagar um literal e ver
* 062 - Apagar uma linha com literais e referências e ver
* 064 - Apagar uma linha vazia e ver

### Save/new
* 074 - Testar o New depois de um guardar
* 075 - Testar o New com uma folha alterada
* 076 - Ver que a folha alterada foi guardada
* 120 - Guarda função intervalo. Cria nova. Abre a anterior

### Cortar
* 066 - Cortar uma célula com um literal e ver folha e cut buffer
* 067 - Cortar uma linha com um literais e referências e ver folha e cut buffer

### Colar
* 072 - colar uma linha para uma posição
* 080 - colar uma coluna para uma posição que passa limite da folha
* 081 - colar uma coluna para uma linha
* 083 - colar cut buffer com linha vazia para uma linha com dimensão igual
* 089 - Visualiza uma linha de células que não foram inicializadas
* 090 - colar uma posição numa posição
