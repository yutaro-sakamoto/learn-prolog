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

mother(X, Y) :- parent(X, Y), female(X).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

sister(X, Y) :-
    parent(Z, Y),
    parent(Z, X),
    female(X),
    dif(X, Y).

hastwochildren(X) :- (
    (parent(X, Y),
    sister(Y, _)) :-
    (parent(X, A),
    parent(X, B),
    dif(A, B))
).

predecessor(X, Z) :-
    parent(X, Z).

predecessor(X, Z) :-
    parent(X, Y),
    predecessor(Y, Z).

fallible(X) :- man(X).

man(socrates).

somebody_has_child :- parent(_, _).

vertical(seg(point(X, _Y1), point(X, _Y2))).

horizontal(seg(point(_X, Y), point(_X1, Y))).

hasachild(X) :- parent(X, _).


big(bear).
big(elephant).
small(cat).

brown(bear).
black(cat).
gray(elephant).

dark(Z) :-
    black(Z).

dark(Z) :-
    brown(Z).

move(
    state(middle, onbox, middle, hasnot),
    grasp,
    state(middle, obbox, middle, has)).

move(
    state(P, onfloor, P, H),
    climb,
    state(P, onbox, P, H)
).

move(
    state(P1, onfloor, P1, H),
    staet(P1, P2),
    state(P2, onfloor, P2, H)
).

move(
    state(P1, onfloor, B, H),
    walk(P1, P2),
    state(P2, onfloor, B, H)
).

canget(state(_, _, _, has)).

canget(State1) :-
    move(State1, _, State2),
    canget(State2).

pred1(X, Z) :-
    parent(X, Z).
pred1(X, Z) :-
    parent(X, Y),
    pred1(Y, Z).

pred2(X, Z) :-
    parent(X, Y),
    pred2(Y, Z).
pred2(X, Z) :-
    parent(X, Z).

pred3(X, Z) :-
    parent(X, Z).
pred3(X, Z) :-
    pred3(Y, Z),
    parent(X, Y).

pred4(X, Z) :-
    pred4(Y, Z),
    parent(X, Y).
pred4(X, Z) :-
    parent(X, Z).

my_list([apple, banana, cherry]).

member(X, [X | _]).
member(X, [_ | Tail]) :-
    member(X, Tail).

conc([], L, L).
conc([X | L1], L2, [X | L3]) :-
    conc(L1, L2, L3).

member1(X, L) :-
    conc(_, [X | _], L).

add(X, L, [X, L]).

del(X, [X | Tail], Tail).
del(X, [Y | Tail], [Y | Tail1]) :-
    del(X, Tail, Tail1).

del2(X, [X | Tail], Tail) :- !.
del2(X, [Y | Tail], [Y | Tail1]) :-
    del2(X, Tail, Tail1).

del3(_, [], []).
del3(X, [X | Tail], Result) :-
    del3(X, Tail, Result).
del3(X, [Y | Tail], [Y | Result]) :-
    X \= Y,
    del3(X, Tail, Result).

sublist(S, L) :-
    conc(_, L2, L),
    conc(S, _, L2).

insert(X, List, BiggerList) :-
    del(X, BiggerList, List).

permutation([], []).
permutation([X | L], P) :-
    permutation(L, L1),
    insert(X, L1, P).

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
    \+ offsprint(liz, tom),
    findall(X-Y, sister(X, Y), Sister),
    format('Sister: ~w~n', [Sister]),
    findall(X-Y, predecessor(X, Y), Predecessor),
    format('Predecessor: ~w~n', [Predecessor]),
    fallible(socrates),
    predecessor(tom, pat),
    somebody_has_child,
    date(D, M, 1983) = date(15, may, Y), date(D, M, 1983) = date(15, M, Y),
    vertical(seg(point(2, 3), P)),
    format('Vertical point P: ~w~n', [P]),
    findall(X, (dark(X), big(X)), [DarkBrown]),
    format('DarkBrown: ~w~n', [DarkBrown]),
    findnsols(1, X, canget(X), _),
    pred1(tom, pat),
    pred2(tom, pat),
    pred3(tom, pat),
    findall(Before-After, conc(Before, [may | After], [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec]), [BeforeAfter]),
    format('Before-After: ~w~n', [BeforeAfter]),
    findall(L, del(a, [a, b, a, a], L), Deleted),
    format('Deleted: ~w~n', [Deleted]),
    findall(L, del2(a, [a, b, a, a], L), Deleted2),
    format('Deleted: ~w~n', [Deleted2]),
    findall(L, del3(a, [a, b, a, a], L), Deleted3),
    format('Deleted: ~w~n', [Deleted3]),
    findall(S, sublist(S, [a, b, c]), SubListWithDups),
    sort(SubListWithDups, SubList),
    format('SubList: ~w~n', [SubList]),
    findall(Perm, permutation([a, b, c], Perm), Perms),
    format('Perm: ~w~n', [Perms])
    .

/*
multiline
comments
*/

% comments