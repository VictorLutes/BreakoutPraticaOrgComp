# BreakoutPraticaOrgComp
Jogo e processador para a disciplina de Prática em Organisação de Computadores

Link explicativo do jogo: https://youtu.be/yIJ2XbERLA4


Instrução CMPI/CMPIMED:

    -cmpi r0, #0

Format: < inst(6) | Rx(3) | xxxxxxx >  + 16bit Numero

Faz o compare entre o registrador passado e o número passado, setando as flags

para essa instrução é necessário adicionar uma conexão a mais no M4 com o data out para receber a linha com os bits do número passado, como exemplificado nas linhas 679 e 680 do simuladorTemplate.c:

    // Se vou selecionar o data out no M4 devo fazer isso depois de carregar o M1
    if(selM4 == sDATA_OUT) M4=DATA_OUT; //VOU CRIAR UMA NOVA CONEXAO COM M4 PARA SELECIONAR O DATA OUT
