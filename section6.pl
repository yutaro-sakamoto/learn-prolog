getsentence(Wordlist) :-
    get0(Char),
    getrest(Char, Wordlist).

getrest(46, []) :- !.
getreset(32, Wordlist) :- !,
    getsentense(Wordlist).

getreset(Letter, [Word | Wordlist]) :-
    getletters(Letter, Letters, Nextchar),
    name(Word, Letters),
    getrest(Nextchar, Wordlist).

getletters(46, [], 46) :- !.
getletters(32, [], 32) :- !.

getletters(Let, [Let | Letters], Nextchar) :-
    get0(Char),
    getletters(Char, Letters, Nextchar).

run_tests :-
    1 = 1.