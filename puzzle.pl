sum(N1, N2, N) :-
    sum1(N1, N2, N, 0, 0, [0,1,2,3,4,5,6,7,8,9], _).

sum1([], [], [], 0, 0, Digits, Digits).

sum1([D1 | N1], [D2 | N2], [D | N], C1, C, Digs1, Digs) :-
    sum1(N1, N2, N, C1, C2, Digs1, Digs2),
    digitsum(D1, D2, C2, D, C, Digs2, Digs).

digitsum(D1, D2, C1, D, C, Digs1, Digs) :-
    del(D1, Digs1, Digs2),
    del(D2, Digs2, Digs3),
    del(D, Digs3, Digs),
    D is (D1 + D2 + C1) mod 10,
    C is (D1 + D2 + C1) div 10.

del(A, L, L) :-
    nonvar(A), !.

del(A, [A | L], L).

del(A, [B | L], [B | L1]) :-
    del(A, L, L1).

puzzle1([D,O,_,A,L,D],
        [_,E,R,A,L,D],
        [R,O,_,E,R,_]).

puzzle2([0,_,E,N,_],
        [0,M,O,_,E],
        [M,O,N,E,_]).

run_tests :-
    puzzle1(N1, N2, N), sum(N1, N2, N).