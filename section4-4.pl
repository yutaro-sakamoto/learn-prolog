% A flight route planner

:- op(50, xfy, :).

flight(Place1, Place2, Day, Fnum, Deptime, Arrtime) :-
    timetable(Place1, Place2, Flightlist),
    member(Deptime / Arrtime / Fnum / Daylist, Flightlist),
    flyday(Day, Daylist).

member(X, [X | _]).
member(X, [_ | L]) :-
    member(X, L).

flyday(Day, Daylist) :-
    member(Day, Daylist).

flyday(Day, alldays) :-
    member(Day, [mo, tu, we, th, fr, sa, su]).

route(P1, P2, Day, [P1-P2 : Fnum : Deptime]) :-
    flight(P1, P2, Day, Fnum, Deptime, _).

route(P1, P2, Day, [P1-P3 : Fnum1 : Dep1 | Route]) :-
    route(P3, P2, Day, Route),
    flight(P1, P3, Day, Fnum1, Dep1, Arr1),
    deptime(Route, Dep2),
    transfer(Arr1, Dep2).

deptime([_-_ : _ : Dep | _], Dep).
transfer(Hours1:Mins1, Hours2: Mins2) :-
    60 * (Hours2 - Hours1) + Mins2 - Mins1 >= 40.

timetable(edinburgh, london,
    [ 9:40 / 10:50 / ba4733 / alldays,
     13:40 / 14:50 / ba4773 / alldays,
     19:40 / 20:50 / ba4833 / [mo, tu, we, th, fr, su]]).

timetable(london, edinburgh,
    [ 9:40 / 10:50 / ba4732 / alldays,
     11:40 / 12:50 / ba4752 / alldays,
     18:40 / 19:50 / ba4820 / [mo, tu, we, th, fr]]).

timetable(london, ljubljana,
    [ 13:20 / 16:20 / ju201 / [fr],
      13:20 / 16:20 / ju213 / [su]]).

timetable(london, zurich,
    [ 9:10 / 11:45 / ba614 / alldays,
     14:45 / 17:20 / sr8805 / alldays]).

timetable(london, milan,
    [ 8:30 / 11:20 / ba510 / alldays,
     11:00 / 13:50 / az459 / alldays]).

run_tests :-
    1 + 1 =:= 2,
    route(edinburgh, zurich, mo, _).