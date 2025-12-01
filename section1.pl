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
    \+ offsprint(liz, tom).
