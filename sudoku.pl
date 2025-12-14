:- use_module(library(clpfd)).

sudoku([X11,X12,X13,X14,X15,X16,X17,X18,X19,
        X21,X22,X23,X24,X25,X26,X27,X28,X29,
        X31,X32,X33,X34,X35,X36,X37,X38,X39,
        X41,X42,X43,X44,X45,X46,X47,X48,X49,
        X51,X52,X53,X54,X55,X56,X57,X58,X59,
        X61,X62,X63,X64,X65,X66,X67,X68,X69,
        X71,X72,X73,X74,X75,X76,X77,X78,X79,
        X81,X82,X83,X84,X85,X86,X87,X88,X89,
        X91,X92,X93,X94,X95,X96,X97,X98,X99
        ]) :-
    % All variables are in the range 1-9
    Vars = [X11,X12,X13,X14,X15,X16,X17,X18,X19,
            X21,X22,X23,X24,X25,X26,X27,X28,X29,
            X31,X32,X33,X34,X35,X36,X37,X38,X39,
            X41,X42,X43,X44,X45,X46,X47,X48,X49,
            X51,X52,X53,X54,X55,X56,X57,X58,X59,
            X61,X62,X63,X64,X65,X66,X67,X68,X69,
            X71,X72,X73,X74,X75,X76,X77,X78,X79,
            X81,X82,X83,X84,X85,X86,X87,X88,X89,
            X91,X92,X93,X94,X95,X96,X97,X98,X99],
    Vars ins 1..9,

    % Each row contains distinct numbers
    all_distinct([X11,X12,X13,X14,X15,X16,X17,X18,X19]),
    all_distinct([X21,X22,X23,X24,X25,X26,X27,X28,X29]),
    all_distinct([X31,X32,X33,X34,X35,X36,X37,X38,X39]),
    all_distinct([X41,X42,X43,X44,X45,X46,X47,X48,X49]),
    all_distinct([X51,X52,X53,X54,X55,X56,X57,X58,X59]),
    all_distinct([X61,X62,X63,X64,X65,X66,X67,X68,X69]),
    all_distinct([X71,X72,X73,X74,X75,X76,X77,X78,X79]),
    all_distinct([X81,X82,X83,X84,X85,X86,X87,X88,X89]),
    all_distinct([X91,X92,X93,X94,X95,X96,X97,X98,X99]),

    % Each column contains distinct numbers
    all_distinct([X11,X21,X31,X41,X51,X61,X71,X81,X91]),
    all_distinct([X12,X22,X32,X42,X52,X62,X72,X82,X92]),
    all_distinct([X13,X23,X33,X43,X53,X63,X73,X83,X93]),
    all_distinct([X14,X24,X34,X44,X54,X64,X74,X84,X94]),
    all_distinct([X15,X25,X35,X45,X55,X65,X75,X85,X95]),
    all_distinct([X16,X26,X36,X46,X56,X66,X76,X86,X96]),
    all_distinct([X17,X27,X37,X47,X57,X67,X77,X87,X97]),
    all_distinct([X18,X28,X38,X48,X58,X68,X78,X88,X98]),
    all_distinct([X19,X29,X39,X49,X59,X69,X79,X89,X99]),

    % Each 3x3 block contains distinct numbers
    all_distinct([X11,X12,X13,X21,X22,X23,X31,X32,X33]),
    all_distinct([X14,X15,X16,X24,X25,X26,X34,X35,X36]),
    all_distinct([X17,X18,X19,X27,X28,X29,X37,X38,X39]),
    all_distinct([X41,X42,X43,X51,X52,X53,X61,X62,X63]),
    all_distinct([X44,X45,X46,X54,X55,X56,X64,X65,X66]),
    all_distinct([X47,X48,X49,X57,X58,X59,X67,X68,X69]),
    all_distinct([X71,X72,X73,X81,X82,X83,X91,X92,X93]),
    all_distinct([X74,X75,X76,X84,X85,X86,X94,X95,X96]),
    all_distinct([X77,X78,X79,X87,X88,X89,X97,X98,X99]),

    % Solve
    label(Vars).

% Valid sudoku puzzle (easy)
puzzle1([
    5, 3, _, _, 7, _, _, _, _,
    6, _, _, 1, 9, 5, _, _, _,
    _, 9, 8, _, _, _, _, 6, _,
    8, _, _, _, 6, _, _, _, 3,
    4, _, _, 8, _, 3, _, _, 1,
    7, _, _, _, 2, _, _, _, 6,
    _, 6, _, _, _, _, 2, 8, _,
    _, _, _, 4, 1, 9, _, _, 5,
    _, _, _, _, 8, _, _, 7, 9
]).

% Validsudoku puzzle (hard)
puzzle2([
    8, _, _, _, 4, _, 9, 1, _,
    _, _, 3, 5, _, _, _, _, _,
    _, _, _, _, _, _, 2, _, _,
    5, 8, 6, _, _, _, _, _, _,
    _, _, _, _, _, 9, _, _, _,
    _, _, _, _, 7, _, _, _, 8,
    _, _, _, _, 3, _, 7, _, 6,
    _, _, 9, _, _, _, _, _, 5,
    3, 7, _, _, 2, _, _, _, _
]).

% 解いて表示
solve_and_print(
[X11,X12,X13,X14,X15,X16,X17,X18,X19,
        X21,X22,X23,X24,X25,X26,X27,X28,X29,
        X31,X32,X33,X34,X35,X36,X37,X38,X39,
        X41,X42,X43,X44,X45,X46,X47,X48,X49,
        X51,X52,X53,X54,X55,X56,X57,X58,X59,
        X61,X62,X63,X64,X65,X66,X67,X68,X69,
        X71,X72,X73,X74,X75,X76,X77,X78,X79,
        X81,X82,X83,X84,X85,X86,X87,X88,X89,
        X91,X92,X93,X94,X95,X96,X97,X98,X99]
) :-
    sudoku([X11,X12,X13,X14,X15,X16,X17,X18,X19,
        X21,X22,X23,X24,X25,X26,X27,X28,X29,
        X31,X32,X33,X34,X35,X36,X37,X38,X39,
        X41,X42,X43,X44,X45,X46,X47,X48,X49,
        X51,X52,X53,X54,X55,X56,X57,X58,X59,
        X61,X62,X63,X64,X65,X66,X67,X68,X69,
        X71,X72,X73,X74,X75,X76,X77,X78,X79,
        X81,X82,X83,X84,X85,X86,X87,X88,X89,
        X91,X92,X93,X94,X95,X96,X97,X98,X99
        ]),
    format('~w ~w ~w ~w ~w ~w ~w ~w ~w~n', [X11,X12,X13,X14,X15,X16,X17,X18,X19]),
    format('~w ~w ~w ~w ~w ~w ~w ~w ~w~n', [X21,X22,X23,X24,X25,X26,X27,X28,X29]),
    format('~w ~w ~w ~w ~w ~w ~w ~w ~w~n', [X31,X32,X33,X34,X35,X36,X37,X38,X39]),
    format('~w ~w ~w ~w ~w ~w ~w ~w ~w~n', [X41,X42,X43,X44,X45,X46,X47,X48,X49]),
    format('~w ~w ~w ~w ~w ~w ~w ~w ~w~n', [X51,X52,X53,X54,X55,X56,X57,X58,X59]),
    format('~w ~w ~w ~w ~w ~w ~w ~w ~w~n', [X61,X62,X63,X64,X65,X66,X67,X68,X69]),
    format('~w ~w ~w ~w ~w ~w ~w ~w ~w~n', [X71,X72,X73,X74,X75,X76,X77,X78,X79]),
    format('~w ~w ~w ~w ~w ~w ~w ~w ~w~n', [X81,X82,X83,X84,X85,X86,X87,X88,X89]),
    format('~w ~w ~w ~w ~w ~w ~w ~w ~w~n', [X91,X92,X93,X94,X95,X96,X97,X98,X99]).