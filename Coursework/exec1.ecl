%%% EXEC1 CLP 2023
%%%Exec 1 
%%%indicate_change/2
indicate_change([],[]).
indicate_change([_],[]).
indicate_change([X,Y|Rest],[no_c|Change]):-
   X =:= Y,
   indicate_change([Y|Rest],Change).
indicate_change([X,Y|Rest],[up|Change]):-
   X < Y,
   indicate_change([Y|Rest],Change).
indicate_change([X,Y|Rest],[down|Change]):-
   X > Y,
   indicate_change([Y|Rest],Change).


%%% Exec 2
%%%indicate_change_alt/2
change([X,Y],up):-
   X<Y.
change([X,Y],down):-
   X>Y.
change([X,Y],no_c):-
   X=:=Y.

indicate_change_alt(List,Change):-
   findall([X,Y], (append(_, [X,Y|_], List)),Result),
   findall(X,(member(Y,Result),change(Y,X)),Change).
 

%%% Exec 3
%%%rolling_avg/3
sum_list([],0).
sum_list([H|T],Sum):-
   sum_list(T,RestSum),
   Sum is H + RestSum.
   
sublist(L1,L2):-
    append(S1,_,L2),
    append(_,L1,S1).

rolling_avg(N,List,Aver):-
   length(List,L),
   N=<L,
   length(List1,N),
   findall(List1, (sublist(List1,List)),Result),
   findall(X,(member(Y,Result),sum_list(Y,Sum),X is Sum/N),Aver).




%%% EXEC 4

%%% representations of graphs mentioned in the exercise. 

example(1,[node(1,60,end), node(2,40,1), node(3,40,1), node(4,50,2)]). 
example(2,[node(1,3,end), node(2,2,1), node(3,1,1), node(4,4,1), node(5,5,end)]).
example(3,[node(1,100,end), node(2,100,1), node(3,100,2), node(4, 90, 1), node(5,80,2), node(6,100,3), node(7, 90, 1), node(8,100,3)]). 
%%%(a)graph_start_nodes/2
graph_start_nodes(Graph,StartNodes):-
   findall(X,member(node(X,_,_),Graph),List1),
   setof(X,(A,B,Y,Z)^(member(node(X,Y,Z),Graph),
   member(node(A,B,X),Graph)),List2),
   findall(X,(member(X,List1),not(member(X,List2))),StartNodes).

%%%(b)evaluate_path/5
evaluate_path(Node,Visited,Graph,[Cost1],[Node]):-
   member(node(Node,Cost1,NextNode),Graph),
   member(NextNode,Visited).

evaluate_path(Node,[],Graph,[Cost1,Cost2],[Node,FinalNode]):-
   member(node(Node,Cost1,FinalNode),Graph),
   member(node(FinalNode,Cost2,end),Graph).
	
evaluate_path(Node,Visited,Graph,[Cost1|Values],[Node|NewVisited]):-
   member(node(Node,Cost1,NextNode),Graph),
   member(node(NextNode,_,_),Graph),
   evaluate_path(NextNode,Visited,Graph,Values,NewVisited).

%%%(c)max_seq/3

  
































