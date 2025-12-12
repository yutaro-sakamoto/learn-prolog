%classify([], []) :- !.
%
%classify(+(N1, N2), [N2 | Literals]) :-
%    integer(N2), !,
%    classify(N1, Literals).
%
%classify(+(N1, _), Literals) :- !,
%    classify(N1, Literals).
%
%classify(X, [X]) :-
%    integer(X), !.
%
%classify(_, []).


classify([], [], []) :- !.

classify(+(N1, N2), Vars, [N2 | Literals]) :-
    integer(N2), !,
    classify(N1, Vars, Literals).

classify(+(N1, N2), [N2 | Vars], Literals) :- !,
    classify(N1, Vars, Literals).

classify(X, [], [X]) :-
    integer(X), !.

classify(X, [X], []).