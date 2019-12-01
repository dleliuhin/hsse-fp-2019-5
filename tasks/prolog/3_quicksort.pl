% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

prepare(_,[],[],[]).
prepare(Sorted,[Head|Tail],[Head|L1],L2) :- Head =< Sorted, prepare(Sorted,Tail,L1,L2).
prepare(Sorted,[Head|Tail],L1,[Head|L2]) :- Head > Sorted, prepare(Sorted,Tail,L1,L2).

quicksort([Head|Tail],R) :-
    prepare(Head,[Head|Tail],[H1|L1],L2),
    quicksort(L1,R1), quicksort(L2,R2),
    append(R1,[H1|R2],R).
quicksort([],[]).

% ?- quicksort([5,4,3,6],A).
% ?- quicksort([],A).
