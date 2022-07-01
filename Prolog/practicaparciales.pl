% ----------------EJERCICIO SWYPE----------------

diccionario([hola, hoja, hija, gato, perro, casa]).

% Función que valida que los elementos sean átomos.
validacion([]):- !.
validacion([X|R]):- atom(X), validacion(R).

% Función para ver si un elemento está en una lista:
miembro(X,[X|_]):- !.
miembro(X,[_|R]):- miembro(X,R).

% función para ver si todos los elementos de una lista están en otra lista.
miembro_l([],_):- !.
miembro_l([X|R1],L):- miembro(X,L), miembro_l(R1,L).

% Auxiliar:
swype_aux(_,[],[]):- !.
swype_aux(L,[X|R1],[X|R2]):- atom_chars(X,LC), miembro_l(LC,L), swype_aux(L,R1,R2), !.
swype_aux(L,R1,[_|R2]):- swype_aux(L,R1,R2).

% Wrapper:
swype(L,LF):- validacion(L), diccionario(Dic), swype_aux(L,LF,Dic).

% ----------------EJERCICIO ORDENAR DE A CINCO ----------------

f(b).
f(a).
f(f).
f(a).
f(c).
f(d).
f(g).
f(h).
f(c).

lista_atomos(L):- findall(X,f(X),L).

eliminar(_,[],[]):- !.
eliminar(X,[X|R],R2):- eliminar(X,R,R2), !.
eliminar(X,[Y|R],[Y|R2]):- eliminar(X,R,R2).

insertar(X,[],[X]):- !. 
insertar(N,[X|R],[N|[X|R]]):- X @> N, !. 
insertar(N,[X|R1],[X|R2]):- insertar(N,R1,R2). 

ordenar_lista([],[]):- !.
ordenar_lista([X|R],L):- eliminar(X,R,R2), ordenar_lista(R2,L2), insertar(X,L2,L).

dividir([X1,X2,X3,X4,X5|L],[[X1,X2,X3,X4,X5]|L1]):- dividir(L,L1), !.
dividir(L,[L]).

resu(R):- lista_atomos(L), ordenar_lista(L,L2), dividir(L2,R).

% ----------------EJERCICIO SOPA----------------

