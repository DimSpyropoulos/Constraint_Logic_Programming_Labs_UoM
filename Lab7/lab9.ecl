:-use_module(library(ic)).
:-use_module(library(ic_global)).
:-use_module(library(branch_and_bound)).

ram([2,8,8,16,2,4]).
price([30,35,20,38,44,65]).
vcpu([4,8,8,4,4,8]).

select_providers(X,Y,Price):-
   ram(R),vcpu(V),price(P),
   element(X,R,R1),element(X,V,V1),element(X,P,P1),
   element(Y,R,R2),element(Y,V,V2),element(Y,P,P2),
   R1#>=4,R2#>=4,
   Vcpu#=V1+V2,Vcpu#=12,
   Price#=P1+P2,
   bb_min(labeling([X,Y]),Price,_).
	
        


   



   
