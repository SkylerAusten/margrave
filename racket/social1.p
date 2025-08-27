(Policy SocialPolicy1 uses SocialMediaVocab
  (Target)
  (Rules
    (FamilyView = (Permit s a r) :-
                  (FamilyOf s u) (Owns u r) (ReadPost a) (Post r))

    (FriendView = (Permit s a r) :-
                  (FriendOf s u) (Owns u r) (ReadPost a) (Post r) (!CoworkerOf s u))

    (CoworkerBlock = (Deny s a r) :-
                     (CoworkerOf s u) (Owns u r) (ReadPost a) (Post r)))
  (RComb FAC)
  (PComb FAC)
  (Children))
