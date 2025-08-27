(Policy SocialPolicy2 uses SocialMediaVocab
  (Target)
  (Rules
    (DenyCoworkersFirst = (Deny s a r) :-
        (ReadPost a) (Owns s r) (MemberOf s Coworkers) (!MemberOf s Family))

    (PermitFriends = (Permit s a r) :-
        (ReadPost a) (Owns s r) (MemberOf s Friends) (SharedWith r Friends))

    (PermitFamily = (Permit s a r) :-
        (ReadPost a) (Owns s r) (MemberOf s Family) (SharedWith r Family)))
  (RComb FAC)
  (PComb FAC)
  (Children))