(PolicyVocab TestVocab
             (Types
              (Subject : User)
              (Action : CreatePost ReadPost)
              (Resource : Post))
             (Decisions 
              Permit
              Deny)
             (Predicates
              (Owns : User Post)
              (SharedWith : Post User)
              (FriendOf : User User)
              (FamilyOf : User User)
              (CoworkerOf : User User))

	     (ReqVariables (s : Subject)
                           (a : Action)
                           (r : Resource))
             (OthVariables )
             (Constraints

	          ; An action is never another action type.
              (disjoint-all Action)
	      
              ; Efficiency constraint: Never assign more than one atom to any action type. (They are "atomic.")
              (atmostone-all Action)

	      ; Specify that there is no S, A, or R outside our declared subtypes
	      (abstract Subject)
	      (abstract Action)
          (abstract Resource)

	      ; Weed out vacuous solutions: Require there to be some Subject and some Resource.
              (nonempty Subject)
              (nonempty Action)
              (nonempty Resource)))