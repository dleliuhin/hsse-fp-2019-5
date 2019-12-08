balanced_tree(L,T) :- bt(L,T).
qsort([], []).
qsort([H|T], List) :- pivot(H,T,L1,L2),qsort(L1,List1), qsort(L2,List2),append(List1,[H|List2],List).

pivot(_, [], [], []).
pivot(Piv, [H|T], [H|LessT], LargerT) :- Piv >= H, pivot(Piv, T, LessT, LargerT).
pivot(Piv, [H|T], LessT, [H|LargerT]) :- Piv < H, pivot(Piv, T, LessT, LargerT).

bt([],empty).
bt([H|[]], instant(H,empty,empty)):- !.
bt([T|[H|[]]],instant(H,L,empty)):- T =< H,bt([T],L).
bt([H|[T|[]]],instant(H,L,empty)):- H < T,bt([T],L).

bt(L, instant(R, Left, Right)):- qsort(L,SL), append(LList, [R|RList], SL),
                       length(LList, LengthL), length([R|RList], LengthR),
                       (LengthL =:= LengthR; LengthL =:= (LengthR - 1)),
                       bt(LList, Left), bt(RList, Right),!.

%?- balanced_tree([1,8,6,4,3],T).
%T = instant(4, instant(3, instant(1, empty, empty), empty), instant(8, instant(6, empty, empty), empty))