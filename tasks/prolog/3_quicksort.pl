qsort([], []).
qsort([H|T], List) :- pivot(H, T, L1, L2),
    qsort(L1, List1), qsort(L2, List2),
    append(List1, [H|List2], List).

pivot(_, [], [], []).
pivot(Piv, [H|T], [H|LessT], LargerT) :- Piv >= H, pivot(Piv, T, LessT, LargerT).
pivot(Piv, [H|T], LessT, [H|LargerT]) :- Piv < H, pivot(Piv, T, LessT, LargerT).

%?- qsort([4,8,1,19,58,3,5],K).
%K = [1, 3, 4, 5, 8, 19, 58]