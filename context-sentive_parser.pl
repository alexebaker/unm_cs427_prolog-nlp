utterance(X) :-
    sentence(X, [ ]).
sentence(Start, End) :-
    nounphrase(Start, Rest, Number),
    verbphrase(Rest, End, Number).

nounphrase([Noun | End], End, Number) :-
    noun(Noun, Number).
nounphrase([Article, Noun | End], End, Number) :-
    noun(Noun, Number),
    article(Article, Number).
nounphrase([Noun | Rest], End, Number) :-
    nounphrase(Noun, Rest, Number),
    nounphrase(Rest, End, Number).

verbphrase([Verb | End], End, Number) :-
    verb(Verb, Number).
verbphrase([Verb | Rest], End, Number) :-
    verb(Verb, Number),
    nounphrase(Rest, End, _).
