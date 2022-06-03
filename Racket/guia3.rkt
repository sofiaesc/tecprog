; EJERCICIO 1:
(define factorial
  (lambda (n)
    (if (< n 0)
        "numero no válido"
        (if (= n 0)
            1
            (* (factorial (- n 1)) n))
    )))

(factorial 2)
(factorial 4)
(factorial -1)

;-----------------------------------------------------------------------

; EJERCICIO 2:
(define length2
  (lambda (l)
    (if (null? l)
        0
        (+ (length2 (cdr l)) 1))))

(length2 '(a b c))
(length2 '(a b))
(length2 '())

;-----------------------------------------------------------------------

; EJERCICIO 3:
(define count-elem
  (lambda (e l)
    (if (null? l)
        0
        (let ((p (car l)) (q (cdr l)))
          (if (eqv? p e)
              (+ 1 (count-elem e q))
              (count-elem e q))))))

(count-elem 3 '(1 2 3 4 5 4 3 2 1 ))
(count-elem 'a '(a b c d a b a a))

;-----------------------------------------------------------------------

; EJERCICIO 4:
(define subst
  (lambda (a b l)
    (if (null? l)
        ()
        (let ((p (car l)) (q (cdr l)))
          (if (eqv? p a)
              (cons b (subst a b q))
              (cons p (subst a b q))
              )))))

(subst 'c 'k '(c o c o n u t))

;-----------------------------------------------------------------------

; EJERCICIO 5:
(define eliminar
  (lambda (a l)
    (if (null? l)
        ()
        (let ((p (car l)) (q (cdr l)))
            (if (equal? a p)
                (eliminar a q)
                (cons p (eliminar a q)))))))
(eliminar 'A '(A B C D A))

(define agrupar
  (lambda (lista)
    (if (null? lista)
        ()
        (cons (vector->list (make-vector (count-elem (car lista) lista) (car lista)))
              (agrupar (eliminar (car lista) (cdr lista)))))))
(agrupar '(A A B C A B A D C))

;-----------------------------------------------------------------------

; EJERCICIO 6:
(define concatenar
  (lambda (l1 l2)
    (if (null? l1)
        l2           
        (let ((p (car l1)) (q (cdr l1)))
          (if (null? q)    
              (cons p l2)   
              (cons p (concatenar q l2)))))))   
          
(concatenar '(a b) '(d e))

;-----------------------------------------------------------------------

; EJERCICIO 7:
(define primer-num
  (lambda (l)
    (if (null? l)
        "No hay números en la lista."
        (let ((p (car l)) (q (cdr l)))
          (if (number? p)
              p
              (primer-num q))))))

 (primer-num '((1 . 2) 'a (b) (5) 6 8 'a 9))
 (primer-num '((1 . 2) 'a (b) (5) 'a ))

;-----------------------------------------------------------------------

; EJERCICIO 8:
(define attach-at-end
  (lambda (e l)
    (if (null? l)
        (cons e ())
        (let ((p (car l)) (q (cdr l)))
          (cons p (attach-at-end e q))))))

(attach-at-end 'prueba '(esto es una))

;-----------------------------------------------------------------------

; EJERCICIO 9:
(define val-abs
  (lambda (n)
    (if (< n 0)
        (- 0 n)
        n)))

(define conv-datos
  (lambda (lista)
    (if (null? lista)
        "Lista vacia."
        (let ((p (car lista)) (q (cdr lista)))
             (if (null? q)
                (cons (conv-datos-tipo (car p) (cadr p)) ())
                (cons (conv-datos-tipo (car p) (cadr p)) (conv-datos q))
                )))))

(define conv-datos-tipo
  (lambda (elem lista)
    (cond
      ((equal? elem "D") (conv-datos-d lista))
      ((equal? elem "B") (conv-datos-b lista))
      ((equal? elem "T") (conv-datos-t lista))
      )))

(define conv-datos-d
  (lambda (lista)
        (let ((p (car lista)) (r (cdr lista)))
          (if (null? r)
              (cons (val-abs p) ())
              (cons (val-abs p) (conv-datos-d r))
              ))))

(define conv-datos-t
  (lambda (lista)
        (let ((p (car lista)) (r (cdr lista)))
          (if (null? r)
              (cons (string->number p) ())
              (cons (string->number p) (conv-datos-t r))
              ))))

(define conv-datos-b
  (lambda (lista)
        (let ((p (car lista)) (r (cdr lista)))
          (if (equal? "V" p)
              (if (null? r)
                  (cons 1 ())
                  (cons 1 (conv-datos-b r)))
              (if (null? r)
                  (cons 0 ())
                  (cons 0 (conv-datos-b r)))))))

(conv-datos '(("D" (1 2 -3 -4 5)) ("T" ("6" "7" "8")) ("B" ("V" "F"))))

;-----------------------------------------------------------------------

; EJERCICIO 10:
(define distance2d
  (lambda (x y)
    (if (and (list? (cdr x)) (list? (cdr y)))
        "No se están comparando listas impropias."
        (let ((x1 (car x)) (x2 (car y)) (y1 (cdr x)) (y2 (cdr y)))
          (sqrt (+ (* (- x1 x2) (- x1 x2)) (* (- y1 y2) (- y1 y2)))))
        )))
    
(define distancias
  (lambda (l)
    (if (null? l)
        ()
        (let ((p (car l)) (r (cdr l)))
          (if (null? r)
              ()
              (let ((q (car r)))
                (cons (distance2d p q) (distancias r))))))))

(distancias '((1 . 1) (1 . 2) (2 . 2) (2 . 1) (1 . 1)))
(distancias '((1 . 5) (1 . 2) (2 . 3) (2 . 0) (4 . 4)))