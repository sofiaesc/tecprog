"EJERCICIO 1:"
(define inv-aux
  (lambda (l acc)
    (if (list? l)   
        (if (null? l)
            acc
            (inv-aux (cdr l) (cons (car l) acc))))
    l))

(define inv
  (lambda (l)
    (inv-aux l '())))

(define concat-inv
  (lambda (l1 l2)
    (if (null? l1)
        (inv l2)
        (let ((p (car l1)) (r (cdr l1)))
          (cons p (concat-inv r l2))))))

(concat-inv '(1 2 3) '(4 5 6))

"EJERCICIO 2:"
(define pertenece-aux
  (lambda (e l)
    (if (null? l)
        #f
        (let ((p (car l)) (r (cdr l)))
          (if (eqv? e p)
              #t
              (pertenece-aux e r))))))

(define pertenece
  (lambda (e l1 l2)
    (let ((p1 (pertenece-aux e l1)) (p2 (pertenece-aux e l2)))
      (if (or (eqv? #f p1) (eqv? #f p2))
          #f
          #t))))

(pertenece 'a '(a b c) '(r f g a))
(pertenece 'a '(a b c) '(r f g h))
(pertenece 'a '(h b c) '(r f g h))

"EJERCICIO 3:"
(define cant-izq
  (lambda (e l)
    (if (null? l)
        0
        (let ((p (car l)) (r (cdr l)))
          (if (eqv? e p)
              0
              (+ 1 (cant-izq e r)))))))

(cant-izq 'd '(a b c d e f))

"EJERCICIO 4:"
(define attach-at-end
  (lambda (e l)
    (if (null? l)
        (cons e ())
        (let ((p (car l)) (q (cdr l)))
          (cons p (attach-at-end e q))))))

(define addif
  (lambda (e l)
    (let ((p (car l)) (r (cdr l)) (b (pertenece-aux e l)))
      (if (eqv? #f b)
          (attach-at-end e l)
          l))))

(addif 'a '(b c d))
(addif 'a '(a b c d))
(addif 'c '(b c d))

"EJERCICIO 5:"
(define fechap
  (lambda (d m a)
    (if (or (or (> m 12) (< m 1)) (or (> d 31) (< d 1))) ; condiciones generales
         #f
         (if (or (and (eqv? m 2) (> d 28))
                 (and (> d 30) (or (eqv? m 4) (eqv? m 6) (eqv? m 9) (eqv? m 11)))) ; condiciones especiales
             #f
             #t 
      ))))

(fechap 12 12 1986)
(fechap 12 30 1987)
(fechap 31 2 1986)
(fechap 31 11 1876)

"EJERCICIO 6:"
(define get-profundidad
  (lambda (ls)
    ()))

(get-profundidad '((1 (2)) (((5 7))) 4))

"EJERCICIO 7:"
(define concatenar ; para concatenar listas
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (concatenar (cdr l1) l2)))))

(define aplanar
  (lambda (l)
    (if (null? l)
        ()
        (let ((p (car l)) (r (cdr l)))
          (if (list? p)
              (concatenar (aplanar p) (aplanar r))
              (cons p (aplanar r))
    )))))

(aplanar '((1 2 3) (9 (2 3 4)) ((((3 4 (7)))))))

"EJERCICIO 8:"
(define length_2 ; hago  mi propia función length
  (lambda (l)
    (if (null? l)
        0
        (+ 1 (length_2 (cdr l))))))

(define last-elem ; función para obtener ultimo elem
  (lambda (l)
    (let ((p (car l)) (r (cdr l)))
      (if (null? r)
          p
          (last-elem r))
    )))
  
(define first-elems ; función para obtener primeros elementos
  (lambda (l)
    (let ((p (car l)) (r (cdr l)))
      (if (eqv? 1 (length_2 r))
          (cons p '())
          (cons p (first-elems r))
    ))))

(define rotar_d ; función para der.
  (lambda (l)
    (cons (last-elem l) (first-elems l))))
  
(define rotar_i ; función para izq.
  (lambda (l)
    (let ((p (car l)) (r (cdr l)))
      (attach-at-end p r))))

(define rotar ; wrapper que selecciona función auxiliar.
  (lambda (s l)
    (cond
      ((eqv? s 'izquierda) (rotar_i l))
      ((eqv? s 'derecha) (rotar_d l)))))

(rotar 'derecha '(1 2 3 4))
(rotar 'izquierda '(1 2 3 4))

"EJERCICIO 9:"
(define cuadrado
  (lambda (x)
    (* x x)))

(define calcula-cuadrados
  (lambda (l)
    (map (lambda (x) (cuadrado x)) l)))

(calcula-cuadrados '(1 2 3 4))

"EJERCICIO 10:"
(define resta-listas
  (lambda (l1 l2)
    (if (null? l1)
        ()
        (let ((p (car l1)) (r (cdr l1)) )
          (if (pertenece-aux p l2)
              (resta-listas r l2)
              (cons p (resta-listas r l2)))))))

(resta-listas '(1 2 3 4) '(2 3))

"EJERCICIO 11:"
(define suma-listas
  (lambda (l1 l2)
    (if (null? l2)
        l1
        (let ((p (car l2)) (r (cdr l2)))
          (if (pertenece-aux p l1)
              (suma-listas l1 r)
              (suma-listas (attach-at-end p l1) r))))))

(suma-listas '(1 2 3 4) '(2 3 5))

"EJERCICIO 12:"
(define altura
  (lambda (l)
    ()))