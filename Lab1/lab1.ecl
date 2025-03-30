%%%add_r1
command(add_r1, state(acc(X),reg1(Y),R2,R3), state(acc(X+Y),reg1(Y),R2,R3)).
%%%subtract_r1
command(subtract_r1, state(acc(X),reg1(Y),R2,R3), state(acc(X-Y),reg1(Y),R2,R3)).
%%%store_r1
command(store_r1, state(acc(A),reg1(_),R2,R3), state(acc(A),reg1(A),R2,R3)).
%%%load_r1
command(load_r1, state(acc(_),reg1(R),R2,R3), state(acc(R),reg1(R),R2,R3)).


%%%add_r2
command(add_r2, state(acc(X),R1,reg2(Y),R3), state(acc(X+Y),R1,reg2(Y),R3)).
%%%subtract_r2
command(subtract_r2, state(acc(X),R1,reg2(Y),R3), state(acc(X-Y),R1,reg2(Y),R3)).
%%%store_r2
command(store_r2, state(acc(A),R1,reg2(_),R3), state(acc(A),R1,reg2(A),R3)).
%%%load_r2
command(load_r2, state(acc(_),R1,reg2(R),R3), state(acc(R),R1,reg2(R),R3)).


%%%add_r3
command(add_r3, state(acc(X),R1,R2,reg3(Y)), state(acc(X+Y),R1,R2,reg3(Y))).
%%%subtract_r3
command(subtract_r3, state(acc(X),R1,R2,reg3(Y)), state(acc(X-Y),R1,R2,reg3(Y))).
%%%store_r3
command(store_r3, state(acc(A),R1,R2,reg3(_)), state(acc(A),R1,R2,reg3(A))).
%%%load_r3
command(load_r3, state(acc(_),R1,R2,reg3(R)), state(acc(R),R1,R2,reg3(R))).


%%%findOps/3
findOps(O1,O2,O3):-
	command(O1, state(acc('c1'),reg1(0),reg2('c2'),reg3('c3')), State2),
	command(O2, State2, State3),
	command(O3, State3, state(acc(_),reg1('c1'-'c2'+'c3'),reg2(_),reg3(_))).
