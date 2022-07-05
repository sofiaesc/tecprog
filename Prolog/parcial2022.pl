/* La peña de TecProg
Se debe implementar un predicado en PROLOG que resuelva el calculo del dinero que una persona debe pagar o recibir en una peña.

Las personas que compran cosas para la peña pueden pagar con o sin billetera santa fe, en caso de abonar con billetera, a lo que compro se le debe considerar un descuento del 30%, en caso contrario se considera el monto gastado al 100%.

El monto que deberá pagar cada uno sera la suma de todo lo que se compro (con y sin descuento) dividido la cantidad de personas que asisten.

Para el calculo de lo que debe pagar o recibir una persona deben considerar:

La persona que SI pago con billetera deberá pagar o recibir dinero dependiendo de la cantidad que hayan gastado con el descuento.
La persona que NO pago con billetera deberá pagar o recibir dinero dependiendo de la cantidad que hayan gastado.
La persona que no compro nada deberá pagar el total del monto.
El predicado recibirá una lista con las personas que participan en la peña y deberá devolver una lista de listas, donde cada lista tendrá 3 elementos: el nombre de la persona, si debe pagar o recibir dinero, y la cantidad.

Deberá plantear una base de conocimientos con los datos necesario para resolver el problema.

No se pueden utilizar predicados predefinidos. (Ante la duda preguntar!!!)

Ejemplo:
pablo gasto $4500 y pago con billetera.
gabriel gasto $1450 y NO pago con billetera
federico gasto $800 y pago con billetera
franco gasto $800 y NO pago con billetera
peña([juan, agustin, franco, pablo, gabriel, ulises, federico], Resultado).
Resultado = [
[juan, paga, 851.4285714285714],
[agustin, paga, 851.4285714285714],
[franco, paga, 51.428571428571445],
[pablo, recibe, 2298.5714285714284],
[gabriel, recibe, 598.5714285714286],
[ulises, paga, 851.4285714285714],
[federico, paga, 291.42857142857144] ] */

% Base de conocimientos
% Primer término: Nombre de la persona.
% Segundo término: Monto que pagó.
% Tercer término: (0: no pagó con billetera. 1: pagó con billetera).
pago(pablo,4500,1).
pago(gabriel,1450,0).
pago(federico,800,1).
pago(franco,800,0).

% Funcion para contar cantidad de elementos de una lista.
largo([],0):- !.
largo([_|R],Elem):- largo(R,Elem2), Elem is Elem2 + 1.

% Función que calcula descuento con billetera:
descuento(P,1,D):- D is P * 0.7, !.
descuento(P,0,P).

% Función para el total
total([],0):- !.
total([X|R],T):- not(pago(X,_,_)), total(R,T), !.
total([X|R],T):- pago(X,M,B), descuento(M,B,MD), total(R,T2), T is T2 + MD.

% Valor de la peña: valor total / cantidad de elementos lista.
valor_peña(LS,V):- total(LS,T), largo(LS,LA), V is T / LA.

% Funcion auxiliar
peña_aux([],_,[]):- !.
peña_aux([X|R],Valor,[[X,paga,Valor]|R2]):- not(pago(X,_,_)), peña_aux(R,Valor,R2), !.
peña_aux([X|R],Valor,[[X,recibe,Dif]|R2]):- pago(X,M,B), descuento(M,B,MD), Dif is MD - Valor, Dif >= 0, peña_aux(R,Valor,R2), !.
peña_aux([X|R],Valor,[[X,paga,Dif2]|R2]):- pago(X,M,B), descuento(M,B,MD), Dif is MD - Valor, Dif < 0, Dif2 is Dif * -1, peña_aux(R,Valor,R2).

% WRAPPER.
% En caso de recibir una lista vacía, devuelve un mensaje y false.
peña([],[]):- write("Entrada inválida. Debe ir gente a la peña!\n"), !, fail.
peña(Nombres,Resultado):- valor_peña(Nombres,Valor), peña_aux(Nombres,Valor,Resultado).