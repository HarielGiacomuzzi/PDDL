; --------------------
; Problem file
; --------------------

(define (problem pb3)
  (:domain planks)

  (:requirements :strips)

  (:objects
    island_a
    island_b
    island_c
    agent
    plank
  )

  (:init
    (AGENT agent)
    (ISLAND island_a )
    (ISLAND island_b )
    (ISLAND island_c)
    (PLANK plank )
    (at agent island_a)
    (at plank island_a)
    (at plank island_b)
    (empty island_b)
    (empty island_c)
    (canCarry agent)
    (adjacent island_a island_b)
    (adjacent island_b island_c)
  )

  (:goal
    (and
      (at agent island_c)
    )
  )
)

; PLAN
; do_example(b,c)
; do_example(a,b)