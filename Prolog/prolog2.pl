% EJERCICIO 1:
factorial(0,1).
factorial(N,F) :- N>0, N1 is N-1, factorial(N1,F1), F is N * F1.

% EJERCICIO 2:
contar(_,[],0). %condicion de corte.
contar(Y,[Y|Lista],Cant):- contar(Y,Lista,Cant2), Cant is Cant2 + 1. %si lo encuentra.
contar(Y,[_|Lista],Cant):- contar(Y,Lista,Cant). %wrapper.

% EJERCICIO 3:
cantidad([],0). %condicion de cierre.
cantidad([_|R],Elem):- cantidad(R,Elem2), Elem is Elem2 + 1. %cuenta.

% EJERCICIO 4:
suma([],0).
suma([X|R],Suma):- suma(R,Suma2), Suma is Suma2 + X.

% EJERCICIO 5:
positivos([],[]).
positivos([X|R1],[X|R2]):-X>=0,positivos(R1,R2),!.
positivos([_|R1],LP):-positivos(R1,LP).

% EJERCICIO 6:
suma_lista([],[],[]).
suma_lista([X1|R1],[X2|R2],[S|RS]):- S is X1+X2,suma_lista(R1,R2,RS).

% EJERCIIO 7: 
eliminar(_,[],[]).
eliminar(X,[X|R1],R2):- eliminar(X, R1, R2).
eliminar(X, [Y|R1], [Y|R2]):- eliminar(X, R1, R2).

eliminar_dup([],[]).
eliminar_dup([X|R1],[X|R2]):- eliminar(X, R1, R3), eliminar_dup(R3,R2).