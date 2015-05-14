;    - mineiro (lista 3 elem, par + par)
;     (faz-mineiro linha coluna situacao)
;     (desloca-mineiro mineiro orientacao distancia)
;        -> (rebate-mineiro mineiro delta-linha delta-coluna)
;     (enriquece-mineiro mineiro pontos)
;     (linha-mineiro mineiro)
;     (coluna-mineiro mineiro)
;     (situacao-mineiro mineiro)
;     (escreve-mineiro mineiro)
     
;    - tabuleiro (lista de 8 listas de 8 elementos)
;      (faz-tabuleiro nlinhas ncolunas)
;      (escreve-tabuleiro tabuleiro)
;      (le-tabuleiro tabuleiro mineiro)

(define criarlista 
  (lambda (elem)
    (if (zero? elem)
        '()
        (cons (- (random 199) 99) (criarlista (sub1 elem))))))

(define faz-mineiro
  (lambda (lin col ori)
    (cons (cons lin col) ori)))

(define faz-tabuleiro
  (lambda (n-lin n-col)
    (if (zero? n-lin)
        '()
        (cons (criarlista n-col) (faz-tabuleiro (sub1 n-lin) n-col)))))
(define escreve-tabuleiro
  (lambda (n-lin n-col)
    (let ((lista (faz-tabuleiro n-lin n-col)))
      (display lista))))