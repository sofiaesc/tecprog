% EJERCICIO 1:
factorial(0,1).
factorial(N,F) :- N>0, N1 is N-1, factorial(N1,F1), F is N * F1.

% EJERCICIO 2:
contar(_,[],0). %condicion de corte.
contar(Y,[Y|Lista],Cant):- contar(Y,Lista,Cant2), Cant is Cant2 + 1. %si lo encuentra.
contar(Y,[_|Lista],Cant):- contar(Y,Lista,Cant). % si no lo encuentra.

% EJERCICIO 3:
cantidad([],0). %condicion de cierre.
cantidad([_|R],Elem):- cantidad(R,Elem2), Elem is Elem2 + 1. %cuenta.

% EJERCICIO 4:
suma([],0). %condicion de cierre.
suma([X|R],Suma):- suma(R,Suma2), Suma is Suma2 + X. %suma.

% EJERCICIO 5:
positivos([],[]). %condicion de cierre.
positivos([X|R1],[X|R2]):-X>=0,positivos(R1,R2),!. %encuentra un positivo, lo concatenea en R2.
positivos([_|R1],LP):-positivos(R1,LP). %no encuentra positivo, sigue la recursion.

% EJERCICIO 6:
suma_lista([],[],[]). %condicion de cierre. si tienen longitudes distintas las dos listas, va a devolver false.
suma_lista([X1|R1],[X2|R2],[S|RS]):- S is X1+X2,suma_lista(R1,R2,RS). %concatena la suma del primer elem al segundo elem.

% EJERCIIO 7: 
eliminar(_,[],[]). %condicion de cierre.
eliminar(X,[X|R1],R2):- eliminar(X, R1, R2). % cuando el elemento X es igual al primero de R1, no lo concateno y recursividad.
eliminar(X, [Y|R1], [Y|R2]):- eliminar(X, R1, R2). %cuando el elemento X no es igual al primero de R1, lo concateno a R2 y recursividad.

eliminar_dup([],[]). % condicion de cierre.
eliminar_dup([X|R1],[X|R2]):- eliminar(X, R1, R3), eliminar_dup(R3,R2). % concateno x a R2 y elimino todas las x de R1, luego sigo recursividad.

% EJERCICIO 8:
mayor(E1,E2,E1):- E1 >= E2.
mayor(E1,E2,E2):- E1 < E2.

profundidad([],0). % entro en una lista vacía (rama vacía).
profundidad([_],1). % entro en una lista de un solo elemento (hoja).
profundidad([I,_,D],P):- profundidad(I,PI), profundidad(D,PD), mayor(PI,PD,PAux), P is PAux + 1. %comparo izq y der, sumo 1 cuando entro.

% EJERCICIO 9:
insertar(X,[],[X]). %condicion de corte: llegue al final y es mayor que todos.
insertar(N,[X|R],[N|[X|R]]):- X > N. % cuando X es mayor que N, lo agrego antes de todo el [X|R]
insertar(N,[X|R1],[X|R2]):- insertar(N,R1,R2). %cuando X es menor que N.

% EJERCICIO 10:
ordenar([],[]).
ordenar([X|R],L):- ordenar(R,L2), insertar(X,L2,L).

% EJERCICIO 11:
concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).

aplanar([],[]).
aplanar([X|R],LS):- aplanar(X,L1), aplanar(R,L2), concatenar(L1,L2,LS).
aplanar(X,[X]).

% EJERCICIO 12:
ins(X,L,[X|L]).
ins(X,[Y|L1],[Y|L2]):- ins(X,L1,L2).

per([],[]).
per([X|L],Lp):- per(L,L1), ins(X,L1,Lp).

%Devuelve las permutaciones de una lista. Esto es, las distintas listas
%que se forman al ordenar los elementos de distintas maneras.
%per([1,2,3],L) devuelve las 6 permutaciones posibles:
% L = [1, 2, 3]
% L = [2, 1, 3]
% L = [2, 3, 1]
% L = [1, 3, 2]
% L = [3, 1, 2]
% L = [3, 2, 1]

% La lógica del programa es:
% Llega al final de la lista con la recursión y Lp = [].
% Luego, el último elemento X = 3 se inserta a Lp = [] con ins.
% Esta lista L1 = [3] se devuelve al paso anterior de la recursión.
% Luego inserta X = 2 en L1 = [3], pero el insertar va a devolver dos
% posibles soluciones: Lp = [2,3] y Lp = [3,2], ya que lo inserta al
% principio y al final de la lista, por lo que la recursión va a tomar
% dos caminos. El primer elemento va a tomar L1 = [2,3] y L1 = [3,2].
% Luego inserto X = 1 en L1 = [2,3] y obtengo tres posibilidades:
% Lp = [1,2,3], Lp = [2,1,3] y Lp = [2,3,1]. Ya que inserta X = 1 en
% todas las posiciones posibles (primero, segundo y tercero en Lp).
% Inserta también X = 1 en L1 = [3,2] y obtiene las tres posibilidades:
% Lp = [1,3,2], Lp = [3,1,2] y Lp = [3,2,1].
% Los seis LP que obtiene de la recucrsión per([1|[2,3]],L) son los
% seis L que devuelve ya que es la primer llamada a la función.
