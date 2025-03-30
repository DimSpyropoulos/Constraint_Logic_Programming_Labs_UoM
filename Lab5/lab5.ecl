%%%Askisi_10
%%%separate_lists/3
seperate_lists([],[],[]).
seperate_lists([X|Rest],[X|Lets],Nums):-
	not(number(X)),
	seperate_lists(Rest,Lets,Nums).
seperate_lists([N|Rest],Lets,[N|Nums]):-
	number(N),
	seperate_lists(Rest,Lets,Nums).

%%%Askisi_11
%%%max_min_eval/2
max_min_eval([_,Y,_],_):-
	Y \== 'max',Y \== 'min' ,!,fail.
max_min_eval([X,Y,Z],Result):-
	C=..[Y,X,Z,Result],
	call(C).
max_min_eval([X,Y,Z|Rest],Result):-
	C=..[Y,X,Z,Result1],
	call(C),
	max_min_eval([Result1|Rest],Result).



