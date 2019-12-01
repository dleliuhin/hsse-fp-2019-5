% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

bool(true).
bool(false).

not(A) :- A, !, false.
not(_).


and(A,B)  :- A,B.
or(A,B)   :- A;B.
equ(A, B) :- A=B.
xor(A,B)  :- not(equ(A,B)).

exec(A,true) :- A, !.
exec(_,false).

truth_table(A,B,C) :- bool(A), bool(B), write(A), write('  '), write(B), write('  '), exec(C, Result), writeln(Result), false.


% ?-truth_table(A,B,and(A,or(A,B))).

% true true true
% true fail true
% fail true fail
% fail fail fail
