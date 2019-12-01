% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

prepare(_,[],[],[]).
prepare(Sorted,[Head|Tail],[Head|L1],L2) :- Head =< Sorted, prepare(Sorted,Tail,L1,L2).
prepare(Sorted,[Head|Tail],L1,[Head|L2]) :- Head > Sorted, prepare(Sorted,Tail,L1,L2).

quicksort([Head|Tail],R) :-
    prepare(Head,[Head|Tail],[H1|L1],L2),
    quicksort(L1,R1), quicksort(L2,R2),
    append(R1,[H1|R2],R).
quicksort([],[]).

split(List, Left, Right):-
    append(Left, Right, List),
    length(List, Length),
    HalfLength is Length div 2,
    length(Left, HalfLength).

binary_tree([], empty).
binary_tree(List, instant(Root, Left, Right)):-
      split(List, LeftHalf, [Root|RightHalf]),
      binary_tree(LeftHalf, Left),
      binary_tree(RightHalf, Right).

balanced_tree(L,T) :-
	quicksort(L, R),
	binary_tree(R, T).

% ?- balanced_tree([3,2,1],T).
% T = instant(2, instant(1, empty, empty), instant(3, empty, empty))
