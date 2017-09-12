; --------------------
; Problem file
; --------------------

(define (problem pb4)
  (:domain planks)

  (:requirements :strips)

  (:objects
    island_a
    island_b
    island_c
    island_d
    agent_a
    agent_b
    plank_a
    plank_b
  )

  (:init
    (AGENT agent_a)
    (AGENT agent_b)
    (ISLAND island_a )
    (ISLAND island_b )
    (ISLAND island_c )
    (ISLAND island_d )
    (PLANK plank_a )
    (PLANK plank_b )
    (at agent_a island_a)
    (at agent_b island_b)
    (at plank_a island_b)
    (at plank_a island_c)
    (at plank_b island_b)
    (at plank_b island_d)
    (empty island_c)
    (empty island_d)
    (canCarry agent_a)
    (canCarry agent_b)
    (adjacent island_a island_b)
    (adjacent island_b island_a)
    (adjacent island_b island_c)
    (adjacent island_c island_b)
    (adjacent island_b island_d)
    (adjacent island_d island_b)
  )

  (:goal
    (and
      (at agent_a island_c)
      (at agent_b island_a)
      (at plank_a island_b)
      (at plank_a island_d)
      (at plank_b island_b)
      (at plank_b island_a)
    )
  )
)