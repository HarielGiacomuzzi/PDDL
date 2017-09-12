; --------------------
; Problem file
; --------------------

(define (problem heavyPlanks)
  (:domain HeavyPlanks)

  (:requirements :strips)

  (:objects
    island_a
    island_b
    island_c
    island_d
    agent_a
    agent_b
    plank
  )

  (:init
    (AGENT agent_a)
    (AGENT agent_b)
    (ISLAND island_a )
    (ISLAND island_b )
    (ISLAND island_c )
    (ISLAND island_d )
    (PLANK plank )
    (empty island_c)
    (empty island_d)
    (at agent_a island_a)
    (at agent_b island_b)
    (at plank island_a)
    (at plank island_b)
    (canCarry agent_a)
    (canCarry agent_b)
    (adjacent island_a island_c)
    (adjacent island_b island_d)
    (adjacent island_a island_b)

  )

  (:goal
    (and
      (at plank island_c)
      (at plank island_d)
    )
  )
)

; PLAN
; do_example(b,c)
; do_example(a,b)