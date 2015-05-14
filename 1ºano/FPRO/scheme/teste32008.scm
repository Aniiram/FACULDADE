(define inclui-numero?
  (lambda (pw)
    (letrec ((aux (lambda (i)
                    (cond ((= i (string-length pw)) #f)
                          ((char-numeric? (string-ref pw i)) #t)
                          (else (aux (add1 i)))))))
      (aux 0))))

(define inclui-letra?
  (lambda (pw)
    (letrec ((aux (lambda (i)
                    (cond ((= i (string-length pw)) #f)
                          ((char-alphabetic? (string-ref pw i)) #t)
                          (else (aux (add1 i)))))))
      (aux 0))))

(define tamanho-minimo?
  (lambda (pw)
    (>= (string-length pw) 8) ))

(define cumpre?
  (lambda (dados lista-pred)
    (if (null? lista-pred)
        #t
        (if (equal? #f ((car lista-pred) dados))
            #f
            (cumpre? dados (cdr lista-pred))))))

(define cria-utilizador
  (lambda (login pw)
    (list login pw 0)))

(define reverse-lista 
  (lambda (x)
    (reverse (append x (list '?)))))

(define utilizadores (list (cria-utilizador "administrador" "x1y2z3w4")))

(define acrescenta-utilizador!
  (lambda (lista login pass)
    (letrec ((aux
              (lambda (list1)
                (if (null? list1)
                    1
                    (if (equal? (caar list1) login)
                        0
                        (aux (cdr list1)))))))
      (if (= 0 (aux lista))
          #f
          (begin 
            (if (= 1 (length lista))
                (set-cdr! lista (cria-utilizador login pass))
                (reverse (set-car! (reverse-lista lista) (list (cria-utilizador login pass)))))
                #t)))))

        
