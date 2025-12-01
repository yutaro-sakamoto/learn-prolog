parent(tom, bob).
parent(pam, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).
female(pam).
female(liz).
female(ann).
male(tom).
male(bob).
make(jim).

offsprint(X, Y) :- parent(X, Y).

mother(X, Y) :- parent(X, Y), female(X).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

sister(X, Y) :-
    parent(Z, Y),
    parent(Z, X),
    female(X),
    dif(X, Y).

hastwochildren(X) :- (
    (parent(X, Y),
    sister(Y, _)) :-
    (parent(X, A),
    parent(X, B),
    dif(A, B))
).

predecessor(X, Z) :-
    parent(X, Z).

predecessor(X, Z) :-
    parent(X, Y),
    predecessor(Y, Z).

run_tests :-
    parent(tom, bob),
    \+ parent(liz, pat),
    \+ parent(tom, ben),
    findall(X, parent(X, liz), Parents),
    format('Parents of liz: ~w~n', [Parents]),
    findall(X, parent(bob, X), Children),
    format('Children of bob: ~w~n', [Children]),
    findall(X-Y, parent(X, Y), Pairs),
    format('Parents and Children: ~w~n', [Pairs]),
    findall(X-Y, (parent(Y, jim), parent(X, Y)), Pairs2),
    format('Pairs2: ~w~n', [Pairs2]),
    findall(X-Y, (parent(tom, X), parent(X, Y)), TomsGrandchildren),
    format('Pairs2: ~w~n', [TomsGrandchildren]),
    findall(X, (parent(X, ann), parent(X, pat)), Parent),
    format('Parent: ~w~n', [Parent]),
    \+ offsprint(liz, tom),
    findall(X-Y, sister(X, Y), Sister),
    format('Sister: ~w~n', [Sister]),
    findall(X-Y, predecessor(X, Y), Predecessor),
    format('Predecessor: ~w~n', [Predecessor]).

/*
multiline
comments
*/

% comments