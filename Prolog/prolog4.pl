% EJERCICIO 1:

reina(2,3).
alfil(6,3).
torre(8,5).

diferencia(F,C,X):- F >= C, X is F - C, !.
diferencia(F,C,X):- F < C, X is C - F.

amenaza(F,C,torre(F2,C2)):- torre(F2,C2), F =:= F2; torre(F2,C2), C =:= C2.
amenaza(F,C,alfil(F2,C2)):- alfil(F2,C2), diferencia(F,F2,D1), diferencia(C,C2,D2), D1 =:= D2.
amenaza(F,C,reina(F2,C2)):- reina(F2,C2), diferencia(F,F2,D1), diferencia(C,C2,D2), D1 =:= D2; reina(F2,C2), F =:= F2; reina(F2,C2), C =:= C2.

% EJERCICIO 2:

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

% EJERCICIO 3:
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

% EJERCICIO 4:
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