(define somaalgn
  (lambda (n p)
    (letrec ((di-men-sig
              (lambda (n)
                (remainder n 10))))
      (if (zero? p)
          0
          (begin
            (if (< n 10)
                n
                (+ (di-men-sig n) (somaalgn (quotient n 10) (sub1 p)))))))))

(define somaalgn
  (lambda (n p)
    (letrec ((di-mais-sig
              (lambda (n p)
                (quotient n (expt 10 (sub1 p)))))
             (n-digitos
              (lambda (n)
                (if (zero? n)
                    0
                    (add1 (n-digitos (quotient n 10)))))))
      (if (zero? p)
          0
          (begin
            (if (
            (+ (di-mais-sig n (n-digitos n)) (somaalgn (remainder n (expt 10 (sub1 (n-digitos n)))) (sub1 p))))))))
