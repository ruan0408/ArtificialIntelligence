% Name: Ruan de Menezes Costa
% Student Number: 5050761
% Assignment 1 - Prolog programming

%========================= QUESTION 1 ==============================================
% Given a list of integers, computes the sum of the squared numbers that are divisible by 3 or 5.
% Also works for single integers.

sumsq_div3or5([], 0).
sumsq_div3or5([Head | Tail], Sum) :- 0 is Head mod 3,
									 sumsq_div3or5(Tail, Tail_sum),
									 Sum is Tail_sum + Head * Head.

sumsq_div3or5([Head | Tail], Sum) :- 0 is Head mod 5,
									 sumsq_div3or5(Tail, Tail_sum),
									 Sum is Tail_sum + Head * Head.

sumsq_div3or5([Head | Tail], Sum) :- not(0 is Head mod 5), not(0 is Head mod 3),
									 sumsq_div3or5(Tail, Tail_sum),
									 Sum is Tail_sum.
				    

%========================= QUESTION 2 ===============================================
% same_name(Person1, Person2). Given two persons, finds out if they have the same family name.
% man_path_descendant(Person1, Person2). Given two persons, finds out if Person2 is descendant of Person1 such 
% that the path connecting them has only males.

parent(jim, brian).
parent(brian, jenny).
parent(pat, brian).
parent(jenny, victor).
parent(brian, matt).
parent(jim, phil).
parent(matt, monica).
parent(phil, amanda).
parent(matt, john).
parent(amanda, alan).
parent(phil, alan).
female(pat).
female(jenny).
female(monica).
female(amanda).
male(jim).
male(brian).
male(victor).
male(matt).
male(phil).
male(sam).
male(john).
male(alan).

man_path_descendant(Person1, Person2) :- parent(Person1, Person2), male(Person1).
man_path_descendant(Person1, Person2) :- parent(X, Person2), male(X), man_path_descendant(Person1, X).

same_name(Person1, Person1).
same_name(Person1, Person2) :- man_path_descendant(Person1, Person2).
same_name(Person1, Person2) :- man_path_descendant(Person2, Person1).
same_name(Person1, Person2) :- man_path_descendant(X, Person1), man_path_descendant(X, Person2).

%====================================== QUESTION 3 ====================================
% Given a list of numbers, returns a list with the respective logs.

log_table([], []).
log_table([Head | Tail], [X | Result_tail]) :- X is log(Head), log_table(Tail, Result_tail). 

%====================================== QUESTION 4 =====================================
% Given a list of numbers, returns the list of runs, as defined in the assignment specs.
% It is kind of unefficient, but I preffered to not use the cut operator as the prolog notes on the website suggests.

runs([], []).
runs([A], [[A]]).
runs([Head | Tail], [[Head | First_run] | Other_runs]) :- runs(Tail, [First_run | Other_runs]),
							  							  First_run = [Head1 | _], 
							  							  Head =< Head1.
runs([Head | Tail], [[Head] | Runs_tail]) :- runs(Tail, Runs_tail),
					     					 Runs_tail = [[Head1 | _] | _],
				  	     					 Head > Head1.
				  	     				  	     
%======================================= QUESTION 5 =======================================
% Given a tree, calculates the expression represented by it substituting the z by Value.

tree_eval(Value, tree(empty, z, empty), Value).
tree_eval(_, tree(empty, Num, empty), Num).
tree_eval(Value, tree(L, '+', R), X) :-	tree_eval(Value, L, L_val),
										tree_eval(Value, R, R_val),
										X is L_val + R_val.
tree_eval(Value, tree(L, '-', R), X) :-	tree_eval(Value, L, L_val),
										tree_eval(Value, R, R_val),
										X is L_val - R_val.
tree_eval(Value, tree(L, '/', R), X) :-	tree_eval(Value, L, L_val),
										tree_eval(Value, R, R_val),
										X is L_val / R_val.
tree_eval(Value, tree(L, '*', R), X) :-	tree_eval(Value, L, L_val),
										tree_eval(Value, R, R_val),
										X is L_val * R_val.
