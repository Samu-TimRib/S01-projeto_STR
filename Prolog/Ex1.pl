alto_impacto(AI) :-

    disciplina(AI, Creditos, _),
    Creditos > 5,
    prerequisito(D1, AI),
    prerequisito(D2, AI),
    D1 \= D2.

% Query: % ?- disciplina(D, 4, matematica), \+ prerequisito(_, D).
