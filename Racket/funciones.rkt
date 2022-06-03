; función que reciba como parámetros dos puntos en el plano (como lista impropia) y devuelva su distancia.
(define distance2d
  (lambda (x y)
    (if (and (list? (cdr x)) (list? (cdr y)))
        "No se están comparando listas impropias."
        (let ((x1 (car x)) (x2 (car y)) (y1 (cdr x)) (y2 (cdr y)))
          (sqrt (+ (* (- x1 x2) (- x1 x2)) (* (- y1 y2) (- y1 y2)))))
        )))

; función que reciba un punto en el plano y una lista da puntos y devuelva la distancia al más cercano.
(define proximo (lambda (x l)
                  (if (null? l)
                      (display "Lista vacia")
                      (let ((d1 (distance2d x (car l))) (r (cdr l)))
                        (if (null? r)
                            d1
                            (let ((d2 (proximo x r)))
                              (if (< d1 d2)
                                  d1
                                  d2
                                  )))))))

; función que devuelve el largo de una lista (length).
(define length2
  (lambda (l)
    (if (null? l)
        0
        (+ (length2 (cdr l)) 1))))

; función que cuenta un elemento en una lista.
(define count-elem
  (lambda (e l)
    (if (null? l)
        0
        (let ((p (car l)) (q (cdr l)))
          (if (eqv? p e)
              (+ 1 (count-elem e q))
              (count-elem e q))))))

(define contar ; cuenta la cantidad de un elemento en una lista de listas.
  (lambda (ls e)
    (if (null? ls)
        0
        (if (list? (car ls))
            (+ (contar (car ls) e) (contar (cdr ls) e))
            (if (eqv? (car ls) e)
                (+ 1 (contar (cdr ls) e))
                (contar (cdr ls) e))))))

; función que reemplaza un elemento x por otro y, en una lista.
(define subst
  (lambda (a b l)
    (if (null? l)
        ()
        (let ((p (car l)) (q (cdr l)))
          (if (eqv? p a)
              (cons b (subst a b q))
              (cons p (subst a b q))
              )))))

; función que elimina un elemento dado de una lista.
(define eliminar
  (lambda (e ls)
    (if (null? ls)
        ()
        (let ((p (car ls)) (q (cdr ls)))
            (if (equal? e p)
                (eliminar e q)
                (cons p (eliminar e q)))))))

(define eliminar ; elimina un elemento dado de una lista de listas.
  (lambda (ls e)
    (if (null? ls)
        ()
        (if (list? (car ls))
            (cons (eliminar (car ls) e) (eliminar (cdr ls) e))
            (if (eqv? (car ls) e)
                (eliminar (cdr ls) e)
                (cons (car ls) (eliminar (cdr ls) e)))))))

; función que agrupa los elementos iguales en sublistas.
(define agrupar
  (lambda (lista)
    (if (null? lista)
        ()
        (cons (vector->list (make-vector (count-elem (car lista) lista) (car lista)))
              (agrupar (eliminar (car lista) (cdr lista)))))))

; función que concatena dos listas.
(define concatenar
  (lambda (l1 l2)
    (if (null? l1)
        l2           
        (let ((p (car l1)) (q (cdr l1)))
          (if (null? q)    
              (cons p l2)   
              (cons p (concatenar q l2)))))))

; función que inserta un elemento al final de una lista.
(define attach-at-end
  (lambda (e l)
    (if (null? l)
        (cons e ())
        (let ((p (car l)) (q (cdr l)))
          (cons p (attach-at-end e q))))))

; función que devuelve la lista de las distancias entre cada punto, tomado de a pares consecutivos.
(define distancias
  (lambda (l)
    (if (null? l)
        ()
        (let ((p (car l)) (r (cdr l)))
          (if (null? r)
              ()
              (let ((q (car r)))
                (cons (distance2d p q) (distancias r))))))))

; sintaxis de struct: definición e instanciacion. 
(define-struct punto (x y))
(define e1 (make-punto 1 1))
(define e2 (make-punto 2 3))
(define e3 (make-punto 2 0))

(define-struct point3d (x y z))
(define a1 (make-point3d 1 1 1))
(define a2 (make-point3d 2 2 2))
(define a3 (make-point3d 3 3 3))

; función que retorna distancia entre dos puntos con struct.
(define dist
  (lambda (p1 p2)
    (let ((x1 (punto-x p1)) (x2 (punto-x p2)) (y1 (punto-y p1)) (y2 (punto-y p2)))
         (sqrt (+ (* (- x2 x1) (- x2 x1)) (* (- y2 y1) (- y2 y1)))))))

; función que retorna centro de gravedad entre los puntos de una lista.
(define sum_point ; sumo los x, y, z entre los puntos.
  (lambda (lista)
    (if (null? lista)
        '(0 0 0)
        (let ((p (car lista)) (r (cdr lista)))
             (map + (list (point3d-x p) (point3d-y p) (point3d-z p)) (sum_point r))))))

(define div_l ; divido por el largo de la lista (cantidad de puntos)
  (lambda (lista)
    (map (lambda (x) (/ x (length lista))) lista)))

(define gravc ; wrapper
  (lambda (lista)
    (if (null? lista)
        (display "Lista vacía")
        (let ((suma (sum_point lista)))
              (div_l suma)))))

; función para calcular la distancia máxima entre dos puntos de una lista CON MAP Y STRUCT.
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

; función para contar caracteres de un archivo.
(define char_count
  (lambda (i)
    (define ch (read-char i))
      (if (eof-object? ch)
          0
          (+ 1 (char_count i)))))

; función para contar palabras de un archivo.
(define word_count
  (lambda (i)
    (define w (read i))
    (if (eof-object? w)
        0
        (+ 1 (word_count i)))))

; sintaxis para llamar a funcion con archivo.
(define i (open-input-file "prueba.txt")) ; abro puerto p/ leer caracteres
;(char_count i) ; llamo a la función para contar.
(close-input-port i) ; cierro puerto así reseteo el cursor.

(define i (open-input-file "prueba.txt")) ; abro puerto p/ leer palabra
;(word_count i) ; llamo a la función para contar.
(close-input-port i)

; función para leer por pantalla un archivo.
(define read_file
  (lambda (i)
    (define rd (read-line i))
    (if (eof-object? rd)
        (display "\n")
        (and (display rd) (read_file i)))))

; función que crea un archivo y le escribe adentro.
(define o (open-output-file "saludo.txt"))
(display "hola" o)
(write-char #\space o)
(display 'mundo! o)
(newline o)
(close-output-port o)
    
; función para revertir una lista completamente, sin map.
(define fullreverse-list
  (lambda (lista)
    (if (null? lista)
        '()
        (if (list? (car lista))
            (concatenar (fullreverse-list (cdr lista)) (list (fullreverse-list (car lista))))
            (if (null? (cdr lista))
                lista
                (concatenar (fullreverse-list (cdr lista)) (list (car lista))))))
                   ))

; función para revertir lista completamente, con map. (usa inv)       
(define fullreverse-list ; invertir listas anidadas con map
  (lambda (ls)
    (inv (map (lambda (e) (if (list? e)
                                   (fullreverse-list e) e)) ls))))

; función para invertir una lista sin lista auxiliar.
(define inv ; invertir sin lista auxiliar (optimo)
  (lambda (ls)
    (if (null? ls)
        '()
        (concatenar (inv (cdr ls)) (cons (car ls) '())))))

; función para verificar que un elemento permanezca a una lista.
(define pertenece
  (lambda (e l)
    (if (null? l)
        #f
        (let ((p (car l)) (r (cdr l)))
          (if (eqv? e p)
              #t
              (pertenece e r))))))

; función para obtener el menor de una lista.
(define menor
  (lambda (ls)
    (let ((elem1 (car ls)))
      (if (= (length ls) 1)
          elem1
          (let ((elem2 (menor (cdr ls))))
            (if (< elem2 elem1)
                elem2
                elem1))))))

; función para ordenar una lista de menor a mayor (para mayor a menor, cambio el let).
(define ordenar
  (lambda (ls)
    (if (null? ls)
        ()
        (let ((m (menor ls)))
        (cons m (ordenar (eliminar m ls)))))))                

; función para obtener el mayor de una lista.
(define mayor
  (lambda (ls)
    (let ((elem1 (car ls)))
      (if (= (length ls) 1)
          elem1
          (let ((elem2 (mayor (cdr ls))))
            (if (> elem2 elem1)
                elem2
                elem1))))))

; función para obtener profundidad de una lista (cantidad de paréntesis)
(define get-profundidad
  (lambda (e)
    (if (null? e)
        0
        (if (list? e)
            (+ 1 (mayor (map (lambda (x) (get-profundidad x)) e)))
            -1))))

; función para quitar los paréntesis de una lista (aplanar)
(define aplanar
  (lambda (ls)
    (if (null? ls)
        ()
        (let ((p (car ls)) (r (cdr ls)))
          (if (list? p)
              (concatenar (aplanar p) (aplanar r))
              (cons p (aplanar r))
    )))))

(define last-elem ; función para obtener ultimo elemento.
  (lambda (ls)
    (let ((p (car ls)) (r (cdr ls)))
      (if (null? r)
          p
          (last-elem r))
    )))
  
(define first-elems ; función para obtener todos los elementos menos el último.
  (lambda (ls)
    (let ((p (car ls)) (r (cdr ls)))
      (if (null? (cdr ls))
        ()
        (cons p (first-elems r))
    ))))

; función para obtener profundidad de un árbol
(define profundidad
  (lambda (ls)
    (if (null? ls)
        0
        (if (null? (cdr ls))
            1
            (let  ((izq (profundidad (cadr ls))) (der (profundidad (caddr ls))))
              (if (> izq der)
                  (+ 1 izq)
                  (+ 1 der)))))))

(define pesopalabra-aux ; función para obtener el peso de cada palabra.
  (lambda (ls)
    (if (null? ls)
      0
      (let ((p (car ls)) (r (cdr ls)))
        (+ (char->integer p) (pesopalabra-aux r)))))) ; paso char a integer para obtener peso ascii de cada caracter.

(define pesopalabra ; wrapper para peso palabra.
  (lambda (st)
     (pesopalabra-aux (string->list st)))) ; paso string a lista para operar con car y cdr.

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

; XOR
(define xor
  (lambda (a b)
    (if (or (and (not a) b) (and (not b) a))
        #t
        #f)))

; SINTAXIS VECTORES:
(make-vector 3) ; crea vector con 3 posiciones. las llena con 0 si no pongo nada.
(make-vector 3 'a) ; crea vector con 3 posiciones, las llena con a.
(make-vector 0 'a) ; crea vector ().

(vector-length '#()) ; 0
(vector-length '#(a b c)) ; 3
(vector-length (vector 1 2 3 4)) ; 4
(vector-length (make-vector 30)) ; 30

(vector-ref '#(a b c) 0) ; a
(vector-ref '#(a b c) 1) ; b
(vector-ref '#(a b c) 2) ; c

(let ((v (vector 'a 'b 'c)))
  (vector-set! v 2 'x) ; cambia elem. en la posición 2 por x.
  v)

(let ((v (vector 'a 'b 'c)))
  (vector-fill! v 'x) ; cambia todos los elem. del vector por x.
  v)

(let ((v (vector 'a 'b 'c)))
  (vector->list v)) ; cambia vector a lista.

(let ((ls (list 'a 'b 'c)))
  (list->vector ls)) ; cambia lista a vector.

; SINTAXIS MAP: 
(map cons '(a b c) '(d e f)) ; ((a . d) (b . e) (c . f))
(map inv '((a b c) (d e f))) ; ((c b a) (f e d))
(inv (map inv '((a b c) (d e f)))) ; ((f e d) (c b a))
(map (lambda (x) (concatenar x '(x))) '((a b c) (d e f))) ; ((a b c x) (d e f x))
