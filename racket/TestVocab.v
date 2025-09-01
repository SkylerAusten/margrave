(PolicyVocab TestVocab
             (Types
              (Subject : User1 User2)
              (Action : CreatePost ReadPost)
              (Resource : Post))
             (Decisions 
              Permit
              Deny)
             (Predicates
              (Owns : Subject Post)
              (SharedWith : Post Subject)
              (FriendOf : Subject Subject)
              (FamilyOf : Subject Subject)
              (CoworkerOf : Subject Subject))

	     (ReqVariables (s1 : User1)
                           (s2 : User2)
                           (a : Action)
                           (r : Resource))
             (OthVariables )
             (Constraints

	          ; An action is never another action type.
              (disjoint-all Action)

              ; A subject is never both User1 and User2.
              (disjoint-all Subject)
	      
              ; Efficiency constraint: Never assign more than one atom to any subject or action type.
              (atmostone-all Action)
              (atmostone-all Subject)

	      ; Specify that there is no S, A, or R outside our declared subtypes
	      (abstract Subject)
	      (abstract Action)
          (abstract Resource)

	      ; Weed out vacuous solutions: Require there to be some Subject and some Resource.
              (nonempty Subject)
              (nonempty Action)
              (nonempty Resource)))