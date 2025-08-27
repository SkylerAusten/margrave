(Policy SocialPolicy1 uses SocialMediaVocab
  (Target)
  (Rules
    (PostToFriendsOrFamily = (Permit s a r) :-
        (ReadPost a) (Owns s r) (MemberOf s Friends) (SharedWith r Friends))

    (PostToFamilyOverridesCoworker = (Permit s a r) :-
        (ReadPost a) (Owns s r) (MemberOf s Family) (SharedWith r Family))

    (CoworkersDenied = (Deny s a r) :-
        (ReadPost a) (Owns s r) (MemberOf s Coworkers) (!MemberOf s Family)))
  (RComb FAC)
  (PComb FAC)
  (Children))
