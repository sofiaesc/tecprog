% HIJOS Y NIETOS.
hijo(tomás, juan).
hijo(ana, tomás).
hijo(juan, marcos).
hijo(alicia, juan).

% nieto(X,Y):- hijo(X,Z), hijo(Z,Y).
% si pongo nieto(X, marcos) en la consulta me devuelve x = tomás.
% pongo ; después del resultado, aprieto enter, y me muestra x = alicia.
% me da todos los nietos de marcos. 
% si pongo nieto(marcos, X) me devuelve false.

% EDADES.
edad(juan, 27).
edad(luis, 30).

% edad(juan, X), edad(luis, Y), X > Y. ----> false.
% edad(juan, X), edad(luis, Y), X >= Y. ---> false.
% edad(juan, X), edad(luis, Y), X < Y.  -----> X=27, Y=30.  
% X < Y ---> Error: variables ligadas.

% EJERCICIO 1:
f(a, 2).
f(a, 3).
f(b, 2).
f(b, 4).
f(c, 1).
f(c, 2).

% a. f(X, 1). ---------------> X = c.
% b. f(X). -------------------> Error.
% c. f(a, X). ----------------> X = 2 ; X = 3.
% d. f(c, 1). ----------------> true ; false.
% e. f(X, Y). ----------------> X=a, Y=2 ; X=a, Y=3 ; X=b, Y=2 ; X=b, Y=4 ; X=c, Y=1 ; X=c, Y=2.
% f. f(2, a). -----------------> false.
% g. f(X, Y), f(X, 4). -----> X=b, Y=2 ; X=b, Y=4 ; false.

% EJERCICIO 2:
padre(leoncio, alberto).
padre(leoncio, geronimo).
padre(alberto, juan).
padre(alberto, luis).
padre(geronimo, luisa).

hermano(X,Y):- padre(Z,X), padre(Z,Y), X \= Y.
nieto(X,Y):- padre(Z,X), padre(Y, Z).

% a. padre(alberto, luis). --> true.
% b. padre(luis, alberto). --> false.
% c. hermano(luis, Y) ó hermano(X, luis) ------> X = juan ; false.
% d. nieto(X, luisa). ----------> false.
% e. nieto(X, Y). ---------------> X = juan, Y = leoncio ; X = luis, Y = leoncio ; X = luisa, Y = leoncio.

% EJERCICIO 3:
menu('Bombones de jamón', 'Locro', 'Dulce de batata').
menu('Bombones de jamón', 'Locro', 'Alfajor norteño').
menu('Tarta de atún', 'Atados de repollo', 'Dulce de batata').
menu('Tarta de atún', 'Pollo romano con hierbas y vino', 'Flan').
menu('Volovanes de atún', 'Matambre con espinacas y parmesano', 'Torta moka').
menu('Buñuelos de bacalao', 'Pollo romano con hierbas y vino', 'Alfajor norteño').

% a. menu(X,Y,Z).  ----> muestra todos los menúes. 
% b. menu(X,Y,'Dulce de batata'). ---> X = 'Bombones de jamón', Y = 'Locro' ; X = 'Tarta de atún', Y = 'Atados de repollo'.
% c. menu(X,'Locro',Z). ----> X = 'Bombones de jamón', Z = 'Dulce de batata' ; X = 'Bombones de jamón', Z = 'Alfajor norteño'
% d. menu(X,'Pato a la naranja',Z). ----> false.
% e. menu('Locro', Y, Z). ---> false.

% EJERCICIO 4:
% Se ejecuta menu(X,'Locro',Z). Empieza a buscar entre los menus definidos antes, sabiendo que hay dos condiciones verdaderas tras evaluar todas.
% Entra en menu('Bombones de jamón', 'Locro', 'Dulce de batata'). Encuentra una solución, ya que tiene 'Locro' en su segundo argumento y devuelve.
% Sigue buscando soluciones posibles, por lo que entra en menu('Bombones de jamón', 'Locro', 'Alfajor norteño') y devuelve esa otra solución.
% Como ya no tiene condiciones de true, deja de buscar.

% EJERCICIO 5:
ruta(santafe, parana).
ruta(parana, corrientes).
ruta(santafe, cordoba).
ruta(santafe, coronda).
ruta(santafe, rosario).
ruta(rosario, capital).
ruta(rosario, mardelplata).
ruta(capital, cordoba).

% a. ruta(X, cordoba) --> X=santafe ; X=capital.
% b. ruta(parana, Y) ----> Y=corrientes.
% c. ruta(parana, cordoba) ----> false. // ruta(cordoba, parana) ---> false.
combinacion(X, Y):- ruta(X, Z), ruta(Z, Y).
% d. combinacion(santafe, corrientes). ---> true. (sería santafe,parana y parana,corrientes).

% EJERCICIO 6:
estrella(sol).
orbita(sol,mercurio).
orbita(sol,venus).
orbita(sol,tierra).
orbita(sol,marte).
orbita(sol,jupiter).
orbita(sol,saturno).
orbita(sol,urano).
orbita(sol,neptuno).
orbita(sol,pluton).

orbita(tierra,luna).

orbita(marte,deimos).
orbita(marte,phobos).

orbita(pluton,charon).
orbita(pluton,nix).
orbita(pluton,hydra).

orbita(jupiter,adrastea).
orbita(jupiter,aitne).
orbita(jupiter,amalthea).

orbita(saturno,aegir).
orbita(saturno,albiorix).
orbita(saturno,atlas).

orbita(urano,ariel).
orbita(urano,belinda).
orbita(urano,bianca).

orbita(neptuno,despina).
orbita(neptuno,galatea).
orbita(neptuno,halimede).

% Inciso a:
planeta(P):- orbita(sol,P).
luna(L):- orbita(P,L), planeta(P).
lunaDe(P,L):- orbita(P,L), planeta(P).

% Inciso b:
% cantLunas(P,Cant):-  % Condicion de corte.
% cantLunas(P,Cant):-  % Recursion.

% EJERCICIO 7:
entrada('ensalada').
entrada('empanada').
entrada('tarta').
principal('lomo a la pimienta').
principal('locro').
principal('ñoquis').
postre('flan').
postre('pirineos').
postre('cheesecake').

carta(Entrada,Principal,Postre):- entrada(Entrada), principal(Principal), postre(Postre).
% devuelve 27 resultados, combinando todas las posibilidades.
% carta(Entrada,Principal,Postre):- entrada(Entrada), principal(Principal), "Locro") 

% EJERCICIO 8:
hombre(sebastian).
hombre(diego).
hombre(alejandro).
hombre(nicolas).
hombre(fernando).
hombre(adrian).
mujer(sofia).
mujer(laura).
mujer(natalia).
mujer(rocio).
mujer(yanina).
mujer(graciela).
mujer(teresa).
mujer(lara).
mujer(milagros).

progenitor(graciela,laura).
progenitor(graciela,natalia).
progenitor(graciela,yanina).
progenitor(fernando,laura).
progenitor(fernando,natalia).
progenitor(fernando,yanina).
progenitor(teresa,sebastian).
progenitor(teresa,diego).
progenitor(teresa,alejandro).
progenitor(teresa,rocio).
progenitor(adrian,sebastian).
progenitor(adrian,diego).
progenitor(adrian,alejandro).
progenitor(adrian,rocio).
progenitor(laura,sofia).
progenitor(laura,nicolas).
progenitor(alejandro,sofia).
progenitor(alejandro,nicolas).
progenitor(nicolas,lara).
progenitor(nicolas,milagros).

padre(X, Y):- progenitor(X,Y), hombre(X).
madre(X, Y):- progenitor(X,Y), mujer(X).
abuelo(X, Y):- padre(X,Z), progenitor(Z,Y).
abuela(X, Y):- madre(X,Z), progenitor(Z,Y).
hermanos(X, Y):- padre(Z,X), padre(Z,Y), madre(C,X), madre(C,Y), X \= Y.
hermano(X,Y):- hermanos(X,Y), hombre(X).
hermana(X,Y):- hermanos(X,Y), mujer(X).
sucesor(X,Y):- progenitor(Y,X). % condicion de corte
sucesor(X,Y):- progenitor(Y,Z), sucesor(X,Z). % recursion

es_madre(X):- madre(X,_). 
es_padre(X):- padre(X,_). 
tia(X,Y):- hermana(X,Z), progenitor(Z,Y).
yerno(X,Y):- hombre(X), progenitor(X,Z), progenitor(C,Z), X \= C, progenitor(Y,C).
nuera(X,Y):- mujer(X), progenitor(X,Z), progenitor(C,Z), X \= C, progenitor(Y,C).

%EJERCICIO 9:
medico(tania).
abogado(haydee).
abogado(pedro).
ingeniero(haydee).
contador(livio).

mujer(tania).
mujer(haydee).
hombre(livio).
hombre(pedro).

novela(rayuela).
novela(karamazov).
novela(leones).
cuentos(octaedro).
poemas(inventario).

largo(rayuela).
largo(karamazov).
largo(inventario).
corto(octaedro).
corto(leones).

gusta(livio,rayuela).
gusta(pedro,X):- cuentos(X).
gusta(X,Y):- abogado(X), novela(Y), largo(Y).
gusta(X,Y):- ingeniero(X), novela(Y).
gusta(X,Y):- medico(X), novela(Y).
gusta(X,Y):- mujer(X), largo(Y).
gusta(X,Y):- contador(X), hombre(X), cuentos(Y).
gusta(X,Y):- contador(X), hombre(X), poemas(Y).
         
librovalioso(X):- gusta(Y,X), gusta(Z,X), Y \= Z.

% a. gusta(livio, X).
% b. gusta(X, leones).
% c. corto(X).
% Adicional: librovalioso(X). % esto no da bien, repite muchas veces la respuesta.