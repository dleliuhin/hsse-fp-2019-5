% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

pivot(_, [], [], []).

pivot(Pivot, [H|T], [H|L], R) :- 
	Pivot >= H, 
	pivot(Pivot, T, L, R). 

qsort([], []).

pivot(Pivot, [H|T], L, [H|R]) :- 
	pivot(Pivot, T, L, R).


qsort([H|T], M) :- 
	pivot(H, T, L, R), 
	qsort(L, LM), 
	qsort(R, RM),
	append(LM, [H|RM], M).

?- qsort([17, 24, 30, 88, 3], M).
%[3, 17, 24, 30, 88]
