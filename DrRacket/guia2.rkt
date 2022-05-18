; EJERCICIO 1:
;a
(define a 2)
(define b 1)

(let ((x (/ (* 7 a) b)) (y (/ (* 3 a) b)))
  (+ x y x))

;b
(let ((x '(a b c))) (cons (car x) (cdr x)))

; EJERCICIO 2:
(let ((x 9))
  (* x
     (let ((x (/ x 3))) (+ x x))))
; Defino x = 9 en el let de afuera, que va a multiplicar x por el resultado
; del let de adentro. En el let de adentro, redefino x como
; x = x / 3 = 9 / 3 = 3, y hago una suma de x + x = 3 + 3 = 6.
; Con este resultado, hago la multiplicación del x definido afuera (x = 9)
; y obtengo así 9 * 6 = 54.

; EJERCICIO 3:
; A ORIGINAL:
(let ((x 'a) (y 'b))
  (list (let ((x 'c)) (cons x y))
        (let ((y 'd)) (cons x y))))
; A REESCRITO:
(let ((x 'a) (y 'b) (z 'c) (w 'd))
  (list  (cons z y) (cons x w)))

; B ORIGINAL:
(let ((x '((a b) c)))
  (cons
   (let ((x (cdr x)))
     (car x))
   (let ((x (car x)))
       (cons (let ((x (cdr x)))
               (car x))
             (cons (let ((x (car x)))
                     x)
                   (cdr x))))))
; B REESCRITO:
(let ((x '((a b) c)))
  (cons
   (let ((q (cdr x)))
     (car q))
   (let ((w (car x)))
     (cons
      (let ((e (cdr w)))
        (car e))
      (cons
       (let ((r (car w)))
         r)
       (cdr w))))))

; EJERCICIO 4:
; a
(let ((f (lambda (x) x)))
(f 'a)) ; = a.

; b
(let ((f (lambda x x)))
(f 'a)) ; = (a).

; c
(let ((f (lambda (x . y) x)))
(f 'a)) ; = a. 

(let ((f (lambda (x . y) y)))
(f 'a)) ; = (). 

; EJERCICIO 5:
(define ej5 (lambda (ecuacion)
              (let ((p1 (car ecuacion))
                    (op (car (cdr ecuacion)))
                    (p2 (cdr (cdr ecuacion))))
                (cons op (cons p1 p2)))))
(ej5 '(12 + 6))

; EJERCICIO 6:
(define shorter
  (lambda (a b)
    (if (and (list? a) (list? b))
        (if (> (length a) (length b))
            b ; si tengo un solo valor, no pongo paréntesis.
            a ; sólo si tengo que devolver un procedimiento.
        )
        ("No se están comparando listas."))))
            
(shorter '(a b) '(c d e))
(shorter '(a b) '(c d))
(shorter '(a b) '(c))

; EJERCICIO 7:
(define area
  (lambda (radio)
    (* 3.14 (* radio radio))))

(area 3)

; EJERCICIO 8:
(define perimetro
  (lambda (radio)
    (* 2 3.14 radio)))

(perimetro 1)

; EJERCICIO 9:
(define circlestuff
  (lambda (radio)
    (cons (area radio) (cons (perimetro radio) '()))))

(circlestuff 3)

; EJERCICIO 10:

(define distance2d
  (lambda (x y)
    ; chequeo que sea una lista impropia:
    ; si el cdr de la lista es "", es propia. si no es una lista, es impropia.
    (if (and (list? (cdr x)) (list? (cdr y)))
        "No se están comparando listas impropias."
        (let ((x1 (car x)) (x2 (car y)) (y1 (cdr x)) (y2 (cdr y)))
          (sqrt (+ (* (- x1 x2) (- x1 x2)) (* (- y1 y2) (- y1 y2)))))
        )))

(distance2d '(1 . 1) '(2 . 2))
(distance2d '(1 1) '(2 2))

; EJERCICIO 11:
(define proximo (lambda (x l)
                  (if (null? l)
                      (display "Lista vacia")
                      (let ((d1 (distance2d x (car l))) (r (cdr l)))
                        (if (null? r)
                            d1
                            (let ((d2 (proximo x r))) ; recursividad al llamar a la misma función.
                              (if (< d1 d2)
                                  d1
                                  d2
                                  )))))))

(proximo '(0 . 0) '((1 . 0) (1 . 2) (2 . 2)))
(proximo '(0 . 0) '((1 . 1) (2 . 1) (1 . 0)))
(proximo '(0 . 0) '((1 . 1) (1 . 3) (2 . 1)))
