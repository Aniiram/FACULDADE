(define Soma-dig-mais-sig
  (lambda (N ND)
    (letrec ((conta-digitos-iter
              (lambda (N soma)
                (if (zero? N)
                    soma
                    (conta-digitos-iter (quotient N 10) (add1 soma)))))
             (Soma-digitos-iter
              (lambda (N soma)
                (if (zero? N)
                    soma
                    (Soma-digitos-iter (quotient N 10) (+ (remainder N 10) soma))))))
      (let ((ndig (conta-digitos-iter N 0)))
        (if (> ndig ND)
            (Soma-digitos-iter (quotient N (expt 10 (- ndig ND))) 0)
            (Soma-digitos-iter N 0))))))
  