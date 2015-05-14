(define a-subir
  (lambda (num)
    (letrec ((di-men-sig
              (lambda (n)
                (remainder n 10)))
             (sdi-men-sig
              (lambda (n)
                (remainder n 100)))
             (n-digitos
              (lambda (n)
                (if (zero? n)
                    0
                    (add1 (n-digitos (quotient n 10)))))))
      (cond ((and (not (zero? (n-digitos num))) (< (di-men-sig num) (sdi-men-sig num))) (a-subir (quotient num 10)))
            ((zero? (n-digitos num)) (display "sobe") ()
            ((> (di-men-sig num) (sdi-men-sig num)) (display "nao sobe"))
            ((zero? num) (display "nao sobe"))))))
                                                                                        
              