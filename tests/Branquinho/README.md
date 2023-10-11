Explicação dos Testes:

Testes:
06: É o 9 do stor, só para garantir que têm o ficheiro saved para mais tarde
13: Testa a função ADD (uma referência e um inteiro)
14: Testa a função SUB (com dois inteiros)
15: Testa a função DIV (com uma referência e um inteiro)
16: Testa uma célula que contém uma referência para uma célula que tem função
17: Testa uma função que recebe 2 referências que são funções também
18: Testa uma função em que um dos argumentos é inválido (célula vazia)
19: Testa a função ADD (dois inteiros)
20: Testa a função ADD (um inteiro e uma referência)
21: Testa a função ADD (duas referências)
22: Testa a função SUB (uma referência e um inteiro)
23: Testa a função SUB (um inteiro e uma referência)
24: Testa a função SUB (duas referências, com resultado 0)
25: Testa a função MUL (dois inteiros)
26: Testa a função MUL (uma referência e um inteiro)
27: Testa a função MUL (um inteiro e uma referência)
28: Testa a função DIV (dois inteiros)
29: Testa a função DIV (um inteiro e uma referência)
30: Testa a função DIV (duas referências)
31: Testa a função DIV (divisão por 0, suposto dar #VALUE)
32: Testa a função MUL (com uma célula que não existe, suposto dar #VALUE)
33: Testa o import de uma célula com valor negativo
34: Testa a função ADD (uma referência e uma referência da referência anterior) /Irell/
35: Testa a função MUL com a referência de uma referência (de uma string, suposto dar #VALUE) /Irell/
36: Testa a referência de referência (de uma string) /Irell/
37: Testa a visualização de uma célula com uma string(que é só a plica) /Irell/
38: Todas as células formam uma cadeia de referências, e testa-se a visualização do início da cadeia
39: Testa a visualização de uma linha com vários tipos de célula
40: Testa a visualização de uma coluna com vários tipos de célula
41: Testa a visualização de todas as células, uma a uma com vários tipos de célula
42: Testa uma função que recebe referências para outras funções
43: Testa o guardar e criar uma nova spreadsheet logo a seguir(não deve pedir para guardar antes de sair)
44: Testa o import de uma spreadsheet com uma célula vazia(explícita) e visualiza-a
45: Testa o abrir e criar uma nova spreadsheet logo a seguir(mesmo do 43)
46: Testa o abrir com FileOpenFailedException
47: Testa a visualização de uma linha quando a gama é inserida ao contrário