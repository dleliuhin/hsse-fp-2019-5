% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный
qsort([],[]).
qsort([H|T], Q) :- separate(H, T, Min, Maj), qsort(Min, M1), qsort(Maj, M2), append(M1,[H|M2],Q).

%separate(Pivot, List, Minor, Major)
separate(_,[],[],[]).
separate(X,[A|B],[A|Min],Maj) :- A =< X, separate(X, B, Min, Maj).
separate(X,[A|B],Min,[A|Maj]) :- A > X, separate(X, B, Min, Maj).

% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

separate_in_half(List, Left, Right):-
    append(Left, Right, List),
    length(List, ListLength),
    LengthHalf is div(ListLength, 2),
    length(Left, LengthHalf).

btree([], empty).
btree(List, instant(Root, L, R)):-
      separate_in_half(List, LH, [Root|RH]),
      btree(LH, L),
      btree(RH, R).

balanced_tree(L, T) :-
	qsort(L, R),
	btree(R, T).

% ?- balanced_tree([], T).
% T = empty

% ?- balanced_tree([123, -1, 0, 3, 8, 34, 89, -25, 65], T).
% T = instant(8, instant(0, instant(-1, instant(-25, empty, empty), empty), instant(3, empty, empty)), instant(89, instant(65, instant(34, empty, empty), empty), instant(123, empty, empty)))
