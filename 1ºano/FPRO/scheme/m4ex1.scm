(define somatorio
  (lambda (fun inf sup passo)
    (if (> inf sup)
        0
        (+ (fun inf)
           (somatorio fun (passo inf) sup passo)))))

(define triplo (lambda (x) (* 3 x)))

(define pi-aprox
  (lambda (n)
    (* 4.000 (- (somatorio (lambda (x) (/ 1 x)) 1 (add1 (* 4 n)) (lambda (x) (+ 4 x))) (somatorio (lambda (x) (/ 1 x)) 3 (+ (* 4 n) 3) (lambda (x) (+ 4 x)))))))  

(define compra3
  (lambda (p1 p2 p3)
    (lambda (x)
      (p1 (p2(p3 x))))))

(define compoe-muitas
  (lambda args
    (if (null? args)
        (lambda (x) x)
        (lambda (x) ((car args) ((apply compoe-muitas (cdr args))) x)))))

(define faz-funcao-acesso-a-lista
  (lambda (x)
    (lambda (lista)
      (if (> (length lista) x)
          (list-ref lista x)
          (display "erro: lista pequena")))))