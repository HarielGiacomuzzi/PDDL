; --------------------
; Problem file
; --------------------

(define (problem pb1)
  (:domain planks)

  (:requirements :strips)

  (:objects
    island_a
    island_b
    agent
    plank
  )

  (:init
    (AGENT agent)
    (ISLAND island_a )
    (ISLAND island_b )
    (PLANK plank )
    (empty island_b)
    (at agent island_a)
    (at plank island_a)
    (at plank island_b)
    (adjacent island_a island_b)
  )

  (:goal
    (and
      (at agent island_b)
    )
  )
)

; PLAN
; do_example(b,c)
; do_example(a,b)