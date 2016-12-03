utterance(Prob, X) :-
    sentence(Prob, X, [ ]).

sentence(Prob, Start, End) :-
    nounphrase(P1, Start, Rest),
    verbphrase(P2, Rest, End),
    pr(r1, P3),
    Prob is P1*P2*P3.

nounphrase(Prob, [Noun | End], End) :-
    noun(P1, Noun, _),
    pr(r2, P2),
    Prob is P1*P2.
nounphrase(Prob, [Noun | Rest], End) :-
    noun(P1, Noun, _),
    nounphrase(P2, Rest, End),
    pr(r3, P3),
    Prob is P1*P2*P3.
nounphrase(Prob, [Article | Rest], End) :-
    article(P1, Article, _),
    nounphrase(P2, Rest, End),
    pr(r4, P3),
    Prob is P1*P2*P3.
nounphrase(Prob, [Adjective | Rest], End) :-
    adjective(P1, Adjective),
    nounphrase(P2, Rest, End),
    pr(r5, P3),
    Prob is P1*P2*P3.
nounphrase(Prob, [Preposition | Rest], End) :-
    preposition(P1, Preposition),
    nounphrase(P2, Rest, End),
    pr(r6, P3),
    Prob is P1*P2*P3.
nounphrase(Prob, [Conjunction | Rest], End) :-
    conjunction(P1, Conjunction),
    nounphrase(P2, Rest, End),
    pr(r7, P3),
    Prob is P1*P2*P3.
nounphrase(Prob, [Noun | Rest], End) :-
    noun(P1, Noun, _),
    verbphrase(P2, Rest, End),
    pr(r8, P3),
    Prob is P1*P2*P3.

verbphrase(Prob, [Verb | End], End) :-
    verb(P1, Verb, _),
    pr(r9, P2),
    Prob is P1*P2.
verbphrase(Prob, [Verb | Rest], End) :-
    verb(P1, Verb, _),
    nounphrase(P2, Rest, End),
    pr(r10, P3),
    Prob is P1*P2*P3.
verbphrase(Prob, [Adverb | Rest], End) :-
    adverb(P1, Adverb),
    verbphrase(P2, Rest, End),
    pr(r11, P3),
    Prob is P1*P2*P3.
verbphrase(Prob, [Verb | Rest], End) :-
    verb(P1, Verb, _),
    adverbphrase(P2, Rest, End),
    pr(r12, P3),
    Prob is P1*P2*P3.
verbphrase(Prob, [Conjunction | Rest], End) :-
    conjunction(P1, Conjunction),
    verbphrase(P2, Rest, End),
    pr(r13, P3),
    Prob is P1*P2*P3.

adjectivephrase(Prob, [Adjective | End], End) :-
    adjective(P1, Adjective),
    pr(r14, P2),
    Prob is P1*P2.
adjectivephrase(Prob, [Adjective | Rest], End) :-
    adjective(P1, Adjective),
    adjectivephrase(P2, Rest, End),
    pr(r15, P3),
    Prob is P1*P2*P3.
adjectivephrase(Prob, Start, End) :-
    adverbphrase(P1, Start, Rest),
    adjectivephrase(P2, Rest, End),
    pr(r16, P3),
    Prob is P1*P2*P3.
adjectivephrase(Prob, [Conjunction | Rest], End) :-
    conjunction(P1, Conjunction),
    adjectivephrase(P2, Rest, End),
    pr(r17, P3),
    Prob is P1*P2*P3.

adverbphrase(Prob, [Adverb | End], End) :-
    adverb(P1, Adverb),
    pr(r18, P2),
    Prob is P1*P2.
adverbphrase(Prob, [Adverb | Rest], End) :-
    adverb(P1, Adverb),
    adverbphrase(P2, Rest, End),
    pr(r19, P3),
    Prob is P1*P2*P3.
adverbphrase(Prob, [Conjunction | Rest], End) :-
    conjunction(P1, Conjunction),
    adverbphrase(P2, Rest, End),
    pr(r20, P3),
    Prob is P1*P2*P3.

prepositionalphrase(Prob, [Preposition | Rest], End) :-
    preposition(P1, Preposition),
    nounphrase(P2, Rest, End),
    pr(r21, P3),
    Prob is P1*P2*P3.
prepositionalphrase(Prob, [Preposition | Rest], End) :-
    preposition(P1, Preposition),
    prepositionalphrase(P2, Rest, End),
    pr(r22, P3),
    Prob is P1*P2*P3.
prepositionalphrase(Prob, [Conjunction | Rest], End) :-
    conjunction(P1, Conjunction),
    prepositionalphrase(P2, Rest, End),
    pr(r23, P3),
    Prob is P1*P2*P3.

pr(r1, 0.04347826).
pr(r2, 0.04347826).
pr(r3, 0.04347826).
pr(r4, 0.04347826).
pr(r5, 0.04347826).
pr(r6, 0.04347826).
pr(r7, 0.04347826).
pr(r8, 0.04347826).
pr(r9, 0.04347826).
pr(r10, 0.04347826).
pr(r11, 0.04347826).
pr(r12, 0.04347826).
pr(r13, 0.04347826).
pr(r14, 0.04347826).
pr(r15, 0.04347826).
pr(r16, 0.04347826).
pr(r17, 0.04347826).
pr(r18, 0.04347826).
pr(r19, 0.04347826).
pr(r20, 0.04347826).
pr(r21, 0.04347826).
pr(r22, 0.04347826).
pr(r23, 0.04347826).
