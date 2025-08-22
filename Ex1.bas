10 INPUT "Digite a primeira nota: "; NOTA1
20 INPUT "Digite a segunda nota: "; NOTA2
30 MEDIA = (VAL(NOTA1) + VAL(NOTA2)) / 2
40 IF MEDIA >= 60 THEN PRINT "Aprovado direto"
50 IF MEDIA < 30 THEN PRINT "Reprovado direto"
60 IF MEDIA < 60 AND MEDIA >= 30 THEN INPUT "Digite a nota da NP3: "; NOTA3
70 IF MEDIA < 60 AND MEDIA >= 30 THEN MEDIA = (VAL(NOTA1) + VAL(NOTA2) + VAL(NOTA3)) / 3
80 IF MEDIA < 60 AND MEDIA >= 30 THEN IF MEDIA >= 50 THEN PRINT "Aprovado pela NP3" ELSE PRINT "Reprovado na NP3"
