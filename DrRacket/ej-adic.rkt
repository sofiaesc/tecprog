  ; COSAS QUE RESTAN PUNTOS:
  ; fuerza bruta. si me queda como lista de lista de listas, llamo a aplanar. arreglo listas impropias
  ; y hago cosas que andan sólo para ese caso.
  ; ordenar mal las cosas y no comentar bien lo que hago.
  ; meter variables cuando no las necesito, porque puedo hacer recursividad. (inventarse un for).
  ; no hace falta hacerlo TAN genérico. depende el problema.
  ; mientras más genérico mejor, pero tampoco complicarsela. pasarle el elemento en vez de codificarlo
  ; ya para ese elemento.

"EJERCICIO ARBOL:"
(define profundidad
  (lambda (ls)
    (if (null? ls)
        0
        (if (null? (cdr ls))
            1
            (let ((izq (profundidad (cadr ls)))
              (der (profundidad (caddr ls))))
              (if (> izq der)
                  (+ 1 izq)
                  (+ 1 der)
            ))))))

(profundidad '())
(profundidad '(4))
(profundidad '(4 (5) (6)))
(profundidad '(4 (5 (8) (7)) (6)))
(profundidad '(4 (5 (8) (7)) (6 (3) (10))))

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

(contar '((0 0 0 1 1 0 2 0 1 0)(0 1 1 3 0 0 1 1 1 1)(1 1 1 3 3 1 1 1 0 2)(1 1 2 2 0 0 1 1 1 0)) 1)

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