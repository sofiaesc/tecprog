#| Dada una entrada de datos que sea una lista de listas, en donde el primer elemento es el día de la semana, después una lista con el menú del día y por último una lista con opciones de reemplazo. Las listas del menú diario son listas impropias en donde el 1er elemento es el tipo de comida y el 2do la cantidad de calorías para esa comida, la AUSENCIA de alguna comida se interpreta como una lista de un solo elemento (con el tipo).

( ("Lunes" ((DESAYUNO . 120)(ALMUERZO . 280)(MERIENDA . 110)(CENA . 220)) ((ALMUERZO . 380)) ) --> 730
  ("Martes" ((DESAYUNO . 120)(ALMUERZO)(MERIENDA . 90)(CENA . 250)) ((ALMUERZO . 295)) ) --> 460
  ("Miércoles" ((DESAYUNO . 125)(ALMUERZO . 270)(MERIENDA . 95)(CENA . 290)) ((CENA . 220)) ) --> 780
  ("Jueves" ((DESAYUNO . 130)(ALMUERZO . 270)(MERIENDA . 120)(CENA . 280)) ((MERIENDA . 70)) ) --> 800
  ("Viernes" ((DESAYUNO . 120)(ALMUERZO . 275)(MERIENDA . 115)(CENA . 270)) () ) --> 780
)

Se desea que programen una función utilizando el paradigma funcional que reciba como parámetros de entrada un máximo de calorías diaria y la lista anterior, que procese cada elemento para verificar si es posible alterar el menú fijo del día con alguna opción de reemplazo siempre y cuando la cantidad de calorías diaria no sea superior al máximo de calorías por día.
* El resultado dependerá de la cantidad de calorías máximas por cada semana.
* Solo se podrá reemplazar una sola comida por día.

El resultado debe ser una lista con el siguiente formato cuando el máximo de calorías permitido es 800:
( ("Lunes" ((DESAYUNO . 120)(ALMUERZO . 280)(MERIENDA . 110)(CENA . 220)) ) --> 730 (sin reemplazo)
  ("Martes" ((DESAYUNO . 120)(ALMUERZO . 295)(MERIENDA . 90)(CENA . 250)) ) --> 755 (con reemplazo)
  ("Miércoles" ((DESAYUNO . 125)(ALMUERZO . 270)(MERIENDA . 95)(CENA . 220)) ) --> 710 (con reemplazo)
  ("Jueves" ((DESAYUNO . 130)(ALMUERZO . 270)(MERIENDA . 70)(CENA . 280)) ) --> 750 (con reemplazo)
  ("Viernes" ((DESAYUNO . 120)(ALMUERZO . 275)(MERIENDA . 115)(CENA . 270)) ) --> 780 (sin reemplazo)
)

El resultado debe ser una lista con el siguiente formato cuando el máximo de calorías permitido es 900:
( ("Lunes" ((DESAYUNO . 120)(ALMUERZO . 380)(MERIENDA . 110)(CENA . 220)) ) --> 830 (con reemplazo)
  ("Martes" ((DESAYUNO . 120)(ALMUERZO . 295)(MERIENDA . 90)(CENA . 250)) ) --> 755 (con reemplazo)
  ("Miércoles" ((DESAYUNO . 125)(ALMUERZO . 270)(MERIENDA . 95)(CENA . 220)) ) --> 710 (con reemplazo)
  ("Jueves" ((DESAYUNO . 130)(ALMUERZO . 270)(MERIENDA . 70)(CENA . 280)) ) --> 750 (con reemplazo)
  ("Viernes" ((DESAYUNO . 120)(ALMUERZO . 275)(MERIENDA . 115)(CENA . 270)) ) --> 780 (sin reemplazo)
)

ACLARACIONES: No pueden utilizar funciones predefinidas de racket, con excepción de las que vimos en clases para validar o convertir string, listas, char, vectores, etc. Ante la duda pregunten. |#

(define reemplazar ; función que reemplaza el elemento que coincide su descripción (desayuno, almuerzo).
  (lambda (ls l2)
    (if (null? ls)
        ()
        (let ((p (car ls)) (r (cdr ls)))
          (if (eqv? (car p) (car l2))
              (cons l2 r)
              (cons p (reemplazar r l2))
      )))))

;(reemplazar '((DESAYUNO . 120)(ALMUERZO . 280)(MERIENDA . 110)(CENA . 220)) '(ALMUERZO . 380))

(define suma-calorias ; función que suma las calorías de una lista.
  (lambda (ls)
    (if (null? ls)
        0
        (if (null? (cdar ls))
            (suma-calorias (cdr ls))
            (+ (cdar ls) (suma-calorias (cdr ls)))))))

;(suma-calorias '((DESAYUNO . 120)(ALMUERZO)(MERIENDA . 110)(CENA . 220)))
    
(define reemplazable ; función que determina si puedo reemplazar o no, según la suma de calorías de la lista reemplazada.
  (lambda (ls cal)
    (if (< (suma-calorias (reemplazar (cadr ls) (caaddr ls))) cal)
        #t
        #f)))

;(suma-calorias (reemplazar '((DESAYUNO . 120)(ALMUERZO . 280)(MERIENDA . 110)(CENA . 220)) '(ALMUERZO . 380)))
;(reemplazable '("Lunes" ((DESAYUNO . 120)(ALMUERZO)(MERIENDA . 110)(CENA . 220)) ((ALMUERZO . 680))) 800)

(define menu-dieta ; función principal que llama a las demás.
  (lambda (ls cal)
    (map (lambda (x) (if (null? (caddr x)) ; si el reemplazo es (), devuelve la lista original sin entrar a las funciones.
                          (cons (car x) (list (cadr x)))
                          (if (reemplazable x cal) ; si es reemplazable, entonces construyo la lista nueva.
                              (cons (car x) (list (reemplazar (cadr x) (caaddr x))))
                              (cons (car x) (list (cadr x)))))) ls)))

(define dieta '(("Lunes" ((DESAYUNO . 120)(ALMUERZO . 280)(MERIENDA . 110)(CENA . 220)) ((ALMUERZO . 380)))
  ("Martes" ((DESAYUNO . 120)(ALMUERZO)(MERIENDA . 90)(CENA . 250)) ((ALMUERZO . 295)) )
  ("Miércoles" ((DESAYUNO . 125)(ALMUERZO . 270)(MERIENDA . 95)(CENA . 290)) ((CENA . 220)) )
  ("Jueves" ((DESAYUNO . 130)(ALMUERZO . 270)(MERIENDA . 120)(CENA . 280)) ((MERIENDA . 70)) )
  ("Viernes" ((DESAYUNO . 120)(ALMUERZO . 275)(MERIENDA . 115)(CENA . 270)) () )))

(display "Máximo de calorías: 800 \n")
(menu-dieta dieta 800)
(display "Máximo de calorías: 900 \n")
(menu-dieta dieta 900)