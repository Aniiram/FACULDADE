;produção de sons
(require (lib "audio.scm" "user-feup"))

(define nova-direcao
  (lambda (nave cor-percurso)
    (cond ((= (ve-frente nave) cor-percurso) 0)
          ((= (ve-dir nave) cor-percurso) 1)
          ((= (ve-tras nave) cor-percurso) 2)
          ((= (ve-esq nave) cor-percurso) 3)
          (else -1))))  
             
(define segue-percurso-desconhecido
  (lambda (nave cor-percurso)
    (let ((direcao (nova-direccao nave cor-percurso)))
      (if (= direcao -1)
          (som "ri1")
          (begin
            (cond((= direcao 1) (roda-dir nave 1) 



(define segue-percurso-desconhecido
(lambda (nave cor-percurso)
(let ((direccao (nova-direccao nave cor-percurso)))
(if (= direccao -1)
(som "ri1")
(begin
(cond
((= direccao 1)(roda-dir nave 1))
((= direccao 2)(roda-dir nave 2))
((= direccao 3)(roda-esq nave 1)))
(frente nave 1)
(segue-percurso-desconhecido nave cor-percurso))))))