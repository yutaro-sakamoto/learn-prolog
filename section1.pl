parent(tom, bob).
parent(pam, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

run_tests :-
    parent(tom, bob),
    \+ parent(liz, pat),
    \+ parent(tom, ben),
    findall(X, parent(X, liz), Parents),
    format('Parents of liz: ~w~n', [Parents]),
    findall(X, parent(bob, X), Children),
    format('Children of bob ~w~n', [Children]).
