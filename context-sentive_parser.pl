utterance(X) :-
    sentence(X, [ ]).

sentence(Start, End) :-
    nounphrase(Start, Rest, Number),
    verbphrase(Rest, End, Number).

nounphrase([Noun | End], End, Number) :-
    noun(_, Noun, Number).
nounphrase([Noun | Rest], End, Number) :-
    noun(_, Noun, Number),
    nounphrase(Rest, End, Number).
nounphrase([Article | Rest], End, Number) :-
    article(_, Article, Number),
    nounphrase(Rest, End, Number).
nounphrase([Adjective | Rest], End, Number) :-
    adjective(_, Adjective),
    nounphrase(Rest, End, Number).
nounphrase([Preposition | Rest], End, Number) :-
    preposition(_, Preposition),
    nounphrase(Rest, End, _).

verbphrase([Verb | End], End, Number) :-
    verb(_, Verb, Number).
verbphrase([Verb | Rest], End, Number) :-
    verb(_, Verb, Number),
    nounphrase(Rest, End, _).
verbphrase([Adverb | Rest], End, Number) :-
    adverb(_, Adverb),
    verbphrase(Rest, End, Number).
verbphrase([Verb | Rest], End, Number) :-
    verb(_, Verb, Number),
    adverbphrase(Rest, End).

adjectivephrase([Adjective | End], End) :-
    adjective(_, Adjective).
adjectivephrase([Adjective | Rest], End) :-
    adjective(_, Adjective),
    adjectivephrase(Rest, End).
adjectivephrase(Start, End) :-
    adverbphrase(Start, Rest),
    adjectivephrase(Rest, End).

adverbphrase([Adverb | End], End) :-
    adverb(_, Adverb).
adverbphrase([Adverb | Rest], End) :-
    adverb(_, Adverb),
    adverbphrase(Rest, End).

prepositionalphrase([Preposition | Rest], End) :-
    preposition(_, Preposition),
    nounphrase(Rest, End, _).
prepositionalphrase([Preposition | Rest], End) :-
    preposition(_, Preposition),
    prepositionalphrase(Rest, End).
