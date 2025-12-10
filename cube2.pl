cube :-
    write('Next item, please: '),
    read(X),
    process(X).

process(stop) :- !.

process(N) :-
    C is N * N * N,
    write('Cube of'), write(N), write(' is '),
    write(C), nl,
    cube.

writelist([]).
writelist([X | L]) :-
    write(X), nl,
    writelist(L).

writelist2([[a,b,c], [d,e,f], [g,h,i]]).
writelist2([L | LL]) :-
    doline(L), nl,
    writelist(LL).

doline([]).
doline([X | L]) :-
    write(X), tab(1),
    doline(L).