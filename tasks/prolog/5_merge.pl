% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов


merge([H1 | L1], [H2 | L2], R) :- 
	H1 < H2,
	merge(L1, [H2 | L2], R1),
	append([H1], R1, R).


merge([H1 | L1], [H2 | L2], R) :-
	H1 >= H2,
	merge([H1 | L1], L2, R1),
	append([H2], R1, R).

merge([H1 | L1], [], R) :-
	merge(L1, [], Res),
	append([H1], Res, R).

merge([], [H2 | L2], R) :-
	merge([], L2, Res),
	append([H2], Res, R).

merge([],[], []).

mrg(L1, L2, R) :- merge(L1, L2, R), !.
