family(
    person(tom, fox, date(7, may, 1950), works(bbc, 15200)),
    person(ann, fox, date(9, may, 1951), unemployed),
    [
        person(pat, fox, date(5, may, 1973), unemployed),
        person(jim, fox, date(5, may, 1973), unemployed)
    ]
).

husband(X) :-
    family(X, _, _).

wife(X) :-
    family(_, X, _).

child(X) :-
    family(_, _, Children),
    member(X, Children).

member(X, [X | _]).
member(X, [_ | L]) :-
    member(X, L).

exists(Person) :-
    husband(Person);
    wife(Person);
    child(Person).

dateofbirth(person(_, _, Date, _), Date).
salary(person(_, _, _, works(_, S)), S).
salary(person(_, _, _, unemployed), 0).

run_tests :-
    family(_, person(Name, Surname, _, _), [_, _ | _]),
    format('Name, Surname: ~w ~w ~n', [Name, Surname]),
    findall(N-S, exists(person(N, S, _, _)), AllPerson),
    format('AllPerson: ~w~n', [AllPerson])
    .