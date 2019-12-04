% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2
% определяет список R, составленный из этих элементов

mrg_sort([],[]).
mrg_sort([X],[X]).
mrg_sort(List,Sorted):- List=[_,_|_],divide(List,L1,L2),mrg_sort(L1,S1),mrg_sort(L2,S2),mrg(S1,S2,Sorted).

mrg([],L,L).
mrg(L,[],L):-L\=[].
mrg([X|T1],[Y|T2],[X|T]):-X=<Y,mrg(T1,[Y|T2],T).
mrg([X|T1],[Y|T2],[Y|T]):-X>Y,mrg([X|T1],T2,T).

% ?- mrg([1,2,5],[0,1,2], R).
% R = [1, 2, 3, 4, 5, 6] .
