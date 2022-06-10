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

% EJERCICIO 5: %POCHO
positivo(X):- X >= 0.

concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).

%listaPositivos([],L2).
%listaPositivos([X|L1],L2):- positivo(X), concatenar().

% EJERCICIO 6: %POCHO
misma_longitud(L1,L2):- cantidad(L1,E1), cantidad(L2,E2), E1 = E2.
suma_lista([],[],[]).
suma_lista([X|R1],[Y|R2],LS):- Z is X + Y, concatenar(Z,LS,L2), suma_lista(R1,R2,L2).
suma_lista([_|L1],[_|L2],LS):- misma_longitud(L1,L2), suma_lista(L1,L2,LS). %wrapper.