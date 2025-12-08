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

total([], 0).
total([Person | List], Sum) :-
    salary(Person, S),
    total(List, Rest),
    Sum is S + Rest.

husbandSelector(family(Husband, _, _), Husband).
wifeSelector(family(_, Wife, _), Wife).
childrenSelector(family(_, _, Children), Children).
firstChildSelector(family(_, _, [First | _]), First).
secondChildSelector(family(_, _, [_, Second | _]), Second).
nthChildSelector(N, Family, Child) :-
    childrenSelector(Family, ChildList),
    nth_member(N, ChildList, Child).

nth_member(0, [X | _], X).
nth_member(N, [_ | Tail], X) :-
    N > 0,
    N1 is N - 1,
    nth_member(N1, Tail, X).

firstnameSelector(person(Name, _, _, _), Name).
surnameSelector(person(_, Surname, _, _), Surname).
bornSelector(person(_, _, Date, _), Date).

join(Relation, X, Z) :-
    call(Relation, X, Y),
    call(Relation, Y, Z).

friend(tom1, tom2).
friend(tom2, tom3).
friend(tom3, tom4).

transitiveClosure(Relation, X, Y) :-
    call(Relation, X, Y).

transitiveClosure(Relation, X, Y) :-
    call(Relation, X, Z),
    transitiveClosure(Relation, Z, Y).

final(s3).

trans(s1, a, s1).
trans(s1, a, s2).
trans(s1, b, s1).
trans(s2, b, s3).
trans(s3, b, s4).

silent(s2, s4).
silent(s3, s1).

accepts(S, []) :-
    final(S).

accepts(S, [X | Rest]) :-
    trans(S, X, S1),
    accepts(S1, Rest).

accepts(S, String) :-
    silent(S, S1),
    accepts(S1, String).

run_tests :-
    family(_, person(Name, Surname, _, _), [_, _ | _]),
    format('Name, Surname: ~w ~w ~n', [Name, Surname]),
    findall(N-S, exists(person(N, S, _, _)), AllPerson),
    format('AllPerson: ~w~n', [AllPerson]),
    family(Husband, Wife, Children),
    total([Husband, Wife | Children], Income),
    length([Husband, Wife | Children], N),
    IncomeAverage is Income/N,
    format('Income average: ~w~n', [IncomeAverage]),
    join(friend, tom1, tom3),
    transitiveClosure(friend, tom1, tom4),
    accepts(S, [a, b]),
    findall(X1-X2-X3, accepts(s1, [X1, X2, X3]), Length3series),
    format('Length3series: ~w~n', [Length3series])
    .