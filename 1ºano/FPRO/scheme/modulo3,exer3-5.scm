;exercicio3-1
(define elimina-primeira-ocorrencia
  (lambda (lista elem)
    (if (null? lista)
        lista
        (if (equal? (car lista) elem)
            (cdr lista)
            (cons (car lista) (elimina-primeira-ocorrencia (cdr lista) elem))))))

;exercicio3-2
(define elimina-todas-ocorrências
  (lambda (lista elem)
    (if (null? lista)
        lista
        (begin 
          (if (equal? (car lista) elem)
              (elimina-todas-ocorrências (cdr lista) elem)
              (cons (car lista) (elimina-todas-ocorrências (cdr lista) elem)))))))

;exercicio3-3
(define elimina-ultima-ocorrencia
  (lambda (lista elem)
    (reverse (elimina-primeira-ocorrencia (reverse lista) elem))))

;exercicio4-1
(define junta-ordenado
  (lambda (crescente-1 crescente-2)
    (cond ((null? crescente-1) crescente-2)
          ((null? crescente-2) crescente-1)
          (else
           (begin 
             (if (< (car crescente-1) (car crescente-2))
                 (cons (car crescente-1) (junta-ordenado (cdr crescente-1) crescente-2))
                 (cons (car crescente-2) (junta-ordenado crescente-1 (cdr crescente-2)))))))))

;exercicio4-2
(define junta-ordenados-sem-repetidos
  (lambda (crescente-1 crescente-2)
    (cond ((null? crescente-1) crescente-2)
          ((null? crescente-2) crescente-1)
          (else
           (begin 
             (cond ((= (car crescente-1) (car crescente-2)) (cons (car crescente-1) (junta-ordenados-sem-repetidos (cdr crescente-1) (cdr crescente-2))))
                   ((< (car crescente-1) (car crescente-2)) (cons (car crescente-1) (junta-ordenados-sem-repetidos (cdr crescente-1) crescente-2)))
                   ((> (car crescente-1) (car crescente-2)) (cons (car crescente-2) (junta-ordenados-sem-repetidos crescente-1 (cdr crescente-2))))))))))

;exercício5-1
(define inverter-posicao-de-todos
  (lambda (l1)
    (if (null? l1)
        ()
        (begin
          (if (pair? (car l1)) 
              (reverse (cons (inverter-posicao-de-todos (car l1)) (inverter-posicao-de-todos (cdr l1))))
              (reverse (cons (car l1) (inverter-posicao-de-todos (cdr l1)))))))))