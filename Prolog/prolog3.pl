% EJERCICIO 1:
factorial(0, 1):- !.
factorial(Numero, Factorial) :- Numero > 0, NumeroAnt is Numero - 1, factorial(NumeroAnt, FactorialAnt), Factorial is Numero * FactorialAnt.

% EJERCICIO 2:
p(1).
p(2):-!.
p(3).

% a. p(X). ------------> X = 1; X = 2.
% 	Da los dos resultados posibles de X.
% b. p(X), p(Y). ------> X = Y = 1; X = 1, Y = 2; X = 2, Y = 1; X = Y = 2.
% 	Da todos los resultados posibles para X e Y.
% c. p(X), !, p(Y). ---> X = Y = 1; X = 1, Y = 2.
% 	Busca p(X), encuentra X = 1 y corta la búsqueda de X por el ! a continuación.
%   Después sigue buscando los Y posibles.

% EJERCICIO 3:
eliminar_primero([],_,[]).
eliminar_primero([X|R1],X,R1):- !.
eliminar_primero([Y|R1],X,[Y|R2]):- eliminar_primero(R1,X,R2).

% EJERCICIO 4:
agregar_nuevo(X,[],[X]):- !.
agregar_nuevo(X,[X|R],[X|R]):- !.
agregar_nuevo(X,[Y|R1],[Y|R2]):- agregar_nuevo(X,R1,R2).

% EJERCICIO 5:
semejanza([],[],0):- !.
semejanza([_|R1],[],N):- semejanza(R1,[],N1), N is N1-1, !.
semejanza([],[_|R2],N):- semejanza([],R2,N1), N is N1-1, !.
semejanza([X|R1],[X|R2],N):- semejanza(R1,R2,N1), N is N1+1, !.
semejanza([_|R1],[_|R2],N):- semejanza(R1,R2,N1), N is N1-1.

% EJERCICIO 6:
dic([sanar, hola, sabana, sabalo, prueba, computadora, cartera, mate, termo, mesa, silla, sarna]).

miembro(X,[X|_]):- !.
miembro(X,[_|R]):- miembro(X,R).

buscar_aux(_,[],[]):- !.
buscar_aux(X,[Y|R1],[[Y, N]|R2]):- atom_chars(Y,LY), semejanza(X,LY,N), N > 0, buscar_aux(X,R1,R2), !.
buscar_aux(X,[_|R1],R2):- buscar_aux(X,R1,R2).

buscar(X,[X]):- dic(LDic), miembro(X,LDic), !.
buscar(X,L):- dic(LDic), not(miembro(X,LDic)), atom_chars(X,LElem), buscar_aux(LElem,LDic,L).

% EJERCICIO 7:
reemplazar_aux(_,_,_,[],[]):-!.
reemplazar_aux(_,_,Max,_,_):- Max = 0, !.
reemplazar_aux(Reemplazo,Reemplazado,Max,[Reemplazado|R1],[Reemplazo|R2]):- Max2 is Max-1, reemplazar_aux(Reemplazo,Reemplazado,Max2,R1,R2).
reemplazar_aux(Reemplazo,Reemplazado,Max,[X|R1],[X|R2]):- reemplazar_aux(Reemplazo,Reemplazado,Max,R1,R2).

reemplazar(_,_,_,_,[],[]):- !.
reemplazar(Reemplazo,Reemplazado,Ins,Max,L,LR):- Ins = 1, reemplazar_aux(Reemplazo,Reemplazado,Max,L,LR).
reemplazar(Reemplazo,Reemplazado,Ins,Max,[Reemplazado|R1],[Reemplazado|R2]):- Ins > 1, Ins2 = Ins-1, reemplazar(Reemplazo,Reemplazado,Ins2,Max,R1,R2).
reemplazar(Reemplazo,Reemplazado,Ins,Max,[X|R1],[X|R2]):- reemplazar(Reemplazo,Reemplazado,Ins,Max,R1,R2).

% condiciones de false:
reemplazar(_,_,Ins,_,_,_):- Ins < 1, fail.
reemplazar(_,_,_,Max,_,_):- Max = 0, fail.
reemplazar(_,_,_,Max,_,_):- Max < -1, fail.
