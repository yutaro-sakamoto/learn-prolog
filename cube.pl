cube :-
    read(X),
    process(X).

process(stop) :- !.
process(N) :-
    C is N * N * N,
    write(C), nl,
    cube.