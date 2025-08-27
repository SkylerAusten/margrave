(Policy SocialPolicy4 uses SocialMediaVocab
  (Target)
  (Rules
    (DenyCoworkersNotFamily = (Deny s a r) :-
        (ReadPost a) (Owns s r) (MemberOf s Coworkers) (!MemberOf s Family))

    (PermitFriendsView = (Permit s a r) :-
        (ReadPost a) (Owns s r) (MemberOf s Friends) (SharedWith r Friends))

    (PermitFamilyView = (Permit s a r) :-
        (ReadPost a) (Owns s r) (MemberOf s Family) (SharedWith r Family)))
  (RComb FAC)
  (PComb FAC)
  (Children))