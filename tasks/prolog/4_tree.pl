% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)


consult(['3_quicksort.pl']).

empty.

b_tree([], empty).

b_tree(L, instant(Root, Left, Right)) :-
	split(L, Root, LeftHalf, RightHalf),
	b_tree(LeftHalf, Left),
	b_tree(RightHalf, Right).

split(L, Center, LeftPart, RightPart) :-
	length(L, Llength),
	Half is Llength div 2,
	OtherHalf is Llength - Half - 1,
	OtherHalf >= 0,
	length(LeftPart, Half),
	length(RightPart, OtherHalf),
	append([Center], RightPart, NewPart),
	append(LeftPart, NewPart, L).

balanced_tree(L,T) :- 
	qsort(L, SL),
	b_tree(SL, T).
