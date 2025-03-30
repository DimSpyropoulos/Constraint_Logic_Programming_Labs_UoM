%%%Askisi 7
%%%replace/4
replace(X,Y,[X|T],[Y|T]).
replace(X,Y,[H|T],[H|ResultList]):-
	replace(X,Y,T,ResultList).

%%%Askisi 8
%%%exclude_range/4
exclude_range(_, _, [], []).

exclude_range(Low, High, [Head|Tail], NewList) :-
( Head >= Low, Head =< High ),
exclude_range(Low, High, Tail, NewList).

exclude_range(Low, High, [Head|Tail], [Head|NewList]) :-
 Head > High ,
exclude_range(Low, High, Tail, NewList).

exclude_range(Low,High, [Head|Tail], [Head|NewList]) :-
Head < Low ,
exclude_range(Low, High, Tail, NewList).
