; acesso à abstracção tabuleiro
(require (lib "tabuleiro.scm" "user-feup"))

; -- preparação de uma janela gráfica onde será visualizado um tabuleiro -------
(define largura-jan 390)  ; largura da janela em pixels
(define altura-jan 240)   ; altura da janela em pixels
(define jan-tab (janela largura-jan altura-jan "experiencia com percursos simples")) 

; -- preparação de um tabuleiro onde será visualizado um percurso --------------
(define lado-cel 20)    ; número de pixels do lado da célula quadrada
(define num-cel-x 18)   ; número de células em x
(define num-cel-y 10)   ; número de células em y
(define org-x 15)       ; coordenadas do canto inferior-esquerdo
(define org-y 220)      ; do tabuleiro
;
(define tab-teste (tabuleiro org-x org-y lado-cel num-cel-x  num-cel-y))

; ---- definição e visualização do percurso ------------
(define cor-perc 15)         ; verde amarelado

(celulas tab-teste 
         (list (cons 13 6) (cons 12 6) (cons 11 6) (cons 11 5) 
               (cons 11 4) (cons 11 3)
               (cons 11 2) (cons 10 2) (cons 9 2)
               (cons 9 3) (cons 8 3)(cons 7 3) (cons 6 3)
               (cons 5 3) (cons 4 3)(cons 4 3) (cons 4 4)
               (cons 4 5) (cons 4 6)) 
         'l 30 cor-perc)                 ; 'l- limpa com cor-perc
;
; --- fim da definição do percurso

; acesso à abstracção naves e criação de uma nave 
(require (lib "naves.scm" "user-feup"))
;(define n (cria-nave tab-teste 13 6 'o 18 200))
(define segue-o-percurso
  (lambda (n)
    (frente n 2)
    (roda-dir n 1)
    (frente n 4)
    (roda-esq n 1)
    (frente n 2)
    (roda-esq n 1)
    (frente n 1)
    (roda-dir n 1)
    (frente n 5)
    (roda-esq n 1)
    (frente n 3)))
(define n (cria-nave tab-teste
                     (random num-cel-x)
                     (random num-cel-y)
                    's 18 200))
(define orienta-nave
  (lambda (nova-orientacao n)
    (if(not(equal? nova-orientacao(nave-ori n)))
       (begin
         (roda-dir n 1)
         (orienta-nave nova-orientacao n)))))
(define posicionamento
  (lambda (pos-final-x pos-final-y na)
    (let ((delta-y (- pos-final-y (nave-pos-y na)))
          (delta-x (- pos-final-x (nave-pos-x na))))
      (if (< delta-y 0)
          (begin
            (orienta-nave 'n na)
            (frente na (abs delta-y)))
          (begin
            (frente na delta-y)
            (orienta-nave 's na)))
      (if (< delta-x 0)
          (begin
            (orienta-nave 'o na)
            (frente na (abs delta-x)))
          (begin
            (orienta-nave 'e na)
            (frente na delta-x))))))

