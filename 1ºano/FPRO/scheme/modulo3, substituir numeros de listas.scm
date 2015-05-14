(define faz-ponto
  (lambda (x y)
    (cons x y)))

(define x-cord
  (lambda (ponto-2d)
    (car ponto-2d)))

(define y-cord
  (lambda (ponto-2d)
    (cdr ponto-2d)))

(define  faz-rectangulo
  (lambda (p1 p2)
    (cons p1 p2)))

(define area-rectangulo
  (lambda (ret)
    (let ((p1 (car ret))
          (p2 (cdr ret)))
      (abs (* (- (x-cord p1) (x-cord p2))
              (- (y-cord p1) (y-cord p2)))))))

(define distancia
  (lambda (p1 p2)
    (abs (sqrt (+ (expt (- (x-cord p2) (x-cord p1)) 2) (expt (- (y-cord p2) (y-cord p1)) 2))))))

(define somatório 
  (lambda (lista)
    (if (null? lista)
        0
        (+ (car lista) (somatório (cdr lista))))))

(define somaiter
  (lambda (lista)
    (letrec ((somatório2
              (lambda (lista soma)
                (if (null? lista)
                    soma
                    (somatório2 (cdr lista) (+ soma (car lista)))))))
      (somatório2 lista 0))))

(define substituir-num
  (lambda (lista novo velho)
    (if (equal? (car lista) velho)
        (cons novo (cdr lista))
        (cons (car lista) (substituir-num (cdr lista) novo velho)))))

(define substituir-numtodos
  (lambda (lista novo velho)
    (if (null? lista)
        lista
        (begin
          (if (equal? (car lista) velho)
              (cons novo (substituir-numtodos (cdr lista) novo velho))
              (cons (car lista) (substituir-numtodos (cdr lista) novo velho)))))))
    