% ----------------Función para contar las veces que aparece un elemento.
contar(_,[],0). %condicion de corte.
contar(Y,[Y|Lista],Cant):- contar(Y,Lista,Cant2), Cant is Cant2 + 1. %si lo encuentra.
contar(Y,[_|Lista],Cant):- contar(Y,Lista,Cant). % si no lo encuentra.

% ----------------Función que cuenta la cantidad de elementos de una lista.
largo([],0). %condicion de cierre.
largo([_|R],Elem):- largo(R,Elem2), Elem is Elem2 + 1. %cuenta.

% ----------------Función que suma los elementos de una lista.
suma([],0). %condicion de cierre.
suma([X|R],Suma):- suma(R,Suma2), Suma is Suma2 + X. %suma.

% ----------------Función que deja sólo los positivos de una lista.
positivos([],[]). %condicion de cierre.
positivos([X|R1],[X|R2]):-X>=0,positivos(R1,R2),!. %encuentra un positivo, lo concatenea en R2.
positivos([_|R1],LP):-positivos(R1,LP). %no encuentra positivo, sigue la recursion.

% ----------------Función que suma dos listas elemento a elemento y devuelve una lista con las sumas.
suma_lista([],[],[]). %condicion de cierre. si tienen longitudes distintas las dos listas, va a devolver false.
suma_lista([X1|R1],[X2|R2],[S|RS]):- S is X1+X2,suma_lista(R1,R2,RS). %concatena la suma del primer elem al segundo elem.

% ----------------Función que elimina todas las veces que aparece un elemento de una lista.
eliminar(_,[],[]). %condicion de cierre.
eliminar(X,[X|R1],R2):- eliminar(X, R1, R2). % cuando el elemento X es igual al primero de R1, no lo concateno y recursividad.
eliminar(X, [Y|R1], [Y|R2]):- eliminar(X, R1, R2). %cuando el elemento X no es igual al primero de R1, lo concateno a R2 y recursividad.

% ----------------Función que eliminar los duplicados de una lista.
eliminar_dup([],[]). % condicion de cierre.
eliminar_dup([X|R1],[X|R2]):- eliminar(X, R1, R3), eliminar_dup(R3,R2). % concateno x a R2 y elimino todas las x de R1, luego sigo recursividad.

% ----------------Función que devuelve el mayor de dos elementos.
mayor(E1,E2,E1):- E1 >= E2.
mayor(E1,E2,E2):- E1 < E2.

% ----------------Función que devuelve la profundidad de un arbol binario.
profundidad([],0). % entro en una lista vacía (rama vacía).
profundidad([_],1). % entro en una lista de un solo elemento (hoja).
profundidad([I,_,D],P):- profundidad(I,PI), profundidad(D,PD), mayor(PI,PD,PAux), P is PAux + 1. %comparo izq y der, sumo 1 cuando entro.

% ----------------Función que inserta un elemento al final de una lista.
insertar(X,[],[X]). %condicion de corte: llegue al final y es mayor que todos.
insertar(N,[X|R],[N|[X|R]]):- X > N. % cuando X es mayor que N, lo agrego antes de todo el [X|R]
insertar(N,[X|R1],[X|R2]):- insertar(N,R1,R2). %cuando X es menor que N.

% ----------------Función que ordena una lista de menor a mayor.
ordenar([],[]).
ordenar([X|R],L):- ordenar(R,L2), insertar(X,L2,L).

% ----------------Función que concatena una lista con otra.
concatenar([],L,L):- !.
concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).

% ----------------Función que aplana una lista, dejando sólo elementos dentro de ella.
aplanar([],[]):- !.
aplanar([X|R],LS):- aplanar(X,L1), aplanar(R,L2), concatenar(L1,L2,LS), !.
aplanar(X,[X]).

% ----------------Función que elimina la primera instancia de un elemento X de una lista.
eliminar_primero([],_,[]).
eliminar_primero([X|R1],X,R1):- !.
eliminar_primero([Y|R1],X,[Y|R2]):- eliminar_primero(R1,X,R2).

% ----------------Función que agrega un elemento al final si no está en la lista.
agregar_nuevo(X,[],[X]):- !.
agregar_nuevo(X,[X|R],[X|R]):- !.
agregar_nuevo(X,[Y|R1],[Y|R2]):- agregar_nuevo(X,R1,R2).

% ----------------Función que compara dos listas y sus elementos. +1 si coinciden, -1 si no coinciden.
semejanza([],[],0):- !.
semejanza([_|R1],[],N):- semejanza(R1,[],N1), N is N1-1, !.
semejanza([],[_|R2],N):- semejanza([],R2,N1), N is N1-1, !.
semejanza([X|R1],[X|R2],N):- semejanza(R1,R2,N1), N is N1+1, !.
semejanza([_|R1],[_|R2],N):- semejanza(R1,R2,N1), N is N1-1.

% ----------------Función que busca una palabra en una lista o las que son parecidas (semejanza >= 1).
dic([sanar, hola, sabana, sabalo, prueba, computadora, cartera, mate, termo, mesa, silla, sarna]).

miembro(X,[X|_]):- !.
miembro(X,[_|R]):- miembro(X,R).

buscar_aux(_,[],[]):- !.
buscar_aux(X,[Y|R1],[[Y, N]|R2]):- atom_chars(Y,LY), semejanza(X,LY,N), N > 0, buscar_aux(X,R1,R2), !.
buscar_aux(X,[_|R1],R2):- buscar_aux(X,R1,R2).

buscar(X,[X]):- dic(LDic), miembro(X,LDic), !.
buscar(X,L):- dic(LDic), not(miembro(X,LDic)), atom_chars(X,LElem), buscar_aux(LElem,LDic,L).

% ----------------Función que reemplaza un elemento X por otro Y, desde cierta instancia y un numero dado de veces.
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

% ----------------Función que devuelve distintos caminos posibles desde una entrada a una salida dada, sin bucles.
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

% Función de amenazas de ajedrez.
reina(2,3).
alfil(6,3).
torre(8,5).

diferencia(F,C,X):- F >= C, X is F - C, !.
diferencia(F,C,X):- F < C, X is C - F.

amenaza(F,C,torre(F2,C2)):- torre(F2,C2), F =:= F2; torre(F2,C2), C =:= C2.
amenaza(F,C,alfil(F2,C2)):- alfil(F2,C2), diferencia(F,F2,D1), diferencia(C,C2,D2), D1 =:= D2.
amenaza(F,C,reina(F2,C2)):- reina(F2,C2), diferencia(F,F2,D1), diferencia(C,C2,D2), D1 =:= D2; reina(F2,C2), F =:= F2; reina(F2,C2), C =:= C2.

% ----------------Función que devuelve las recomendaciones de Netflix de un usuario, dada cierta semejanza con otros usuarios.
% Función que determina si un elemento es miembro de una lista.
miembro(X,[X|_]):- !.
miembro(X,[_|R]):- miembro(X,R).

% Base de conocimientos:
peliculas(josé,["Misterio a Bordo","The Perfection","Otro día para matar","Barreras","Yo soy Sam","Inception"]).
peliculas(maría,["Quizás para siempre","La casa del Lago","Barreras"]).
peliculas(pedro,["Barreras","Otro día para matar","Yo soy Sam","A pesar de todo"]).

% Cuenta las películas comunes entre ambos.
peliculascomunes([],_,0):- !.
peliculascomunes([X|R1],L2,Cantidad):- miembro(X,L2), peliculascomunes(R1,L2,Cantidad2), Cantidad is Cantidad2 + 1, !.
peliculascomunes([X|R1],L2,Cantidad):- not(miembro(X,L2)), peliculascomunes(R1,L2,Cantidad).

% Determina si son similares, según la cantidad de películas comunes.
similitud(X,Y):- peliculas(X,P1), peliculas(Y,P2), X\=Y, peliculascomunes(P1,P2,Cantidad), Cantidad > 2, !.

% Función auxiliar:
recomendaciones_aux(_,[],[]):- !.
recomendaciones_aux(L1,[X|R],R2):- miembro(X,L1), recomendaciones_aux(L1,R,R2),!.
recomendaciones_aux(L1,[X|R],[X|R2]):- recomendaciones_aux(L1,R,R2).
    
% WRAPPER:
recomendaciones(Persona,Peliculas):- similitud(Persona,Persona2), peliculas(Persona,L1), peliculas(Persona2,L2), recomendaciones_aux(L1,L2,Peliculas), !.
recomendaciones(_,[]). % Si no entró por la función anterior (que corta una vez que entró), devuelve lista vacía. Sin esto, devuelve false.

% ----------------Funciones para definir union, interseccion y diferencia de conjuntos.
% Función que valida la que la lista no tenga repetidos.
valido([]):- !.
valido([X|R]):- miembro(X,R), !, fail.
valido([_|R]):- valido(R).

% union:
union(L1,_,_):- not(valido(L1)), write("Conjunto 1 inválido.\n"), !, fail.
union(_,L2,_):- not(valido(L2)), write("Conjunto 2 inválido.\n"), !, fail.
union([],[],[]):- !.
union([],[X|R1],R2):- miembro(X,R2), union([],R1,R2), !.
union([],[X|R1],[X|R2]):- union([],R1,R2), !. 
union([X|R],L2,R2):- miembro(X,R2), union(R,L2,R2), !.
union([X|R],L2,[X|R2]):- union(R,L2,R2).

%interseccion:
interseccion(L1,_,_):- not(valido(L1)), write("Conjunto 1 inválido.\n"), !, fail.
interseccion(_,L2,_):- not(valido(L2)), write("Conjunto 2 inválido.\n"), !, fail.
interseccion([],_,[]):- !.
interseccion([X|R],L2,[X|R2]):- miembro(X,L2), interseccion(R,L2,R2), !.
interseccion([X|R],L2,R2):- not(miembro(X,L2)), interseccion(R,L2,R2).

%diferencia:
eliminar(_,[],[]). %condicion de cierre.
eliminar(X,[X|R1],R2):- eliminar(X, R1, R2). % cuando el elemento X es igual al primero de R1, no lo concateno y recursividad.
eliminar(X, [Y|R1], [Y|R2]):- eliminar(X, R1, R2).

diferencia(L1,_,_):- not(valido(L1)), write("Conjunto 1 inválido.\n"), !, fail.
diferencia(_,L2,_):- not(valido(L2)), write("Conjunto 2 inválido.\n"), !, fail.
diferencia([],_,[]):- !.
diferencia([X|R],L2,[X|R2]):- not(miembro(X,L2)), diferencia(R,L2,R2), !.
diferencia([X|R],L2,R2):- miembro(X,L2), eliminar(X,L2,R3), diferencia(R,R3,R2).

% ----------------Función que devuelve los posibles viajes de un origen a un destino, con un horario de llegada.
viaje('Paraná', 'Santa Fe', 7, 1).
viaje('Paraná', 'Santa Fe', 13, 1).
viaje('Paraná', 'Santa Fe', 18, 1).
viaje('Santa Fe', 'Paraná', 4, 1).
viaje('Santa Fe', 'Paraná', 13, 1).
viaje('Santa Fe', 'Paraná', 19, 1).
viaje('Paraná', 'Corrientes', 3, 9).
viaje('Paraná', 'Corrientes', 8, 9).
viaje('Paraná', 'Corrientes', 16, 9).
viaje('Corrientes', 'Paraná', 0, 9).
viaje('Corrientes', 'Paraná', 10, 9).
viaje('Corrientes', 'Paraná', 18, 9).
viaje('Santa Fe', 'Rosario', 5, 3).
viaje('Santa Fe', 'Rosario', 9, 3).
viaje('Santa Fe', 'Rosario', 20, 3).
viaje('Rosario', 'Santa Fe', 3, 3).
viaje('Rosario', 'Santa Fe', 11, 3).
viaje('Rosario', 'Santa Fe', 18, 3).
viaje('Santa Fe', 'Córdoba', 6, 5).
viaje('Santa Fe', 'Córdoba', 16, 5).
viaje('Santa Fe', 'Córdoba', 22, 5).
viaje('Córdoba', 'Santa Fe', 8, 5).
viaje('Córdoba', 'Santa Fe', 14, 5).
viaje('Córdoba', 'Santa Fe', 20, 5).
viaje('Santa Fe', 'Resistencia', 3, 9).
viaje('Santa Fe', 'Resistencia', 12, 9).
viaje('Santa Fe', 'Resistencia', 19, 9).
viaje('Resistencia', 'Santa Fe', 6, 9).
viaje('Resistencia', 'Santa Fe', 12, 9).
viaje('Resistencia', 'Santa Fe', 16, 9).
viaje('Corrientes', 'Resistencia', 8, 1).
viaje('Corrientes', 'Resistencia', 12, 1).
viaje('Corrientes', 'Resistencia', 16, 1).
viaje('Resistencia', 'Corrientes', 9, 1).
viaje('Resistencia', 'Corrientes', 11, 1).
viaje('Resistencia', 'Corrientes', 17, 1).
viaje('Resistencia', 'Tucumán', 2, 5).
viaje('Resistencia', 'Tucumán', 8, 5).
viaje('Resistencia', 'Tucumán', 19, 5).
viaje('Tucumán', 'Resistencia', 4, 5).
viaje('Tucumán', 'Resistencia', 7, 5).
viaje('Tucumán', 'Resistencia', 12, 5).
viaje('Tucumán', 'Resistencia', 18, 5).
viaje('Córdoba', 'Tucumán', 5, 8).
viaje('Córdoba', 'Tucumán', 11, 8).
viaje('Córdoba', 'Tucumán', 22, 8).
viaje('Tucumán', 'Córdoba', 7, 8).
viaje('Tucumán', 'Córdoba', 12, 8).
viaje('Tucumán', 'Córdoba', 18, 8).

% Función auxiliar para sumar las horas tal que su dominio sea [0,24].
suma_horas(Horas,Cantidad,Aux):- Aux is Horas+Cantidad, Aux < 24, !.
suma_horas(Horas,Cantidad,Resul):-Aux is Horas+Cantidad, Aux >= 24, Resul is Aux - 24.

% Función auxiliar para determinar si un elemento es miembro de una lista.
miembro(X,[X|_]):- !.
miembro(X,[_|Resto]):-
    miembro(X,Resto).

% Llega al destino desde una escala.
camino_aux(Origen,Destino,Llegada,HorasAcum,_,[[Origen,Destino,Salida,Llego]]):-
    viaje(Origen,Destino,Salida,Horas),
    Cond is Salida - HorasAcum,
    Cond =< 2, Cond >= 0,
    suma_horas(HorasAcum,Cond,Espera),
    suma_horas(Espera,Horas,Llego),
    Dif2 is Llegada - Llego, Dif2 =< 2, Dif2 >= 0,!.

% Sigue buscando escalas hasta llegar al destino.
camino_aux(Origen,Destino,Llegada,HorasAcum,Visitados,[[Origen,Escala,Salida,Llego]|Resul]):-
    viaje(Origen,Escala,Salida,Horas),
    Escala \= Destino,
    Cond is Salida - HorasAcum,
    Cond =< 2, Cond >= 0,
    suma_horas(HorasAcum,Cond,Espera),
    not(miembro(Escala,Visitados)),
    suma_horas(Espera,Horas,Llego),
    camino_aux(Escala,Destino,Llegada,Llego,[Escala|Visitados],Resul).

% Llega al destino sin escalas.
camino(Origen,Destino,Llegada,[[Origen,Destino,Salida,Llego]]):-
    viaje(Origen,Destino,Salida,Horas),
    suma_horas(Salida,Horas,Llego),
    Dif2 is Llegada - Llego, Dif2 =< 2, Dif2 >= 0, !.

% Llama al auxiliar para buscar las escalas hasta llegar a destino.
camino(Origen,Destino,Llegada,[[Origen,Escala,Salida,Llego]|Tramos]):-
    viaje(Origen,Escala,Salida,Horas),
    suma_horas(Salida,Horas,Llego),
    camino_aux(Escala,Destino,Llegada,Llego,[Escala|[Origen]],Tramos).

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

% ---------------- EJERCICIO: CAMINOS SUMA MINIMA DE ÁRBOL BINARIO ----------------
sumar([], 0) :- !.
sumar([X|L], V) :- sumar(L, V1), V is X + V1.

caminos([X], [X]):-!.
caminos([I, N, _], [N|Ci]) :- caminos(I, Ci).
caminos([_, N, D], [N|Cd]) :- caminos(D, Cd).

menor_valor([X], V) :- sumar(X, V), !.
menor_valor([C | R], Vm) :- sumar(C, V), menor_valor(R, V1), Vm is min(V, V1).

lista_caminos(A,L):- findall(X, caminos(A, X), L).

caminos_min(A, C) :- lista_caminos(A,L), menor_valor(L, V), findall(X, (caminos(A, X), sumar(X, V)), C).

% ---------------- EJERCICIO: CAMINOS SUMA MÁXIMA DE ÁRBOL ----------------
sumar([], 0) :- !.
sumar([X|L], V) :- sumar(L, V1), V is X + V1.

caminos([X], [X]):-!.
caminos([X|L], [X|L1]) :- member(C, L), caminos(C, L1).

mayor_valor([], 0) :- !.
mayor_valor([C | R], Vm) :- sumar(C, V), mayor_valor(R, V1), Vm is max(V, V1).

lista_caminos(A,L):- findall(X, caminos(A, X), L).

caminos_max(A, C) :- lista_caminos(A,L), mayor_valor(L, V), findall(X, (caminos(A, X), sumar(X, V)), C).

% ---------------- EJERCICIO: OBTENER ELEMENTO DE UNA LISTA QUE MAS SE REPITE ----------------

validar(L):-forall(member(X,L),atom(X)).

contar(_,[],0):-!.
contar(X,[X|C],S):-contar(X,C,S1),!,S is S1+1.
contar(X,[_|C],S):-contar(X,C,S).

eliminar(_,[],[]):-!.
eliminar(X,[X|C],C1):-eliminar(X,C,C1),!.	
eliminar(X,[M|C],[M|C1]):-eliminar(X,C,C1).

armar([],[]):-!.
armar([X|C],[[X,Y]|C1]):-contar(X,C,S),Y is S+1,eliminar(X,C,L1),armar(L1,C1),!.


maximo([[W,Z]],[W,Z]):-!.
maximo([[_,Y]|L],[W,Z]):-maximo(L,[W,Z]),Y<Z,!.
maximo([[X,Y]|_],[X,Y]).

encontrar_max([],[]):-!.
encontrar_max(C,_):-not(validar(C)),!,write('Lista no valida').
encontrar_max(C,L):-armar(C,L1),maximo(L1,L).

% ---------------- EJERCICIO SOPA DE LETRAS ----------------
%S=([[q,h,o,l,a],[u,o,r,w,q],[k,l,q,a,z],[z,a,y,w,e],[z,x,c,v,b]]).
%S=([[q,h,o,l,a],
%    [u,o,r,w,q],
%    [k,l,q,a,z],
%    [z,a,y,w,e],
%    [z,x,c,v,b]]).

%Funcion auxiliar. Pasa el primer elemento de todas las listas de la primer lista a la segunda
pasar_primero([],[],[]):-!.
pasar_primero([[X|R]|RF1],[X|RC],[R|RF2]):-pasar_primero(RF1,RC,RF2).

%Funcion auxiliar. S con las filas como columnas y las columnas como filas.
%Caso 1: las filas estan vacias.
inversa([[]|_],[]):-!.
%Caso 2: pasamos el primero de cada fila a C, y hacemos la llamada recursiva con S sin los primero de la cada fila.
inversa(S,[C|RC]):-pasar_primero(S,C,SSinPrimero),inversa(SSinPrimero,RC).

%Funcion auxiliar. Verifica que las letras de P se encuentren una detras de la otra en L.
%A diferencia de en_fila, corta con el primer fallo.
seguidas([],_):-!.
seguidas([X|R1],[X|R2]):-seguidas(R1,R2).

%Funcion auxiliar. Devuelve true si la palabla del primer argumento
%se encuentra en la lista del segundo argumento.
%Busca la primer cohincidencia y verifica que las demas letras se encuentren una seguida de la otra con seguidas().
%Busca cohincidencias hasta vaciarla lista.
%Caso 1: ninguna palabra se encuentra en la lista vacia.
en_fila(_,[]):-!,fail.
%Caso 2: encuentra una primer cohicidencia
en_fila([X|R1],[X|R2]):-seguidas(R1,R2),!.
%Caso 3: no encuentra cohincidencia o la encuentra pero no seguida de las demas letras.
en_fila(P,[_|R]):-en_fila(P,R).

%Funcion auxiliar. busca la palabra P en la fila N de la sopa S.
%busqueda_filas(P,S,N):-
%Caso 1: no hay filas en las que buscar.
busqueda_fila(_,[],_):-!,fail.
%Caso 2: la primer fila de S contiene a P.
busqueda_filas(P,[F|_],N1):-en_fila(P,F),write('true. Se encuentra en la fila '),write(N1),write('.\n').
%Caso 3: la primer fila de S no contiene a P
busqueda_filas(P,[_|R],N1):-N2 is N1+1,busqueda_filas(P,R,N2).

%Funcion auxiliar. Funciona igual que la busqueda en fila, porque recibe la sopa con las columnas como filas.
busqueda_columnas(_,[],_):-!,fail.
busqueda_columnas(P,[C|_],N1):-en_fila(P,C),write('true. Se encuentra en la columna '),write(N1),write('.\n').
busqueda_columnas(P,[_|R],N1):-N2 is N1+1,busqueda_columnas(P,R,N2).

%Funcion para escribir una palabra que este en forma de lista.
escribir([]):-!.
escribir([L|R]):-write(L),escribir(R).

%Funcion PRINCIPAL
%Fallo 1:
sopa([],_):-!,write('fail. Debe ingresar una palabra valida'),fail.
%Fallo 2:
sopa(_,[]):-!,write('fail. Debe ingresar una sopa valida'),fail.
%Caso 1:P se encuentra en al menos una fila o una columna de S
sopa(P,S):-busqueda_filas(P,S,1),inversa(S,SI),busqueda_columnas(P,SI,1),write('fail (no hay ninguna otra aparición de '),escribir(P),write(').\n'),!.
%Caso 2:P no se encuentra en S.
sopa(_,_):-write('fail. No se encuentra la palabra en la sopa.').

