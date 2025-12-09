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

different(X, Y) :-
    X = Y, !, fail;
    true.

likes2(mary, X) :-
    animal(X),
    not(snake(X)).

different2(mary, X) :-
    animal(X),
    not(snake(X)).

solution([]).
solution([X/Y | Others]) :-
    solution(Others),
    member2(Y, [1,2,3,4,5,6,7,8]),
    not(attacks(X/Y, Others)).

attacks(X/Y, Others) :-
    member2(X1/Y1, Others),
    (Y1 = Y;
     Y1 is Y + X1 - X;
     Y1 is Y - X1 + X).

member2(X, [X | _]).
member2(X, [_ | L]) :- member2(X, L).

run_tests :-
    \+ (f(1, Y), 2 < Y),
    mymax(1, 2, 2),
    mymax(2, 1, 2),
    add(a, [b, c, X], L),
    format('X: ~w~n', [X]),
    format('L: ~w~n', [L]),
    solution([1/_, 2/_, 3/_, 4/_, 5/_, 6/_, 7/_, 8/_])
    .