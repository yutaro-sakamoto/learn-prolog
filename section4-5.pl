solution([]).

solution([X/Y | Others]) :-
    solution(Others),
    member(Y, [1, 2, 3, 4, 5, 6, 7, 8]),
    noattack(X/Y, Others).

noattack(_, []).

noattack(X/Y, [X1/Y1 | Others]) :-
    Y =\= Y1,
    Y1 - Y =\= X1 - X,
    Y1 - Y =\= X - X1,
    noattack(X/Y, Others).

member(X, [X | _]).

member(X, [_ | L]) :-
    member(X, L).

% template([1/Y1, 2/Y2, 3/Y3, 4/Y4, 5/Y5, 6/Y6, 7/Y7, 8/Y8]).

run_tests :-
    1 + 1 =:= 2,
    %solution([1/_, 2/_, 3/_, 4/_, 5/_, 6/_, 7/_, 8/_]).
    findall(
        Y1-Y2-Y3-Y4-Y5-Y6-Y7-Y8,
        solution([1/Y1, 2/Y2, 3/Y3, 4/Y4, 5/Y5, 6/Y6, 7/Y7, 8/Y8]),
        Solution),
    format('Solution: ~w~n', [Solution]).