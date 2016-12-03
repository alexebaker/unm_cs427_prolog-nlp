utterance(X) :-
    sentence(X, [ ]).

sentence(Start, End) :-
    nounphrase(Start, Rest, Number),
    verbphrase(Rest, End, Number).

nounphrase([Noun | End], End, Number) :-
    noun(_, Noun, Number).
nounphrase([Noun | Rest], End, Number) :-
    noun(_, Noun, Number),
    nounphrase(Rest, End, _).
nounphrase([Article | Rest], End, Number) :-
    article(_, Article, Number),
    nounphrase(Rest, End, _).
nounphrase([Adjective | Rest], End, Number) :-
    adjective(_, Adjective),
    nounphrase(Rest, End, _).
nounphrase([Preposition | Rest], End, Number) :-
    preposition(_, Preposition),
    nounphrase(Rest, End, _).
nounphrase([Conjunction | Rest], End, Number) :-
    conjunction(_, Conjunction),
    nounphrase(Rest, End, _).
nounphrase([Noun | Rest], End, Number) :-
    noun(_, Noun, Number),
    verbphrase(Rest, End, Number).

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
verbphrase([Conjunction | Rest], End, Number) :-
    conjunction(_, Conjunction),
    verbphrase(Rest, End, Number).

adjectivephrase([Adjective | End], End) :-
    adjective(_, Adjective).
adjectivephrase([Adjective | Rest], End) :-
    adjective(_, Adjective),
    adjectivephrase(Rest, End).
adjectivephrase(Start, End) :-
    adverbphrase(Start, Rest),
    adjectivephrase(Rest, End).
adjectivephrase([Conjunction | Rest], End) :-
    conjunction(_, Conjunction),
    adjectivephrase(Rest, End).

adverbphrase([Adverb | End], End) :-
    adverb(_, Adverb).
adverbphrase([Adverb | Rest], End) :-
    adverb(_, Adverb),
    adverbphrase(Rest, End).
adverbphrase([Conjunction | Rest], End) :-
    conjunction(_, Conjunction),
    adverbphrase(Rest, End).

prepositionalphrase([Preposition | Rest], End) :-
    preposition(_, Preposition),
    nounphrase(Rest, End, _).
prepositionalphrase([Preposition | Rest], End) :-
    preposition(_, Preposition),
    prepositionalphrase(Rest, End).
prepositionalphrase([Conjunction | Rest], End) :-
    conjunction(_, Conjunction),
    prepositionalphrase(Rest, End).
