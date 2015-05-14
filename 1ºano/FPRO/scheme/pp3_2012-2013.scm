;1
(define insert-orderedhorrible!
  (lambda (num lis)
    (if (= 1 (length lis))
        (if (number? (car lis))
            (if (> (car lis) num)
                (begin
                  (set-cdr! lis (append (list (car lis)) (cdr lis)))
                  (set-car! lis num))
                (set-cdr! lis (list num)))
            (set-cdr! lis (list num)))
        (if (number? (car lis))
            (if (> (car lis) num)
                (begin
                  (set-cdr! lis (append (list (car lis)) (cdr lis)))
                  (set-car! lis num))
                (insert-ordered! num (cdr lis)))
            (insert-ordered! num (cdr lis))))))
;now with a good code
(define insert-ordered!
  (lambda (num lis)
    (cond ((null? (cdr lis))
           (set-cdr! lis (list num)))
          ((< num (cadr lis))
           (set-cdr! lis (append (list num) (cdr lis))))
          (else
           (insert-ordered! num (cdr lis))))))
;(define lista1 '(>))
;(insert-ordered! 10 lista1)
;lista1
;;(> 10)
;(insert-ordered! 5 lista1)
;(insert-ordered! 25 lista1)
;lista1
;;(> 5 10 25)
;(insert-ordered! 15 lista1)
;(insert-ordered! 15 lista1)
;(insert-ordered! 1 lista1)
;(insert-ordered! 20 lista1)
;lista1
;;(> 1 5 10 15 15 20 25)

;2.a
(define test
  (lambda (pred)
    (lambda (x)
      (if (pred x)
          1
          0))))
;(define tst-i (test integer?))
;(tst-i 12)
;1
;(tst-i 'abc)
;0
;(define tst-s (test symbol?))
;(tst-s'abc)
;1

;2.b
(define count
  (lambda (pred lis)
    (apply + (map (test pred) lis))))
;(count integer? (list 'abc 'def 1 2 "abc" #t 5.7))
;2
;(count char? (list 'abc 'def 1 2 "abc" #t 5.7))
;0
;(count symbol? (list 'abc 'def 1 2 "abc" #t 5.7))
;2
;(count list? '( '(1 2 3 4 5) '( '(1 2) a b c) '(abc def)))
;3

;3.a
(define hist-init
  (lambda (n)
    (make-vector n 0)))
;(hist-init 21) ; histograma das notas finais de FPRO que variam de 0 a 20
;#21(0)
;(hist-init 6) ; histograma de notas de um trabalho prático que variam de 0 a 5
;#6(0)

;3.b
(define hist-update!
  (lambda (hist value)
    (vector-set! hist value (add1 (vector-ref hist value)))))

;(define hist1 (hist-init 21))
;hist1
;#21(0)
;(hist-update! hist1 1) (hist-update! hist1 10) (hist-update! hist1 12) (hist-update! hist1 19) (hist-update! hist1 10)
;hist1
;#21(0 1 0 0 0 0 0 0 0 0 2 0 1 0 0 0 0 0 0 1 0)

;3.c
(define hist-build
  (lambda (list-int n)
    (letrec ((hist (hist-init n))
             (aux
              (lambda (lis)
                (if (not (null? lis))
                    (begin
                      (hist-update! hist (car lis))
                      (aux (cdr lis)))))))
      (aux list-int)
      hist)))
;(hist-build (list 1 10 8 12 10 14 10 18 19 12 14 15 14 18) 21)
;#21(0 1 0 0 0 0 0 0 1 0 3 0 2 0 3 1 0 0 2 1 0)

;4.1
(define string-append-new-horrible
  (lambda (p1 p2)
    (cond ((and (char? p1) (string? p2)) 
           (string-append (string p1) p2))
          ((and (string? p1) (char? p2))
           (string-append p1 (string p2)))
          ((and (char? p1) (char? p2))
           (string-append (string p1) (string p2)))
          (else
           (string-append p1 p2)))))
(define string-append-new
  (lambda (p1 p2)
    (let ((s1 (if (char? p1) (string p1) p1))
          (s2 (if (char? p2) (string p2) p2)))
      (string-append s1 s2))))
;(string-append-new "abcd" "ef")
;"abcdef"
;(string-append-new "abcd" #\E)
;"abcdE"
;(string-append-new #\E "abcd")
;"Eabcd"

;4.2
(define decompose-sentence
  (lambda (sentence)
    (letrec ((aux
              (lambda (i f)
                (if (<= (string-length sentence) f)
                    (begin
                      (display (substring sentence i f))
                      (newline))
                    (if (char-whitespace? (string-ref sentence f))
                        (begin
                          (display (substring sentence i f))
                          (newline)
                          (aux (add1 f) (add1 f)))
                        (aux i (add1 f)))))))
      (aux 0 0))))
(decompose-sentence "Hello my friends !")
;Hello
;my
;friends
;!
(decompose-sentence "Hello!")
;Hello!
(decompose-sentence "")
;>