(define misturar-dois-inteiros
  (lambda (a b)
    (cond
      ((zero? b) a)
      ((zero? a) b)
      (else
       (+ (remainder a 10)
          (* 10 (remainder b 10))
          (* 100 (misturar-dois-inteiros (quotient a 10) (quotient b 10))))))))

(define misturar-dois-inteiros-iter
  (lambda (a b)
    (letrec ((misturar-dois-inteiros-iter1
              (lambda (a b acum pot)
                (cond
                  ((zero? b) (+ acum (* a pot)))
                  ((zero? a) (+ acum (* b pot)))
                  (else
                   (misturar-dois-inteiros-iter1
                    (quotient a 10)
                    (quotient b 10)
                    (+ acum (* pot (+ (remainder a 10) (* 10 (remainder b 10)))))
                    (* 100 pot)))))))
      (misturar-dois-inteiros-iter1 a b 0 1))))
