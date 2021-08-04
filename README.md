# BreakoutPraticaOrgComp
Jogo e processador para a disciplina de Prática em Organisação de Computadores

Link explicativo do jogo: https://youtu.be/yIJ2XbERLA4


Instrução CMPI/CMPIMED:

    -cmpi r0, #0

Format: < inst(6) | Rx(3) | xxxxxxx >  + 16bit Numero

Faz o compare entre o registrador passado e o número passado, setando as flags

	case CMPIMED: 
			selM3 = sDATA_OUT; //VOU CRIAR UMA NOVA CONEXAO COM M3 PARA SELECIONAR O DATA OUT
			selM1 = sPC;
			RW=0;
			selM4 = rx;
			IncPC = 1;
			OP = CMPIMED;
			LoadFR = 1;
			// -----------------------------
			state=STATE_FETCH;
			break;

para essa instrução é necessário adicionar uma conexão a mais no M4 com o data out para receber a linha com os bits do número passado, como exemplificado na linha 734 do simuladorTemplate.c:

    if(selM3 == 8) M3 = temp;  // Seleciona com 8 o FR
	else if(selM3 == sDATA_OUT) M3=DATA_OUT; //VOU CRIAR UMA NOVA CONEXAO COM M3 PARA SELECIONAR O DATA OUT
	else M3 = reg[selM3]; 
com isso, estou passando o valor imediato no M3 e o registrador no M4 entao preciso considerar essa inversão no x e y passados para a ULA usando um novo OPCODE: CMPIMED, que faz o mesmo que o CMP, mas com o x e y invertidos:

	else if(OP==CMPIMED)
			{
				result = y;
				if(y>x){
					auxFRbits[GREATER] = 1;
					auxFRbits[LESSER] = 0;
					auxFRbits[EQUAL] = 0;
				}else if(y<x){
					auxFRbits[GREATER] = 0;
					auxFRbits[LESSER] = 1;
					auxFRbits[EQUAL] = 0;
				}else if(x==y){
					auxFRbits[GREATER] = 0;
					auxFRbits[LESSER] = 0;
					auxFRbits[EQUAL] = 1;
				}
			}
