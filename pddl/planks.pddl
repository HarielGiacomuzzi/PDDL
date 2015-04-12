; --------------------
; Domain file
; --------------------

(define (domain planks)
  (:requirements :strips)

  (:predicates
    (example ?var1 ?var2)
  )

  (:action do_example
    :parameters (?var1 ?var2)
    :precondition
      (and
        (example ?var1 ?var2)
      )
    :effect
      (and
        (not (example ?var1 ?var2))
      )
  )
)