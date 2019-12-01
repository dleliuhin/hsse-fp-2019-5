% есть набор фактов вида father(person1, person2) (person1 is the father of person2)
% Необходимо определить набор предикатов:
% 1. brother(X,Y)    -  определяющий являются ли аргументы братьями
% 2. cousin(X,Y)     -  определяющий являются ли аргументы двоюродными братьями
% 3. grandson(X,Y)   -  определяющий является ли аргумент Х внуком аргумента Y
% 4. descendent(X,Y) -  определяющий является ли аргумент X потомком аргумента Y
% 5. используя в качестве исходных данных следующий граф отношений
	father(a,b).  % 1                 
	father(a,c).  % 2
	father(b,d).  % 3
	father(b,e).  % 4
	father(c,f).  % 5
% указать в каком порядке и какие ответы генерируются вашими методами
	?- brother(X,Y).
	?- cousin(X,Y).
	?- grandson(X,Y).
	?- descendent(X,Y).

% X является внуком для Y только если отец Х является сыном для Y
grandson(X,Y) :- father(Y, Z), father(Z,X).

% ?- grandson(a,d). true
% ?- grandson(e,c). false

% Х и Y братья только если отцом каждого из них является один и тот же человек, при этом Х и Y - разные.
brother(X,Y) :- dif(X,Y), father(Z,X), father(Z,Y).

% ?- brother(b,c). true
% ?- brother(a,d). false

% X является потомком Y только если кто то из потомков У или сам Y является отцом X
descendent(X,Y) :- father(Y,X); father(F,X), descendent(F,Y).

% ?- descendent(a,b). true
% ?- descendent(c,e). false

% Х и Y двоюродные братья только если их отцы являются братьями.
cousin(X,Y) :- father(Za,X), father(Zb,Y), brother(Za,Zb).

% ?- cousin(b,c). false
% ?- cousin(e,f). true
