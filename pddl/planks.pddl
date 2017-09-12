; --------------------
; Domain file
; --------------------

(define (domain planks)
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

  (:action pick
    :parameters (?agent ?plank ?island)
    :precondition
      (and
        (AGENT ?agent )
        (PLANK ?plank )
        (ISLAND ?island)
        (canCarry ?agent)
        (at ?agent ?island)
        (at ?plank ?island)
      )
    :effect
      (and
        (forall (?i)
          (when (and (ISLAND ?i))
            (not (at ?plank ?i))
          )
        )
        (carry ?agent ?plank)
        (not (at ?plank ?island))
        (not (canCarry ?agent))
      )
  )

  (:action lay
  :parameters (?agent ?plank ?island ?destination)
  :precondition
    (and
      (AGENT ?agent )
      (PLANK ?plank )
      (ISLAND ?island )
      (ISLAND ?destination )
      (carry ?agent ?plank)
      (at ?agent ?island)
      (adjacent ?island ?destination)
    )
  :effect
    (and
      (at ?plank ?island)
      (at ?plank ?destination)
      (canCarry ?agent)
      (not(carry ?agent ?plank ))
    )
  )

  (:action cross
  :parameters (?agent ?island ?destination ?plank)
  :precondition
    (and
      (AGENT ?agent )
      (ISLAND ?island)
      (ISLAND ?destination)
      (PLANK ?plank)
      (at ?agent ?island)
      (adjacent ?island ?destination)
      (at ?plank ?island)
      (empty ?destination)
      (at ?plank ?destination)
    )
  :effect
    (and
      (at ?agent ?destination)
      (empty ?island)
      (not (empty ?destination))
      (not (at ?agent ?island))
    )
  )

)