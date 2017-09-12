; --------------------
; Domain file
; --------------------

(define (domain HeavyPlanks)
  (:requirements :strips)

  (:predicates
    (AGENT ?a)
    (PLANK ?p)
    (ISLAND ?i)
    (at ?a ?i)
    (carry ?a ?p)
    (empty ?i)
    (canCarry ?a)
    (adjacent ?a ?b)
  )

  (:action HeavyPick
    :parameters (?agent_a ?agent_b ?plank ?island_a ?island_b)
    :precondition
      (and
        (AGENT ?agent_a)
        (AGENT ?agent_b)
        (PLANK ?plank )
        (ISLAND ?island_a)
        (ISLAND ?island_b)
        (canCarry ?agent_a)
        (canCarry ?agent_b)
        (at ?agent_a ?island_a)
        (at ?agent_b ?island_b)
        (at ?plank ?island_a)
        (at ?plank ?island_b)
      )
    :effect
      (and
        (carry ?agent_a ?plank)
        (carry ?agent_b ?plank)
        (not (at ?plank ?island_a))
        (not (at ?plank ?island_b))
        (not (canCarry ?agent_a))
        (not (canCarry ?agent_b))
      )
  )

  (:action HeavyLay
    :parameters (?agent_a ?agent_b ?plank ?islandDestination_a ?islandDestination_b)
    :precondition
      (and
        (AGENT ?agent_a)
        (AGENT ?agent_b)
        (PLANK ?plank )
        (ISLAND ?islandDestination_a)
        (ISLAND ?islandDestination_b)
        (carry ?agent_a ?plank)
        (carry ?agent_b ?plank)
        (at ?agent_a ?islandDestination_a)
        (at ?agent_b ?islandDestination_b)
      )
    :effect
      (and
        (canCarry ?agent_a)
        (canCarry ?agent_b)
        (not (carry ?agent_a ?plank))
        (not (carry ?agent_b ?plank))
        (at ?plank ?islandDestination_a)
        (at ?plank ?islandDestination_b)
      )
  )

  (:action HeavyMove
  :parameters (?agent_a ?agent_b ?island_a ?island_b ?destination_a ?destination_b)
  :precondition
    (and
      (AGENT ?agent_a)
      (AGENT ?agent_b)
      (ISLAND ?island_a)
      (ISLAND ?island_b)
      (ISLAND ?destination_a)
      (ISLAND ?destination_b)
      (at ?agent_a ?island_a)
      (at ?agent_b ?island_b)
      (adjacent ?island_a ?destination_a)
      (adjacent ?island_b ?destination_b)
      (empty ?destination_a)
      (empty ?destination_b)
    )
  :effect
    (and
      (at ?agent_a ?destination_a)
      (at ?agent_b ?destination_b)
      (empty ?island_a)
      (empty ?island_b)
      (not (at ?agent_a ?island_a))
      (not (at ?agent_b ?island_b))
      (not (empty ?destination_a))
      (not (empty ?destination_b))
    )
  )  

)