(define procura-no-vector
  (lambda (vec elem)
    (letrec ((aux 
              (lambda (i)
                (if (> (vector-length vec) i)
                       (if (equal? elem (vector-ref vec i))
                           i
                           (aux (add1 i)))
                       -1))))
      (aux 0))))

;construtor
(define cria-equi-fute-vec
  (lambda ()
    (list (make-vector 11 '?) (make-vector 5 '?) '?)))

;selector
(define pesquisa-jogador
  (lambda (vec jogador)
    (letrec ((aux 
              (lambda (i)
                (if (> (vector-length vec) i)
                       (if (equal? jogador (vector-ref vec i))
                           i
                           (aux (add1 i)))
                       -1))))
      (aux 0))))

;modificadores
(define entra-equi-vec!
  (lambda (equipa numero jogador)
    (if (and (>= numero 1) (<= numero 11))
        (begin 
          (vector-set! (car equipa) (sub1 numero) jogador)
          'ok!)
        'erro!)))

(define entra-sup-vec!
  (lambda (equipa numero jogador)
    (if (and (>= numero 1) (<= numero 5))
        (begin
          (vector-set! (cadr equipa) (sub1 numero) jogador)
          'ok!)
        'erro!)))

(define entra-treina-vec!
  (lambda (equipa treinador)
    (set-cdr! (cdr equipa) (list treinador))
    'ok!))

(define sai-equi-vec!
  (lambda (equipa jogador)
    (let ((pri (pesquisa-jogador (car equipa) jogador))
          (sup (pesquisa-jogador (cadr equipa) jogador)))
      (cond ((and (= pri -1) (= sup -1)) ('O jogador não pertence à equipa))
            ((< -1 pri) (entra-equi-vec! equipa (add1 pri) '?) 'ok!)
            ((< -1 sup) (entra-sup-vec! equipa (add1 sup) '?) 'ok!)))))

(define fcp (cria-equi-fute-vec))
(entra-equi-vec! fcp 11 'artur)
(entra-equi-vec! fcp 1 'rui-correia)
(entra-sup-vec! fcp 4 'folha)
(entra-treina-vec! fcp 'oliveira)