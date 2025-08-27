(Policy SocialPolicy3 uses SocialMediaVocab
  (Target)
  (Rules
    (PermitFamilyOverride = (Permit s a r) :-
        (ReadPost a) (Owns s r) (MemberOf s Family) (SharedWith r Family))

    (PermitFriendsOnly = (Permit s a r) :-
        (ReadPost a) (Owns s r) (MemberOf s Friends) (!MemberOf s Coworkers) (SharedWith r Friends))

    (DenyAllOtherCoworkers = (Deny s a r) :-
        (ReadPost a) (Owns s r) (MemberOf s Coworkers) (!MemberOf s Family)))
  (RComb FAC)
  (PComb FAC)
  (Children))