transitiveClosure(Rel, X, Y) :-
    F =.. [Rel, X, Y],
    call(F), !.

transitiveClosure(Rel, X, Y) :-
    F =.. [Rel, X, Z],
    call(F),
    transitiveClosure(Rel, Z, Y).

% Example relation

部門(部門A).
部門(部門B).

部門長(部門A, 部門A部門長).
部門長(部門B, 部門B部門長).

部門社員(_社員1, _) :-
    部門長(_, _社員1).

部門社員(部門A, 社員A1).
部門社員(部門A, 社員A2).

部門社員(部門B, 社員B1).
部門社員(部門B, 社員B2).
部門社員(部門B, 社員B3).

上長部下(_上長, _部下) :-
    部門長(_部門, _上長),
    部門社員(_部門, _部下),
    _上長 \= _部下.

% Example query: