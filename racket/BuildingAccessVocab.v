(PolicyVocab BuildingAccessPolicy
  (Types
    (Subject : Employee Security Visitor)
    (Action : Enter)
    (Resource : Building)
  )
  (Decisions Permit Deny)
  (Predicates
    (GuestPass : Visitor)
    (BusinessHours : Resource) ; Encodes day/time for constraint
  )
  (ReqVariables (s : Subject)
                (a : Action)
                (r : Resource))
  (OthVariables )
  (Constraints
    (disjoint-all Resource)
    (disjoint-all Action)
    (atmostone-all Action)
    (abstract Subject)
    (abstract Action)
    (abstract Resource)
    (nonempty Subject)
    (nonempty Resource)))