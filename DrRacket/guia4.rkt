"EJERCICIO 1:"
(define-struct punto (x y))

(define dist
  (lambda (p1 p2)
    (let ((x1 (punto-x p1)) (x2 (punto-x p2)) (y1 (punto-y p1)) (y2 (punto-y p2)))
         (sqrt (+ (* (- x2 x1) (- x2 x1)) (* (- y2 y1) (- y2 y1)))))))

(define e1 (make-punto 1 1))
(define e2 (make-punto 2 3))
(define e3 (make-punto 2 0))
(dist e1 e2)

"EJERCICIO 2:"
(define-struct point3d (x y z))
(define a1 (make-point3d 1 1 1))
(define a2 (make-point3d 2 2 2))
(define a3 (make-point3d 3 3 3))
(define a4 (make-point3d 4 4 4))

(define sum_point
  (lambda (lista)
    (if (null? lista)
        '(0 0 0)
        (let ((p (car lista)) (r (cdr lista)))
             (map + (list (point3d-x p) (point3d-y p) (point3d-z p)) (sum_point r))))))

(define div_l
  (lambda (lista largo)
    (map (lambda (x) (/ x largo)) lista)))

(define gravc
  (lambda (lista)
    (if (null? lista)
        (display "Lista vacía")
        (let ((suma (sum_point lista)) (largo (length lista)))
              (div_l suma largo)))))

(gravc (list a1 a2 a3 a4))

"EJERCICIO 3:"

(define dist_list ; creo lista de distancias
  (lambda (p1 ls)
    (map (lambda (x) (dist p1 x)) ls)))

(define max_list ; obtengo mayor de la lista
  (lambda (ls)
    (if (null? ls)
        0
        (let ((p (car ls)) (q (max_list (cdr ls))))
          (if (< p q)
              q
              p)))))

(define concatenar ; para concatenar listas
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (concatenar (cdr l1) l2)))))

(define concatenar_max ; concateno las listas de distancias
  (lambda (lista)
      (let ((p (car lista)) (q (cdr lista)))
        (if (null? q)
          ()
          (concatenar (dist_list p q) (concatenar_max q))))
            ))

(define dist_max ; wrapper
  (lambda (lista)
    (if (null? lista)
        "Lista vacía."
        (max_list (concatenar_max lista))
            )))
          
(dist_max (list e1 e2 e3))

"EJERCICIO 4:"
(define char_count_aux
  (lambda (i n)
    (define ch (read-char i))
      (if (eof-object? ch)
          n
          (char_count_aux i (+ n 1)))))

(define char_count ; wrapper
  (lambda (i)
    (char_count_aux i 0)))

(define word_count_aux
  (lambda (i n)
    (define w (read i))
    (if (eof-object? w)
        n
        (word_count_aux i (+ n 1)))))

(define word_count ; wrapper
  (lambda (i)
    (word_count_aux i 0)))

(define i (open-input-file "prueba.txt")) ; abro puerto p/ leer caracteres
(char_count i)
(close-input-port i)

(define i (open-input-file "prueba.txt")) ; abro puerto p/ leer palabra
(word_count i)
(close-input-port i)

"EJERCICIO 5:"
(define read_file
  (lambda (i)
    (define rd (read-line i))
    (if (eof-object? rd)
        (display "\n")
        (and (display rd) (read_file i)))))
    
(define i (open-input-file "prueba.txt")) ; abro puerto p/ leer
(read_file i)
(close-input-port i)

"EJERCICIO 6:"

(define pesopalabra-aux ; función para obtener el peso de cada palabra.
  (lambda (ls)
    (if (null? ls)
      0
      (let ((p (car ls)) (r (cdr ls)))
        (+ (char->integer p) (pesopalabra-aux r)))))) ; paso char a integer para obtener peso ascii de cada caracter.

(define pesopalabra ; wrapper para peso palabra.
  (lambda (st)
     (pesopalabra-aux (string->list st)))) ; paso string a lista para operar con car y cdr.

(define eliminar ; procedimiento p/ eliminar un elemento de una lista.
  (lambda (n ls)
    (if (null? ls)
        ()
        (let ((p (car ls)) (q (cdr ls)))
          (if (eqv? n p)
              q
              (cons p (eliminar n q)))))))

(define menor  ; encuentro el elemento de menor peso ascii.
  (lambda (ls)
    (if (null? ls)
        ()
        (let ((p (car ls)) (q (cdr ls)))
          (if (null? q)
              p
              (if (< (pesopalabra p) (pesopalabra (car q)))
                  (menor (cons (car ls) (cddr ls)))
                  (menor (cdr ls))))))))
     
(define ordenar  ; construyo la lista con el elem de menor peso ascii, lo elimino  y uso el resto p/ recursividad.
  (lambda (ls)
    (if (null? ls)
        ()
        (cons (menor ls) (ordenar (eliminar (menor ls) ls)))
        )))

(ordenar '("moto" "auto" "casa" "juego" "aire"))

"EJERCICIO 7:"
; VERSIÓN 1 SIN MAP
(define full-reverse-list-aux 
  (lambda (ls e)
    (if (null? ls)
        e
        (let ((p (car ls)) (q (cdr ls)))
          (if (list? p)
            (full-reverse-list-aux q (cons (full-reverse-list p) e))
            (full-reverse-list-aux q (cons p e)))))))

(define full-reverse-list ; wrapper
  (lambda (ls)
    (if (null? ls)
      "Lista vacía."
      (full-reverse-list-aux ls '()))))

(full-reverse-list '(1 (2 3 4 (3 (5 6)) 4)))

; VERSIÓN 2 CON MAP
(define reverse-aux
  (lambda (ls aux)
    (if (list? ls)
          (if (null? ls)
              aux
              (reverse-aux (cdr ls) (cons (car ls) aux)))
          ls
          )))

(define reverse-ls
  (lambda (ls)
    (reverse-aux ls ())))

(define reverse-inside
  (lambda (ls)
    (if (list? ls)
        (map (lambda (x) (reverse-ls (reverse-inside x))) ls)
        ls
        )))

(define fullreverse-list2
  (lambda (ls)
    (reverse-ls (reverse-inside ls))
    ))

(fullreverse-list2 '(1 (2 3 4 (3 (5 6)) 4)))

; VERSIÓN 3 CON MAP
(define colocar
  (lambda (elem ls)
    (if (null? ls)
        (cons elem '())
        (let ((p (car ls)) (r (cdr ls)))
          (cons p (colocar elem r))))))

(define revertir
  (lambda (ls)
    (if (null? ls)
        '()
        (let ((p (car ls)) (r (cdr ls)))
          (colocar p (revertir r))))))

(define fullreverse-list3
  (lambda (ls)
    (revertir (map (lambda (e) (if (list? e)
                                   (fullreverse-list3 e) e)) ls))))

(fullreverse-list3 '(1 (2 3 4 (3 (5 6)) 4)))
 
"EJERCICIO 8:"
(define attach-at-end ; uso attach-at-end porque si paso lista y despues elemento, lo pongo al final.
  (lambda (e l)
    (if (null? l)
        (cons e ())
        (let ((p (car l)) (q (cdr l)))
          (cons p (attach-at-end e q))))))

(define app2list
  (lambda (e1 e2)
    (if (list? e1)
        (if (list? e2)
           (concatenar e1 e2) ; ambos listas.
           (attach-at-end e2 e1)) ; e1 lista, e2 elemento.
        (if (list? e2)
           (cons e1 e2) ; e1 elemento, e2 lista.
           (cons e1 (cons e2 '()))) ; ambos elementos.
           )))

(app2list 2 '(3 4))
(app2list '(1 2) '(3 4))
(app2list 2 3)
(app2list '(1 2) 3)