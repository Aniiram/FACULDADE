(define ocorrencias-de-digitos
  (lambda ()
    (display "Indicar um inteiro: ") 
    (let* ((num (read))
           (numdig (conta-digitos num))
           (vec (make-vector 10 0)))
      (letrec ((aux 
                (lambda ()
                  (if (
                          
(define conta-digitos
  (lambda (num soma)
    (if (zero? num)
        soma
        (conta-digitos (quotient num 10) (+ soma (remainder num 10))))))