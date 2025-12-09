f(X, 0) :- X < 3, !.
f(X, 2) :- 3 =< X, X < 6, !.
f(X, 4) :- 6 =< X.

mymax(X, Y, X) :- X >= Y, !.
mymax(_, Y, Y).

member(X, [X | _]) :- !.
member(X, [_ | L]) :- member(X, L).

add(X, L, L) :- member(X, L), !.
add(X, L, [X | L]).

beat(tom, jin).
beat(ann, tom).
beat(pat, jim).

class(X, fighter) :-
    beat(X, _),
    beat(_, X), !.

class(X, winner) :-
    beat(X, _), !.

class(X, sportsman) :-
    beat(_, X).

likes(mary, X) :-
    snake(X), !, fail.

likes(mary, X) :-
    animal(X).

run_tests :-
    \+ (f(1, Y), 2 < Y),
    mymax(1, 2, 2),
    mymax(2, 1, 2),
    add(a, [b, c, X], L),
    format('X: ~w~n', [X]),
    format('L: ~w~n', [L])
    .