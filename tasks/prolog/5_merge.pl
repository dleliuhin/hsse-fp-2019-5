mrg(L1, L2, R):- merge(L1, L2, R).
merge([],[],[]).
merge(L1, [], L1).
merge([], L1, L1).

merge(L1, L2, R) :- L1 = [H1|T1], L2 = [H2|_], H1 =< H2, R = [H1|TResult], mrg(T1, L2, TResult).
merge(L1, L2, R) :- L1 = [H1|_], L2 = [H2|T2], H1 > H2, R = [H2|TResult],  mrg(L1, T2, TResult).

%?- mrg([],[],R).
%R = []

%?- mrg([-6,10],[],R).
%?- mrg([],[-6,10],R).
%R = [-6, 10]

%?- mrg([-4,5,8,10],[-2,6,15,16],R).
%R = [-4, -2, 5, 6, 8, 10, 15, 16]