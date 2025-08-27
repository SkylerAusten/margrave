(PolicyVocab SocialMediaVocab
  (Types
    (Subject : User)
    (Action : CreatePost ReadPost)
    (Resource : Post)
    (Group : Friends Family Coworkers))
  
  (Decisions
    Permit
    Deny)
  
  (Predicates
    (Owns : User Post)
    (SharedWith : Post Group)
    (MemberOf : User Group))
  
  (ReqVariables
    (s : Subject)
    (a : Action)
    (r : Resource))
  
  (OthVariables
    (g: Group))
  
  (Constraints
    ; Top-level types with multiple subtypes are disjoint.
    (disjoint-all Action)
    (disjoint-all Group)
    
    ; Actions are atomic
    (atmostone-all Action)
    
    ; No undeclared types exist outside the declared subtypes
    (abstract Subject)
    (abstract Action)
    (abstract Resource)
    (abstract Group)
    
    ; There must exist at least one user and one post
    (nonempty Subject)
    (nonempty Resource)
    (nonempty Group)))