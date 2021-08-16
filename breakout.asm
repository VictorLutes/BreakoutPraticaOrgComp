;contato: victorclutes@gmail.com

jmp main
Msn0: string "V O C E   P E R D E U !!!"
Msn1: string "Quer jogar novamente? s ou n"
Msn2: string "V O C E   V E N C E U !!!"

Letra: var #1		; Contem a letra que foi digitada


posBar: var #1
posAntBar: var #1

posBola: var #1
posAntBola: var #1

bolaDirX: var #1
bolaDirY: var #1
bolaDirXNeg: var #1
bolaDirYNeg: var #1

FlagBloco1x1: var #1
FlagBloco1x2: var #1
FlagBloco1x3: var #1
FlagBloco1x4: var #1
FlagBloco1x5: var #1
FlagBloco1x6: var #1
FlagBloco1x7: var #1
FlagBloco1x8: var #1

FlagBloco2x1: var #1
FlagBloco2x2: var #1
FlagBloco2x3: var #1
FlagBloco2x4: var #1
FlagBloco2x5: var #1
FlagBloco2x6: var #1
FlagBloco2x7: var #1
FlagBloco2x8: var #1

FlagBloco3x1: var #1
FlagBloco3x2: var #1
FlagBloco3x3: var #1
FlagBloco3x4: var #1
FlagBloco3x5: var #1
FlagBloco3x6: var #1
FlagBloco3x7: var #1
FlagBloco3x8: var #1

FlagBloco4x1: var #1
FlagBloco4x2: var #1
FlagBloco4x3: var #1
FlagBloco4x4: var #1
FlagBloco4x5: var #1
FlagBloco4x6: var #1
FlagBloco4x7: var #1
FlagBloco4x8: var #1

posBlocoParaApagar: var #1

pontuacao : var #1
pontuacaoAnt: var #1
;Codigo principal
main:
	call ApagaTela
	loadn R1, #tela1Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #1536  			; cor branca!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira
    
	loadn R1, #tela2Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #512  			; cor branca!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira
    
	loadn R1, #tela3Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #2816   			; cor branca!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira

	loadn R1, #tela4Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #256   			; cor branca!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira
	
	loadn R1, #tela5Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #0   			; cor branca!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira
	

	loadn R1, #1175
	store posBar, R1
	store posAntBar, R1
	
	loadn R1, #285 
	store posBola, R1
	store posAntBola, R1
	
	loadn R1, #1
	store bolaDirX, R1
	
	loadn R1, #40
	store bolaDirY, R1
	
	loadn R1, #0
	store bolaDirXNeg, R1
	store bolaDirYNeg, R1
	
	loadn R1, #1
	store FlagBloco1x1, R1
	store FlagBloco1x2, R1
	store FlagBloco1x3, R1
	store FlagBloco1x4, R1
	store FlagBloco1x5, R1
	store FlagBloco1x6, R1
	store FlagBloco1x7, R1
	store FlagBloco1x8, R1
	
	store FlagBloco2x1, R1
	store FlagBloco2x2, R1
	store FlagBloco2x3, R1
	store FlagBloco2x4, R1
	store FlagBloco2x5, R1
	store FlagBloco2x6, R1
	store FlagBloco2x7, R1
	store FlagBloco2x8, R1
	
	store FlagBloco3x1, R1
	store FlagBloco3x2, R1
	store FlagBloco3x3, R1
	store FlagBloco3x4, R1
	store FlagBloco3x5, R1
	store FlagBloco3x6, R1
	store FlagBloco3x7, R1
	store FlagBloco3x8, R1
	
	store FlagBloco4x1, R1
	store FlagBloco4x2, R1
	store FlagBloco4x3, R1
	store FlagBloco4x4, R1
	store FlagBloco4x5, R1
	store FlagBloco4x6, R1
	store FlagBloco4x7, R1
	store FlagBloco4x8, R1
		
	loadn R1, #0
	store pontuacao, R1
	loadn R1, #1
	store pontuacaoAnt, R1
	
	Loop:
		loadn R1, #2
		mod R1, R0, R1
		cmp R1, R2		; if (mod(c/10)==0
		ceq MoveBar	; Chama Rotina de movimentacao da Nave
		
		loadn R1, #10
		mod R1, R0, R1
		cmp R1, R2		; if (mod(c/10)==0
		ceq MoveBola	; Chama Rotina de movimentacao da Nave
		
		loadn R1, #10
		mod R1, R0, R1
		cmp R1, R2		; if (mod(c/10)==0
		ceq PrintaPontuacao
		
		call Delay
		inc R0 	;c++
		jmp Loop
	
;Funcoes
;--------------------------
PrintaPontuacao:
	push r0
	push r1
	push r2
	
	load R1, pontuacao
	load R2, pontuacaoAnt
	cmp R1, R2
	jeq FimPrintaPontuacao
	
	store pontuacaoAnt, R1
	
	call printInt
	
	loadn R2, #32
	cmp R1, R2
	jeq FimDoJogo1
	
FimPrintaPontuacao:
	pop r2
	pop r1
	pop r0
	rts
	
printInt:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	
	loadn R0, #0
	load R1, pontuacao
	loadn R2, #10
	div R1, R1, R2
	loadn R2, #48
	add R1, R1, R2
	outchar R1, R0
	
	inc R0
	load R1, pontuacao
	loadn R2, #10
	mod R1, R1, R2
	loadn R2, #48
	add R1, R1, R2
	outchar R1, R0
	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts
;--------------------------
MoveBar:
	push r0
	push r1
	
	call MoveBarra_RecalculaPos

	; So' Apaga e Redesenha se (pos != posAnt)
;	If (posNave != posAntNave)	{	
	load r0, posBar
	load r1, posAntBar
	cmp r0, r1
	jeq MoveBarra_Skip
		call MoveBarra_Apaga
		call MoveBarra_Desenha		;}
  MoveBarra_Skip:
	
	pop r1
	pop r0
	rts

;--------------------------------
	
MoveBarra_Apaga:		; Apaga a Nave preservando o Cenario!
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5

	load R0, posAntBar	; R0 = posAnt
	
	; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!

	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
	loadn R4, #40
	div R3, R0, R4	; R3 = posAnt/40
	add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
	
	loadi R5, R2	; R5 = Char (Tela(posAnt))
	
	loadn R5, #' '
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	inc R0
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	inc R0
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	inc R0
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	inc R0
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts
;----------------------------------	
MoveBarra_Desenha:	; Desenha os caracteres da Barra
	push R0
	push R1
	
	Loadn R1, #'/'	; Barra
	load R0, posBar
	outchar R1, R0
	store posAntBar, R0	; Atualiza Posicao Anterior da Barra = Posicao Atual
	Loadn R1, #'<'	; Barra
	inc R0
	outchar R1, R0
	Loadn R1, #'_'	; Barra
	inc R0
	outchar R1, R0
	Loadn R1, #'>'	; Barra
	inc R0
	outchar R1, R0
	Loadn R1, #']'	; Barra
	inc R0
	outchar R1, R0
	
	pop R1
	pop R0
	rts

;----------------------------------
MoveBarra_RecalculaPos:		; Recalcula posicao da barra em funcao das Teclas pressionadas
	push R0
	push R1
	push R2
	push R3

	load R0, posBar
	
	inchar R1				; Le Teclado para controlar a barra
	loadn R2, #'a'
	cmp R1, R2
	jeq MoveBarra_RecalculaPos_A
	
	loadn R2, #'d'
	cmp R1, R2
	jeq MoveBarra_RecalculaPos_D
	
  MoveBarra_RecalculaPos_Fim:	; Se nao for nenhuma tecla valida, vai embora
	store posBar, R0
	pop R3
	pop R2
	pop R1
	pop R0
	rts

  MoveBarra_RecalculaPos_A:	; Move Nave para Esquerda
	loadn R1, #40
	loadn R2, #0
	mod R1, R0, R1		; Testa condicoes de Contorno 
	cmp R1, R2
	jeq MoveBarra_RecalculaPos_Fim
	dec R0	; pos = pos -1
	jmp MoveBarra_RecalculaPos_Fim
		
  MoveBarra_RecalculaPos_D:	; Move Nave para Direita	
	loadn R1, #40
	loadn R2, #35
	mod R1, R0, R1		; Testa condicoes de Contorno 
	cmp R1, R2
	jeq MoveBarra_RecalculaPos_Fim
	inc R0	; pos = pos + 1
	jmp MoveBarra_RecalculaPos_Fim
	
;----------------------------------
MoveBola:
	push r0
	push r1
	
	call MoveBola_RecalculaPos
	call MoveBola_Apaga
	call MoveBola_Desenha
	call MoveBola_Colisoes
	call MoveBola_ColisoesComBlocos
	pop r1
	pop r0
	rts

;----------------------------------
MoveBola_RecalculaPos:		; Recalcula posicao da barra em funcao das Teclas pressionadas
	push R0
	push R1
	push R2
	push R3
	
	load R0, posBola
	load R1, bolaDirX
	load R2, bolaDirY
	load R3, bolaDirXNeg
	load R4, bolaDirYNeg
	
	add R0, R0, R1
	add R0, R0, R2
	sub R0, R0, R3
	sub R0, R0, R4
	
	
	load R5, posBola
	loadn R2, #40
	mod R5, R5, R2;R5 guarda pos x
	add R5, R5, R1
	cmp R5, R2
	jeq MoveBola_SaiDaDireita
	cmp R5, R2
	jgr MoveBola_SaiDaDireita2
	
	load R5, posBola
	loadn R2, #40
	mod R5, R5, R2;R5 guarda pos x
	add R5, R5, R2
	sub R5, R5, R3
	loadn R2, #39
	cmp R5, R2
	jeq MoveBola_SaiDaEsquerda
	cmp R5, R2
	jle MoveBola_SaiDaEsquerda2
	jmp MoveBola_RecalculaPos_Fim
	
MoveBola_SaiDaDireita:
	dec R0
	jmp MoveBola_RecalculaPos_Fim
MoveBola_SaiDaDireita2:
	dec R0
	dec R0
	jmp MoveBola_RecalculaPos_Fim
	
MoveBola_SaiDaEsquerda:
	inc R0
	jmp MoveBola_RecalculaPos_Fim
MoveBola_SaiDaEsquerda2:
	inc R0
	inc R0
MoveBola_RecalculaPos_Fim:	
	store posBola, R0
	pop R3
	pop R2
	pop R1
	pop R0
	rts
;----------------------------------
MoveBola_Colisoes:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	
	loadn R1, #40
	
	load R0, posBola
	div R0, R0, R1
	loadn R2, #29
	cmp R0, R2
	jeq FimDoJogo
	
	load R0, posBola
	div R0, R0, R1
	loadn R2, #0
	cmp R0, R2
	ceq MoveBola_Teto
	
	load R0, posBola
	mod R0, R0, R1
	loadn R2, #0
	cmp R0, R2
	ceq MoveBola_ParedeEsquerda
	
	load R0, posBola
	mod R0, R0, R1
	loadn R2, #39
	cmp R0, R2
	ceq MoveBola_ParedeDireita
	
	load R0, posBola
	div R0, R0, R1
	loadn R2, #28
	cmp R0, R2
	ceq MoveBola_Barra
	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts
	
MoveBola_ParedeEsquerda:
	push R0
	
	load R0, bolaDirXNeg
	store bolaDirX, R0
	loadn R0, #0
	store bolaDirXNeg, R0
	
	pop R0
	rts
	
MoveBola_ParedeDireita:
	push R0
	
	load R0, bolaDirX
	store bolaDirXNeg, R0
	loadn R0, #0
	store bolaDirX, R0
	
	pop R0
	rts
	
MoveBola_Teto:
	push R0
	
	loadn R0, #40
	store bolaDirY, R0
	loadn R0, #0
	store bolaDirYNeg, R0
	
	pop R0
	rts
	
MoveBola_Barra:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	
	load R0, posBola
	load R1, posBar
	loadn R2, #40
	add R0, R2, R0
	cmp R0, R1
	jeq MoveBola_Barra_Colisao1
	inc R1
	cmp R0, R1
	jeq MoveBola_Barra_Colisao2
	inc R1
	cmp R0, R1
	jeq MoveBola_Barra_Colisao3
	inc R1
	cmp R0, R1
	jeq MoveBola_Barra_Colisao4
	inc R1
	cmp R0, R1
	jeq MoveBola_Barra_Colisao5
	
	jmp MoveBola_Barra_Skip
  MoveBola_Barra_Colisao1:
  	loadn R0, #0
	store bolaDirY, R0
	loadn R0, #40
	store bolaDirYNeg, R0
	
	loadn R0, #0
	store bolaDirX, R0
	loadn R0, #2
	store bolaDirXNeg, R0
	jmp MoveBola_Barra_Skip
	
  MoveBola_Barra_Colisao2:
  	loadn R0, #0
	store bolaDirY, R0
	loadn R0, #40
	store bolaDirYNeg, R0
	
  	loadn R0, #0
	store bolaDirX, R0
	loadn R0, #1
	store bolaDirXNeg, R0
	jmp MoveBola_Barra_Skip
	
  MoveBola_Barra_Colisao3:
  	loadn R0, #0
	store bolaDirY, R0
	loadn R0, #40
	store bolaDirYNeg, R0
	
	jmp MoveBola_Barra_Skip
	
  MoveBola_Barra_Colisao4:
  	loadn R0, #0
	store bolaDirY, R0
	loadn R0, #40
	store bolaDirYNeg, R0
	
  	loadn R0, #1
	store bolaDirX, R0
	loadn R0, #0
	store bolaDirXNeg, R0
	jmp MoveBola_Barra_Skip
	
  MoveBola_Barra_Colisao5:
	 loadn R0, #0
	store bolaDirY, R0
	loadn R0, #40
	store bolaDirYNeg, R0
	
  	loadn R0, #2
	store bolaDirX, R0
	loadn R0, #0
	store bolaDirXNeg, R0
	jmp MoveBola_Barra_Skip
	
  MoveBola_Barra_Skip:
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts
	
;----------------------------------
MoveBola_ColisoesComBlocos:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5

	load R1, posBola; R1 vai guardar pos Y
	loadn R2, #40
	div  R1, R1, R2
	loadn R2, #4
	cmp R1, R2
	ceq MoveBola_Colisoes_Linha1
	loadn R2, #3
	cmp R1, R2
	ceq MoveBola_Colisoes_Linha2
	loadn R2, #2
	cmp R1, R2
	ceq MoveBola_Colisoes_Linha3
	loadn R2, #1
	cmp R1, R2
	ceq MoveBola_Colisoes_Linha4
	

	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts

MoveBola_Colisoes_Linha1:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	
	load R0, posBola; R0 vai guardar pos X
	loadn R2, #40
	mod R0, R0, R2
	loadn R1, #5
	cmp R0, R1
	jle Bateu_Bloco1x1
	loadn R1, #10
	cmp R0, R1
	jle Bateu_Bloco1x2
	loadn R1, #15
	cmp R0, R1
	jle Bateu_Bloco1x3
	loadn R1, #20
	cmp R0, R1
	jle Bateu_Bloco1x4
	loadn R1, #25
	cmp R0, R1
	jle Bateu_Bloco1x5
	loadn R1, #30
	cmp R0, R1
	jle Bateu_Bloco1x6
	loadn R1, #35
	cmp R0, R1
	jle Bateu_Bloco1x7
	
	jmp Bateu_Bloco1x8
	
Bateu_Bloco1x1:
	loadn R1, #0
	load R2, FlagBloco1x1
	cmp R1, R2
	jeq fim_colisoes_linha1
	store FlagBloco1x1, R1
	loadn R1, #120
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha1
	
Bateu_Bloco1x2:
	loadn R1, #0
	load R2, FlagBloco1x2
	cmp R1, R2
	jeq fim_colisoes_linha1
	store FlagBloco1x2, R1
	loadn R1, #125
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha1
	
Bateu_Bloco1x3:
	loadn R1, #0
	load R2, FlagBloco1x3
	cmp R1, R2
	jeq fim_colisoes_linha1
	store FlagBloco1x3, R1
	loadn R1, #130
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha1
	
Bateu_Bloco1x4:
	loadn R1, #0
	load R2, FlagBloco1x4
	cmp R1, R2
	jeq fim_colisoes_linha1
	store FlagBloco1x4, R1
	loadn R1, #135
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha1
	
Bateu_Bloco1x5:
	loadn R1, #0
	load R2, FlagBloco1x5
	cmp R1, R2
	jeq fim_colisoes_linha1
	store FlagBloco1x5, R1
	loadn R1, #140
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha1

Bateu_Bloco1x6:
	loadn R1, #0
	load R2, FlagBloco1x6
	cmp R1, R2
	jeq fim_colisoes_linha1
	store FlagBloco1x6, R1
	loadn R1, #145
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha1
	
Bateu_Bloco1x7:
	loadn R1, #0
	load R2, FlagBloco1x7
	cmp R1, R2
	jeq fim_colisoes_linha1
	store FlagBloco1x7, R1
	loadn R1, #150
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha1
	
Bateu_Bloco1x8:
	loadn R1, #0
	load R2, FlagBloco1x8
	cmp R1, R2
	jeq fim_colisoes_linha1
	store FlagBloco1x8, R1
	loadn R1, #155
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha1
	
fim_colisoes_linha1:	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts

MoveBola_Colisoes_Linha2:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	
	load R0, posBola; R0 vai guardar pos X
	loadn R2, #40
	mod R0, R0, R2
	loadn R1, #5
	cmp R0, R1
	jle Bateu_Bloco2x1
	loadn R1, #10
	cmp R0, R1
	jle Bateu_Bloco2x2
	loadn R1, #15
	cmp R0, R1
	jle Bateu_Bloco2x3
	loadn R1, #20
	cmp R0, R1
	jle Bateu_Bloco2x4
	loadn R1, #25
	cmp R0, R1
	jle Bateu_Bloco2x5
	loadn R1, #30
	cmp R0, R1
	jle Bateu_Bloco2x6
	loadn R1, #35
	cmp R0, R1
	jle Bateu_Bloco2x7
	
	jmp Bateu_Bloco2x8
	
Bateu_Bloco2x1:
	loadn R1, #0
	load R2, FlagBloco2x1
	cmp R1, R2
	jeq fim_colisoes_linha2
	store FlagBloco2x1, R1
	loadn R1, #80
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha2
	
Bateu_Bloco2x2:
	loadn R1, #0
	load R2, FlagBloco2x2
	cmp R1, R2
	jeq fim_colisoes_linha2
	store FlagBloco2x2, R1
	loadn R1, #85
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha2
	
Bateu_Bloco2x3:
	loadn R1, #0
	load R2, FlagBloco2x3
	cmp R1, R2
	jeq fim_colisoes_linha2
	store FlagBloco2x3, R1
	loadn R1, #90
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha2
	
Bateu_Bloco2x4:
	loadn R1, #0
	load R2, FlagBloco2x4
	cmp R1, R2
	jeq fim_colisoes_linha2
	store FlagBloco2x4, R1
	loadn R1, #95
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha2
	
Bateu_Bloco2x5:
	loadn R1, #0
	load R2, FlagBloco2x5
	cmp R1, R2
	jeq fim_colisoes_linha2
	store FlagBloco2x5, R1
	loadn R1, #100
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha2

Bateu_Bloco2x6:
	loadn R1, #0
	load R2, FlagBloco2x6
	cmp R1, R2
	jeq fim_colisoes_linha2
	store FlagBloco2x6, R1
	loadn R1, #105
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha2
	
Bateu_Bloco2x7:
	loadn R1, #0
	load R2, FlagBloco2x7
	cmp R1, R2
	jeq fim_colisoes_linha2
	store FlagBloco2x7, R1
	loadn R1, #110
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha2
	
Bateu_Bloco2x8:
	loadn R1, #0
	load R2, FlagBloco2x8
	cmp R1, R2
	jeq fim_colisoes_linha2
	store FlagBloco2x8, R1
	loadn R1, #115
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha2
	
fim_colisoes_linha2:	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts
	
MoveBola_Colisoes_Linha3:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	
	load R0, posBola; R0 vai guardar pos X
	loadn R2, #40
	mod R0, R0, R2
	loadn R1, #5
	cmp R0, R1
	jle Bateu_Bloco3x1
	loadn R1, #10
	cmp R0, R1
	jle Bateu_Bloco3x2
	loadn R1, #15
	cmp R0, R1
	jle Bateu_Bloco3x3
	loadn R1, #20
	cmp R0, R1
	jle Bateu_Bloco3x4
	loadn R1, #25
	cmp R0, R1
	jle Bateu_Bloco3x5
	loadn R1, #30
	cmp R0, R1
	jle Bateu_Bloco3x6
	loadn R1, #35
	cmp R0, R1
	jle Bateu_Bloco3x7
	
	jmp Bateu_Bloco3x8
	
Bateu_Bloco3x1:
	loadn R1, #0
	load R2, FlagBloco3x1
	cmp R1, R2
	jeq fim_colisoes_linha3
	store FlagBloco3x1, R1
	loadn R1, #40
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha3
	
Bateu_Bloco3x2:
	loadn R1, #0
	load R2, FlagBloco3x2
	cmp R1, R2
	jeq fim_colisoes_linha3
	store FlagBloco3x2, R1
	loadn R1, #45
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha3
	
Bateu_Bloco3x3:
	loadn R1, #0
	load R2, FlagBloco3x3
	cmp R1, R2
	jeq fim_colisoes_linha3
	store FlagBloco3x3, R1
	loadn R1, #50
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha3
	
Bateu_Bloco3x4:
	loadn R1, #0
	load R2, FlagBloco3x4
	cmp R1, R2
	jeq fim_colisoes_linha3
	store FlagBloco3x4, R1
	loadn R1, #55
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha3
	
Bateu_Bloco3x5:
	loadn R1, #0
	load R2, FlagBloco3x5
	cmp R1, R2
	jeq fim_colisoes_linha3
	store FlagBloco3x5, R1
	loadn R1, #60
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha3

Bateu_Bloco3x6:
	loadn R1, #0
	load R2, FlagBloco3x6
	cmp R1, R2
	jeq fim_colisoes_linha3
	store FlagBloco3x6, R1
	loadn R1, #65
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha3
	
Bateu_Bloco3x7:
	loadn R1, #0
	load R2, FlagBloco3x7
	cmp R1, R2
	jeq fim_colisoes_linha3
	store FlagBloco3x7, R1
	loadn R1, #70
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha3
	
Bateu_Bloco3x8:
	loadn R1, #0
	load R2, FlagBloco3x8
	cmp R1, R2
	jeq fim_colisoes_linha3
	store FlagBloco3x8, R1
	loadn R1, #75
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha3
	
fim_colisoes_linha3:	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts
	
MoveBola_Colisoes_Linha4:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	
	load R0, posBola; R0 vai guardar pos X
	loadn R2, #40
	mod R0, R0, R2
	loadn R1, #5
	cmp R0, R1
	jle Bateu_Bloco4x1
	loadn R1, #10
	cmp R0, R1
	jle Bateu_Bloco4x2
	loadn R1, #15
	cmp R0, R1
	jle Bateu_Bloco4x3
	loadn R1, #20
	cmp R0, R1
	jle Bateu_Bloco4x4
	loadn R1, #25
	cmp R0, R1
	jle Bateu_Bloco4x5
	loadn R1, #30
	cmp R0, R1
	jle Bateu_Bloco4x6
	loadn R1, #35
	cmp R0, R1
	jle Bateu_Bloco4x7
	
	jmp Bateu_Bloco4x8
	
Bateu_Bloco4x1:
	loadn R1, #0
	load R2, FlagBloco4x1
	cmp R1, R2
	jeq fim_colisoes_linha4
	store FlagBloco4x1, R1
	loadn R1, #0
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha4
	
Bateu_Bloco4x2:
	loadn R1, #0
	load R2, FlagBloco4x2
	cmp R1, R2
	jeq fim_colisoes_linha4
	store FlagBloco4x2, R1
	loadn R1, #5
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha4
	
Bateu_Bloco4x3:
	loadn R1, #0
	load R2, FlagBloco4x3
	cmp R1, R2
	jeq fim_colisoes_linha4
	store FlagBloco4x3, R1
	loadn R1, #10
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha4
	
Bateu_Bloco4x4:
	loadn R1, #0
	load R2, FlagBloco4x4
	cmp R1, R2
	jeq fim_colisoes_linha4
	store FlagBloco4x4, R1
	loadn R1, #15
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha4
	
Bateu_Bloco4x5:
	loadn R1, #0
	load R2, FlagBloco4x5
	cmp R1, R2
	jeq fim_colisoes_linha4
	store FlagBloco4x5, R1
	loadn R1, #20
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha4

Bateu_Bloco4x6:
	loadn R1, #0
	load R2, FlagBloco4x6
	cmp R1, R2
	jeq fim_colisoes_linha4
	store FlagBloco4x6, R1
	loadn R1, #25
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha4
	
Bateu_Bloco4x7:
	loadn R1, #0
	load R2, FlagBloco4x7
	cmp R1, R2
	jeq fim_colisoes_linha4
	store FlagBloco4x7, R1
	loadn R1, #30
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha4
	
Bateu_Bloco4x8:
	loadn R1, #0
	load R2, FlagBloco4x8
	cmp R1, R2
	jeq fim_colisoes_linha4
	store FlagBloco4x8, R1
	loadn R1, #35
	store posBlocoParaApagar, R1
	call MoveBola_ApagaBlocos
	call MoveBola_Teto
	jmp fim_colisoes_linha4
	
fim_colisoes_linha4:	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts

MoveBola_ApagaBlocos:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	
	load R3, pontuacao
	inc R3
	store pontuacao, R3
	
	load R0, posBlocoParaApagar
	Loadn R1, #' '
	outchar R1, R0
	inc R0
	outchar R1, R0
	inc R0
	outchar R1, R0
	inc R0
	outchar R1, R0
	inc R0
	outchar R1, R0

	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts
;----------------------------------

MoveBola_Apaga:		; Apaga a Nave preservando o Cenario!
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5

	load R0, posAntBola	; R0 = posAnt
	loadn R5, #' '	
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts
;----------------------------------	
MoveBola_Desenha:	; Desenha os caracteres da Barra
	push R0
	push R1
	
	Loadn R1, #'O'	; Barra
	load R0, posBola
	outchar R1, R0
	store posAntBola, R0	; Atualiza Posicao Anterior da Barra = Posicao Atual
	
	pop R1
	pop R0
	rts




;----------------------------------
FimDoJogo:
	; Limpa a Tela !!
  	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #0  			; cor branca!
	call ImprimeTela   		;  Rotina de Impresao de Cenario na Tela Inteira
  
	;imprime Voce Venceu !!!
	loadn r0, #526
	loadn r1, #Msn0
	loadn r2, #0
	call ImprimeStr
	
	;imprime quer jogar novamente
	loadn r0, #605
	loadn r1, #Msn1
	loadn r2, #0
	call ImprimeStr

	Fim_Loop:	
	call DigLetra
	loadn r0, #'n'
	load r1, Letra
	cmp r0, r1				; tecla == 'n' ?
	jeq Acabou	; tecla e' 'n'
	
	loadn r0, #'s'
	cmp r0, r1				; tecla == 's' ?
	jne Fim_Loop	; tecla nao e' 's'
	
	
	
	; Se quiser jogar novamente...
	call ApagaTela
	
	pop r2
	pop r1
	pop r0

	pop r0	; Da um Pop a mais para acertar o ponteiro da pilha, pois nao vai dar o RTS !!
	jmp main
;----------------------------------
FimDoJogo1:
	; Limpa a Tela !!
  	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #0  			; cor branca!
	call ImprimeTela   		;  Rotina de Impresao de Cenario na Tela Inteira
  
	;imprime Voce Venceu !!!
	loadn r0, #526
	loadn r1, #Msn2
	loadn r2, #0
	call ImprimeStr
	
	;imprime quer jogar novamente
	loadn r0, #605
	loadn r1, #Msn1
	loadn r2, #0
	call ImprimeStr

	Fim_Loop:	
	call DigLetra
	loadn r0, #'n'
	load r1, Letra
	cmp r0, r1				; tecla == 'n' ?
	jeq Acabou	; tecla e' 'n'
	
	loadn r0, #'s'
	cmp r0, r1				; tecla == 's' ?
	jne Fim_Loop	; tecla nao e' 's'
	
	
	
	; Se quiser jogar novamente...
	call ApagaTela
	
	pop r2
	pop r1
	pop r0

	pop r0	; Da um Pop a mais para acertar o ponteiro da pilha, pois nao vai dar o RTS !!
	jmp main
	
 Acabou:
	call ApagaTela
	halt

;----------------------------------

;********************************************************
;                       DELAY
;********************************************************		


Delay:
						;Utiliza Push e Pop para nao afetar os Ristradores do programa principal
	Push R0
	Push R1
	
	Loadn R1, #50  ; a
   Delay_volta2:				;Quebrou o contador acima em duas partes (dois loops de decremento)
	Loadn R0, #3000	; b
   Delay_volta: 
	Dec R0					; (4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	JNZ Delay_volta	
	Dec R1
	JNZ Delay_volta2
	
	Pop R1
	Pop R0
	
	RTS							;return

;-------------------------------


;********************************************************
;                       IMPRIME TELA
;********************************************************	

ImprimeTela: 	;  Rotina de Impresao de Cenario na Tela Inteira
		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r4 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	
   ImprimeTela_Loop:
		call ImprimeStr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela_Loop	; Enquanto r0 < 1200

	pop r5	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
				
;---------------------

;---------------------------	
;********************************************************
;                   IMPRIME STRING
;********************************************************
	
ImprimeStr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

   ImprimeStr_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr_Sai
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		jmp ImprimeStr_Loop
	
   ImprimeStr_Sai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
;------------------------	
	

;-------------------------------


;********************************************************
;                       IMPRIME TELA2
;********************************************************	

ImprimeTela2: 	;  Rotina de Impresao de Cenario na Tela Inteira
		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	loadn R6, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	
   ImprimeTela2_Loop:
		call ImprimeStr2
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		add r6, r6, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela2_Loop	; Enquanto r0 < 1200

	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
				
;---------------------

;---------------------------	
;********************************************************
;                   IMPRIME STRING2
;********************************************************
	
ImprimeStr2:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina
	
	
	loadn r3, #'\0'	; Criterio de parada
	loadn r5, #' '	; Espaco em Branco

   ImprimeStr2_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr2_Sai
		cmp r4, r5		; If (Char == ' ')  vai Pula outchar do espaco para na apagar outros caracteres
		jeq ImprimeStr2_Skip
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
   		storei r6, r4
   ImprimeStr2_Skip:
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		inc r6
		jmp ImprimeStr2_Loop
	
   ImprimeStr2_Sai:	
	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	

;------------------------		
;********************************************************
;                   DIGITE UMA LETRA
;********************************************************

DigLetra:	; Espera que uma tecla seja digitada e salva na variavel global "Letra"
	push r0
	push r1
	loadn r1, #255	; Se nao digitar nada vem 255

   DigLetra_Loop:
		inchar r0			; Le o teclado, se nada for digitado = 255
		cmp r0, r1			;compara r0 com 255
		jeq DigLetra_Loop	; Fica lendo ate' que digite uma tecla valida

	store Letra, r0			; Salva a tecla na variavel global "Letra"

	pop r1
	pop r0
	rts



;----------------
	
;********************************************************
;                       APAGA TELA
;********************************************************
ApagaTela:
	push r0
	push r1
	
	loadn r0, #1200		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	
	   ApagaTela_Loop:	;;label for(r0=1200;r3>0;r3--)
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
 
	pop r1
	pop r0
	rts	
	
;------------------------	
; Declara uma tela vazia para ser preenchida em tempo de execussao:

tela0Linha0  : string "                                        "
tela0Linha1  : string "                                        "
tela0Linha2  : string "                                        "
tela0Linha3  : string "                                        "
tela0Linha4  : string "                                        "
tela0Linha5  : string "                                        "
tela0Linha6  : string "                                        "
tela0Linha7  : string "                                        "
tela0Linha8  : string "                                        "
tela0Linha9  : string "                                        "
tela0Linha10 : string "                                        "
tela0Linha11 : string "                                        "
tela0Linha12 : string "                                        "
tela0Linha13 : string "                                        "
tela0Linha14 : string "                                        "
tela0Linha15 : string "                                        "
tela0Linha16 : string "                                        "
tela0Linha17 : string "                                        "
tela0Linha18 : string "                                        "
tela0Linha19 : string "                                        "
tela0Linha20 : string "                                        "
tela0Linha21 : string "                                        "
tela0Linha22 : string "                                        "
tela0Linha23 : string "                                        "
tela0Linha24 : string "                                        "
tela0Linha25 : string "                                        "
tela0Linha26 : string "                                        "
tela0Linha27 : string "                                        "
tela0Linha28 : string "                                        "
tela0Linha29 : string "                                        "	

; Declara e preenche tela linha por linha (40 caracteres):
tela1Linha0  : string "########################################"
tela1Linha1  : string "                                        "
tela1Linha2  : string "                                        "
tela1Linha3  : string "                                        "
tela1Linha4  : string "                                        "
tela1Linha5  : string "                                        "
tela1Linha6  : string "                                        "
tela1Linha7  : string "                                        "
tela1Linha8  : string "                                        "
tela1Linha9  : string "                                        "
tela1Linha10 : string "                                        "
tela1Linha11 : string "                                        "
tela1Linha12 : string "                                        "
tela1Linha13 : string "                                        "
tela1Linha14 : string "                                        "
tela1Linha15 : string "                                        "
tela1Linha16 : string "                                        "
tela1Linha17 : string "                                        "
tela1Linha18 : string "                                        "
tela1Linha19 : string "                                        "
tela1Linha20 : string "                                        "
tela1Linha21 : string "                                        "
tela1Linha22 : string "                                        "
tela1Linha23 : string "                                        "
tela1Linha24 : string "                                        "
tela1Linha25 : string "                                        "
tela1Linha26 : string "                                        "
tela1Linha27 : string "                                        "
tela1Linha28 : string "                                        "
tela1Linha29 : string "                                        "



; Declara e preenche tela linha por linha (40 caracteres):
tela2Linha0  : string "                                        "
tela2Linha1  : string "########################################"
tela2Linha2  : string "                                        "
tela2Linha3  : string "                                        "
tela2Linha4  : string "                                        "
tela2Linha5  : string "                                        "
tela2Linha6  : string "                                        "
tela2Linha7  : string "                                        "
tela2Linha8  : string "                                        "
tela2Linha9  : string "                                        "
tela2Linha10 : string "                                        "
tela2Linha11 : string "                                        "
tela2Linha12 : string "                                        "
tela2Linha13 : string "                                        "
tela2Linha14 : string "                                        "
tela2Linha15 : string "                                        "
tela2Linha16 : string "                                        "
tela2Linha17 : string "                                         "
tela2Linha18 : string "                                        "
tela2Linha19 : string "                                        "
tela2Linha20 : string "                                        "
tela2Linha21 : string "                                        "
tela2Linha22 : string "                                        "
tela2Linha23 : string "                                        "
tela2Linha24 : string "                                        "
tela2Linha25 : string "                                        "
tela2Linha26 : string "                                        "
tela2Linha27 : string "                                        "
tela2Linha28 : string "                                        "
tela2Linha29 : string "                                        "


; Declara e preenche tela linha por linha (40 caracteres):
tela3Linha0  : string "                                        "
tela3Linha1  : string "                                        "
tela3Linha2  : string "########################################"
tela3Linha3  : string "                                        "
tela3Linha4  : string "                                        "
tela3Linha5  : string "                                        "
tela3Linha6  : string "                                        "
tela3Linha7  : string "                                        "
tela3Linha8  : string "                                        "
tela3Linha9  : string "                                        "
tela3Linha10 : string "                                        "
tela3Linha11 : string "                                        "
tela3Linha12 : string "                                        "
tela3Linha13 : string "                                        "
tela3Linha14 : string "                                        "
tela3Linha15 : string "                                        "
tela3Linha16 : string "                                        "
tela3Linha17 : string "                                        "
tela3Linha18 : string "                                        "
tela3Linha19 : string "                                        "
tela3Linha20 : string "                                        "
tela3Linha21 : string "                                        "
tela3Linha22 : string "                                        "
tela3Linha23 : string "                                        "
tela3Linha24 : string "                                        "
tela3Linha25 : string "                                        "
tela3Linha26 : string "                                        "
tela3Linha27 : string "                                        "
tela3Linha28 : string "                                        "
tela3Linha29 : string "                                        "



tela4Linha0  : string "                                        "
tela4Linha1  : string "                                        "
tela4Linha2  : string "                                        "
tela4Linha3  : string "########################################"
tela4Linha4  : string "                                        "
tela4Linha5  : string "                                        "
tela4Linha6  : string "                                        "
tela4Linha7  : string "                                        "
tela4Linha8  : string "                                        "
tela4Linha9  : string "                                        "
tela4Linha10 : string "                                        "
tela4Linha11 : string "                                        "
tela4Linha12 : string "                                        "
tela4Linha13 : string "                                        "
tela4Linha14 : string "                                        "
tela4Linha15 : string "                                        "
tela4Linha16 : string "                                        "
tela4Linha17 : string "                                        "
tela4Linha18 : string "                                        "
tela4Linha19 : string "                                        "
tela4Linha20 : string "                                        "
tela4Linha21 : string "                                        "
tela4Linha22 : string "                                        "
tela4Linha23 : string "                                        "
tela4Linha24 : string "                                        "
tela4Linha25 : string "                                        "
tela4Linha26 : string "                                        "
tela4Linha27 : string "                                        "
tela4Linha28 : string "                                        "
tela4Linha29 : string "                                        "

tela5Linha0  : string "                                        "
tela5Linha1  : string "                                        "
tela5Linha2  : string "                                        "
tela5Linha3  : string "                                        "
tela5Linha4  : string "                                        "
tela5Linha5  : string "                                        "
tela5Linha6  : string "                                        "
tela5Linha7  : string "                                        "
tela5Linha8  : string "                                        "
tela5Linha9  : string "                                        "
tela5Linha10 : string "                                        "
tela5Linha11 : string "                                        "
tela5Linha12 : string "                                        "
tela5Linha13 : string "                                        "
tela5Linha14 : string "                                        "
tela5Linha15 : string "                                        "
tela5Linha16 : string "                                        "
tela5Linha17 : string "                                        "
tela5Linha18 : string "                                        "
tela5Linha19 : string "                                        "
tela5Linha20 : string "                                        "
tela5Linha21 : string "                                        "
tela5Linha22 : string "                                        "
tela5Linha23 : string "                                        "
tela5Linha24 : string "                                        "
tela5Linha25 : string "                                        "
tela5Linha26 : string "                                        "
tela5Linha27 : string "                                        "
tela5Linha28 : string "                                        "
tela5Linha29 : string "               /<_>]                    "
