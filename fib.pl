fib3(N, F) :-
    forwardfib(2, N, 1, 1, F).

forwardfib(M, N, _, F2, F2) :-
    M >= N.

forwardfib(M, N, F1, F2, F) :-
    M < N,
    NextM is M + 1,
    NextF2 is F1 + F2,
    forwardfib(NextM, N, F2, NextF2, F).
