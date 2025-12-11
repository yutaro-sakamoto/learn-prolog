count(_, [], 0).

count(A, [B | L], N) :-
    atom(B), A = B, !,
    count(A, L, N1),
    N is N1 + 1.
count(A, [_ | L], N) :-
    count(A, L, N).

run_tests :-
    1 = 1.