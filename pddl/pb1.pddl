; --------------------
; Problem file
; --------------------

(define (problem pb1)
  (:domain planks)

  (:requirements :strips)

  (:objects
    a
    b
    c
  )

  (:init
    (example a b)
    (example b c)
  )

  (:goal
    (and
      (not (example a b))
      (not (example b c))
    )
  )
)

; PLAN
; do_example(b,c)
; do_example(a,b)