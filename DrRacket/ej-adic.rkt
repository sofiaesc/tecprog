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

"EJERCICIO FACTURACIÓN:"

(define contar ; cuento la cantidad de veces que aparece un elemento en la lista.
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

(define aplanar ; función auxiliar para concatenar.
  (lambda (ls)
    (if (null? ls)
        ()
        (let ((p (car ls)) (r (cdr ls)))
          (if (list? p)
              (concatenar (aplanar p) (aplanar r))
              (cons p (aplanar r))
    )))))

(define factura-cine-aux
  (lambda (ls)
    (list (contar 1 ls)) (cons 2 (contar 2 ls)) (cons 3 (contar 3 ls)))) 

(define factura-cine
  (lambda (ls)
    (let ((ls2 (aplanar ls)))
      ( (factura-cine-aux ls2)

(suma-total '((0 0 0 1 1 0 2 0 1 0)(0 1 1 3 0 0 1 1 1 1)(1 1 1 3 3 1 1 1 0 2)(1 1 2 2 0 0 1 1 1 0)))
