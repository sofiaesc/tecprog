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
%fallos:
reemplazar(_,_,Ins,_,_,_):- Ins < 1, write("El valor de inicio debe ser mayor o igual a 1.\n"), !, fail.
reemplazar(_,_,_,Max,_,_):- Max < 1, Max \= 0, Max \= -1, write("La cantidad de reemplazos debe ser -1 o mayor o igual a 1.\n"), !, fail.

%cortes de la recursividad:
reemplazar(_,_,_,_,[],[]):- !.
reemplazar(_,_,_,0,R,R):- !.

%recursividad:
reemplazar(E,X,1,-1,[E|R1],[X|R2]):- reemplazar(E,X,1,-1,R1,R2),!.
reemplazar(E,X,1,Max,[E|R1],[X|R2]):- Max2 is Max - 1, reemplazar(E,X,1,Max2,R1,R2), !.
reemplazar(E,X,Ins,Max,[E|R1],[E|R2]):- Ins > 1, Ins2 is Ins - 1, reemplazar(E,X,Ins2,Max,R1,R2), !.
reemplazar(E,X,Ins,Max,[Y|R1],[Y|R2]):- E \= Y, reemplazar(E,X,Ins,Max,R1,R2).

% Ejercicio 8:
% Cuerpo de conocimientos:
conectado(a,b).
conectado(a,d).
conectado(b,c).
conectado(b,e).
conectado(c,g).
conectado(d,f).
conectado(e,f).
conectado(f,g).
conectado(g,salida).

% Regla:
conectados(X,Y):- conectado(X,Y); conectado(Y,X).

% Verifico si está en la lista el elemento p/ evitar bucles:
miembro(X,[X|_]):- !.
miembro(X,[_|R]):- miembro(X,R).

% Condición de corte. Cuando llega a Entrada (a), termina la recursión.
salir_aux(Entrada,[Entrada|R],[Entrada|R]):- !.

% Recursión. Va buscando las conexiones desde la salida para atrás.
salir_aux(Entrada,[Hab1|R],Camino) :- conectados(Hab1,Hab2), not(miembro(Hab2,[Hab1|R])), salir_aux(Entrada,[Hab2,Hab1|R],Camino).

% Wrapper. Paso la salida para empezar buscando sus conexiones y después llegar hasta Entrada.
salir(Entrada,Camino) :- salir_aux(Entrada,[salida],Camino).