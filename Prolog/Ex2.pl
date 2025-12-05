falta_concluir(Aluno, Disciplina) :-

    prerequisito(_, Disciplina),
    \+ concluiu(Aluno, Disciplina).
    

aluno_apto(Aluno, Disciplina) :-

    disciplina(Disciplina, _, Area),
    Area \= fundamental,
    \+ (prerequisito(Disciplina, PreReq),
        \+ concluiu(Aluno, PreReq)).
% Query % ?- aluno_apto(joao, D).

% Query % ?- aluno_apto(maria, inteligencia_artificial).
