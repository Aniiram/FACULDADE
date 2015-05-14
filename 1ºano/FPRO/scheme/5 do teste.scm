(define identificador-unico
  (lambda (n)
    (letrec ((contadigitos
              (lambda (n soma)
                (if (zero? n)
                    soma
                    (contadigitos (quotient n 10) (add1 soma)))))
             (nummaisdir
              (lambda (n)
                (quotient n (expt 10 (sub1 (contadigitos n 0))))))
             (nummaisesq
              (lambda (n)
                (remainder n 10)))
             (multiplicador
              (lambda (n niter)
                (if (zero? niter)
                    0
                    (+ (* (nummaisdir n) (nummaisesq n)) (multiplicador (remainder (quotient n 10) (expt 10 (- (contadigitos n 0) 2))) (sub1 niter)))))))
      (multiplicador n (quotient (contadigitos n 0) 2)))))