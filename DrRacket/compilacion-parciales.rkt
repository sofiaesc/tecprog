"EJERCICIO TARIFAS VIAJES:"
(define tarifa '( ("Santa Fe" 5 ((10 . 0)(12 . 0)(16 . 0)))
                  ("Recreo" 2 ((10 . 20)(12 . 20)(16 . 20)))
                  ("Candiotti" 1 ((10 . 30)(12 . 30)(16 . 30)))
                  ("Iriondo" 2 ((10 . 35)(12 . 35)(16 . 35)))
                  ("Manucho" 2 ((10 . 45)(12 . 45)(16 . 45)))
                  ("Cululu" 12 ((11 . 0)(13 . 0)(17 . 0)))))

(define calcular-tarifa ; calculo la tarifa de un lugar a otro.
  (lambda (ls des)
    (if (eqv? (caar ls) des)
        0
        (+ (cadar ls) (calcular-tarifa (cdr ls) des)))))

;(calcular-tarifa tarifa "Iriondo")

(define buscar-camino ; busco el camino desde origen en adelante.
  (lambda (ls ori) 
    (if (eqv? (caar ls) ori)
        ls
        (buscar-camino (cdr ls) ori))))

;(buscar-camino tarifa "Recreo")

(define horarios-despues ; función que calcula los horarios iguales o después del horario dado.
  (lambda (ls h)
    (if (null? ls)
        (display "\n")
        (let ((h1 (car h)) (m1 (cadr h)) (h2 (caar ls)) (m2 (cdar ls)) (r (cdr ls)))
          (if (< h2 h1)
              (horarios-despues r h)
              (if (> h2 h1)
                  (and (display (caar ls)) (display ":") (display (cdar ls)) (display " ") (horarios-despues r h))
                  (if (and (eqv? h2 h1) (< m2 m1))
                      (horarios-despues r h)
                      (and (display (caar ls)) (display ":") (display (cdar ls)) (display " ") (horarios-despues r h)))))))))

;(horarios-despues (caddar (buscar-camino tarifa "Recreo")) '(9 10))
        
(define viaje
  (lambda (ori des hor)
      (let ((camino (buscar-camino tarifa ori)))
        (and (display ori) (display " - ") (display des) (display ": $")
           (display (calcular-tarifa camino des))
           (display " - ") (horarios-despues (caddar camino) hor)))))
    ; llamo a horarios-despues con el tercer elemento del camino (lista de horarios).
     
(viaje "Recreo" "Manucho" '(12 30))
(viaje "Santa Fe" "Cululu" '(9 0))
(viaje "Santa Fe" "Iriondo" '(11 0))

"EJERCICIO FACTURAS CINE:"

(define contar ; cuenta la cantidad de un elemento dado en la lista de listas ((0 0 0 1 1 0 2 0 1 0)(0 1 1...
  (lambda (ls e)
    (if (null? ls)
        0
        (let ((p (car ls)) (r (cdr ls)))
          (if (list? p)
            (+ (contar p e) (contar r e))
            (if (eqv? p e)
                (+ 1 (contar r e))
                (contar r e)))))))

;(contar '((0 0 0 1 1 0 2 0 1 0)(0 1 1 3 0 0 1 1 1 1)(1 1 1 3 3 1 1 1 0 2)(1 1 2 2 0 0 1 1 1 0)) 1)

(define factura-cine-aux ; genera la lista de listas ((1 . 6000)(2 . 600)(3 . 300)).
  (lambda (ls)
    (list (cons 1 (* 300 (contar ls 1))) (cons 2 (* 150 (contar ls 2))) (cons 3 (* 100 (contar ls 3))))))
; cuento con la función contar y luego multiplico por el valor de cada una.

;(facturas-cine-aux '((0 0 0 1 1 0 2 0 1 0)(0 1 1 3 0 0 1 1 1 1)(1 1 1 3 3 1 1 1 0 2)(1 1 2 2 0 0 1 1 1 0)))
  
(define suma-total ; sumo los cdr de la lista de listas ((1 . 6000)(2 . 600)(3 . 300)) p/ suma total.
  (lambda (ls)
    (if (null? ls)
        0
        (+ (cdar ls) (suma-total (cdr ls))))))

;(suma-total '((1 . 6000)(2 . 600)(3 . 300)))

(define concatenar ; para concatenar listas
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (concatenar (cdr l1) l2)))))

(define factura-cine ; wrapper que arma la función.
  (lambda (ls)
    (let ((ls2 (factura-cine-aux ls)))
      (concatenar ls2 (list (cons "total" (suma-total ls2)))))))

(factura-cine '((0 0 0 1 1 0 2 0 1 0)(0 1 1 3 0 0 1 1 1 1)(1 1 1 3 3 1 1 1 0 2)(1 1 2 2 0 0 1 1 1 0)))

"EJERCICIO ZIPLIST:"
; Cree una función zipList que reciba como parámetro una lista propia
; y devuelva como resultado una lista con los elementos ordenados de
; a pares impropios indicando en el primer elemento del par el objeto
; y en el segundo la cantidad de elementos iguales que se encuentran
; en forma consecutiva. 

(define zipList_aux
  (lambda (ls e)
    (if (null? ls)
        0
        (let ((p (car ls)) (r (cdr ls)))
          (if (eqv? p e)
              (+ 1 (zipList_aux r e))
              0)))))

(define eliminar
  (lambda (ls n)
    (if (eqv? n 0)
        ls
        (let ((p (car ls)) (r (cdr ls)))
          (eliminar r (- n 1))))))

(define zipList
  (lambda (ls)
    (if (null? ls)
        ()
        (let ((p (car ls)) (r (cdr ls)))
          (let ((n (zipList_aux ls p)))
          (cons (cons p n) (zipList (eliminar ls n))
          ))))))

(zipList '(a a a b a b b c c))

"EJERCICIO CON DISTANCIAS:"
; Dada una lista de fuentes de alimentos distribuídos en la plaza, se
; desea obtener cual de ellos es el que ofrece menor relación alimento/riegos. 
; Para estimar la riesgo se debe tener en cuenta la distancia al alimento. El
; riesgo se calculará con la siguiente fórmula:

; Riesgo:
; dist < 1m --> 0.1 * dist.	
; 1m <= dist < 3m --> 0.3 * dist.	
; 3m <= dist --> 0.5 * dist

;Los alimentos se encuentran en una lista de vectores donde sus componentes son
;(X Y A) y que es como la siguiente:

;(list #(1 1 500)
;#(2 4 1500)
;#(5 7 7500)
;...
;)

;El hormiguero se encuentra en (0 0).

(define cuadrado ; función auxiliar para usar en el cálculo de la distancia.
  (lambda (x)
    (* x x)))

(define distancia ; distancia del punto al origen.
  (lambda (x y)
    (sqrt (+ (cuadrado x) (cuadrado y)))))

(define riesgo ; calculo el riesgo.
  (lambda (p)
    (let ((x (vector-ref p 0)) (y (vector-ref p 1)))
      (let ((dist (distancia x y)))
        (cond
          ((< dist 1) (* 0.1 dist))
          ((and (> dist 1) (< dist 3)) (* 0.3 dist))
          ((> dist 3) (* 0.5 dist)))))))

(define relacion ; divido alimento por riesgo.
  (lambda (p)
    (/ (vector-ref p 2) (riesgo p))))

(define menor_rel  ; encuentro el elemento de menor relación alimento/riesgo.
  (lambda (ls)
    (if (null? ls)
        ()
        (let ((p (car ls)) (q (cdr ls)))
          (if (null? q)
              p
              (if (< (relacion p) (relacion (car q)))
                  (menor_rel (cons (car ls) (cddr ls)))
                  (menor_rel(cdr ls))))))))

(menor_rel (list #(2 4 1500)  #(1 1 500) #(5 7 7500)))

"EJERCICIO MULTIPLICACION RUSA:"
; Escribir los números (A y B) que se desea multiplicar en la parte superior de sendas columnas.
; Dividir A entre 2, sucesivamente, ignorando el resto, hasta llegar a la unidad. Escribir los resultados en la columna A.
; Multiplicar B por 2 tantas veces como veces se ha dividido A entre 2. Escribir los resultados sucesivos en la columna B.
; Sumar todos los números de la columna B que estén al lado de un número impar de la columna A. Éste es el resultado.
; Ejemplo: 27 × 82

;A	B	Sumandos
;27	82	82
;13	164	164
;6	328	
;3	656	656
;1	1312	1312

;Result: 2214

(define div-mult ; armo listas impropias con cada (a . b)
  (lambda (a b)
    (if (eqv? a 1)
        (cons (cons a b) ()) ; último término
        (let ((a2 (truncate (/ a 2))) (b2 (* b 2)))
          (cons (cons a b) (div-mult a2 b2))))))

(define mult-rusa-aux ; sumo las b cuyas a son impares.
  (lambda (ls)
    (if (null? ls)
        0
        (let ((p (car ls)) (r (cdr ls)))
          (if (odd? (car p))
              (+ (cdr p) (mult-rusa-aux r))
              (mult-rusa-aux r))))))

(define mult-rusa ; desde el wrapper llamo a la auxiliar con la lista de puntos (a . b)
  (lambda (a b)
    (mult-rusa-aux (div-mult a b))))

(mult-rusa 27 82)

"EJERCICIO COPA AMÉRICA:"
#|
COPA AMERICA
Dados los resultados de los partidos, se desea identificar la cantidad de partidos que jugó cada
equipo de fútbol.
Entrada:
( ( (Argentina . 5) (Brasil . 0 ) )
( (Argentina . 3) (Bolivia . 2) )
( (Argentina . 2) (Chile . 1) )
( (Bolivia . 1) (Paraguay . 0) )
( (Brasil . 1) (Venezuela . 0) )
( (Colombia . 0) (Ecuador . 2) )
( (Brasil . 2) (Ecuador . 1) )
)
Salida:
((Argentina . 3) (Brasil . 3) (Bolivia . 2) (Chile . 1) (Paraguay . 1) (Venezuela . 1) (Colombia . 1)
(Ecuador . 2))
|#

(define eliminar ; elimino el elemento dado de una lista.
  (lambda (e ls)
    (if (null? ls)
        ()
        (let ((p (car ls)) (r (cdr ls)))
          (if (eqv? p e)
              (eliminar e r)
              (cons p (eliminar e r)))))))

(define contar ; cuento la cantidad de veces que aparece un país en la lista.
  (lambda (e ls)
    (if (null? ls)
        0
        (let ((p (car ls)) (r (cdr ls)))
          (if (eqv? p e)
              (+ 1 (contar e r))
              (contar e r))))))

(define concatenar ; función auxiliar para aplanar.
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (concatenar (cdr l1) l2)))))

(define aplanar ; genero una lista cuyos elementos sean los países cada vez que juegan.
  (lambda (ls)
    (if (null? ls)
        ()
        (let ((p (car (car (car ls)))) (q (car (car (cdr (car ls))))) (r (cdr ls)))
          (concatenar (cons p (cons q '())) (aplanar r))))))

(define copa-america-aux ; función que construye la lista de listas impropias.
  (lambda (ls)
    (if (null? ls)
        ()
        (let ((p (car ls)))
            (cons (cons p (contar p ls)) (copa-america-aux (eliminar p ls)))))))

(define copa-america ; función principal, le pasa la lista aplanada a la función que construye la lista de listas impropias.
  (lambda (ls)
    (if (null? ls)
        "Lista vacía."
        (copa-america-aux (aplanar ls)))))

(copa-america '(((Argentina . 5) (Brasil . 0 ))
((Argentina . 3) (Bolivia . 2))
((Argentina . 2) (Chile . 1))
((Bolivia . 1) (Paraguay . 0))
((Brasil . 1) (Venezuela . 0))
((Colombia . 0) (Ecuador . 2))
((Brasil . 2) (Ecuador . 1))
))