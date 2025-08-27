(PolicyVocab SocialMediaVocab
  (Types
    (Subject : User)
    (Action : CreatePost ReadPost DeletePost SharePost)
    (Resource : Post)
    (Group : Friend Family Coworker)
  )
  (Decisions Permit Deny)
  (Predicates
    ;; Relationship predicates
    (FriendOf : User User)
    (FamilyOf : User User)
    (CoworkerOf : User User)

    ;; Ownership predicates
    (Owns : User Post)

    ;; Membership convenience predicates
    (CanViewAsFriend : User Post)
    (CanViewAsFamily : User Post)
    (CanViewAsCoworker : User Post)
  )
  (ReqVariables (s : Subject)   ;; subject (viewer)
                (a : Action)    ;; action
                (r : Resource)) ;; post
  (OthVariables (u : User))     ;; post owner, etc.
  (Constraints
    (disjoint-all Resource)
    (disjoint-all Action)
    (disjoint-all Group)
    (atmostone-all Action)
    (abstract Subject)
    (abstract Action)
    (abstract Resource)
    (nonempty Subject)
    (nonempty Resource)))