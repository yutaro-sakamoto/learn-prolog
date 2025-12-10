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

bars([N | L]) :-
    stars(N), nl,
    bars(L).

stars(N) :-
    N > 0,
    write(*),
    N1 is N - 1,
    stars(N1).

stars(N) :-
    N =< 0.

processfile :-
    read(Term),
    process1(Term).

process1(end_of_file) :- !.

process1(Term) :-
    treat(Term),
    processfile.

showfile(N) :-
    read(Term),
    show(Term, N).

show(end_of_file, _) :- !.

show(Term, N) :-
    write(N), tab(2), write(Term),
    N1 is N + 1,
    showfile(N1).
