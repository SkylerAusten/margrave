(PolicyVocab UniversityPolicy
  (Types
    (Subject : Student TA Professor)
    (Action : SubmitAssignment GradeAssignment AssignFinalGrade)
    (Resource : Assignment GradeRecord)
  )
  (Decisions Permit Deny)
  (Predicates
    (Owns : Student Assignment)
    (AssignedTo : TA Assignment)
    (Submitted : Student Assignment)
    (DualRole : Student TA)) ; Special "Student-TA"
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