disciplina_raiz(D) :-

    disciplina(D, _, _),
    \+ prerequisito(D, _).

disciplina_folha(D) :-

    disciplina(D, _, _),
    \+ prerequisito(_, D).

% Query: % ?- disciplina_raiz(D), disciplina(D, _, Area), Area \= aplicacoes.
