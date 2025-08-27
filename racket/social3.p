(Policy SocialPolicy3 uses SocialMediaVocab
  (Target)
  (Rules
    (FamilyPermit = (Permit s a r) :-
                    (FamilyOf s u) (Owns u r) (ReadPost a) (Post r))

    (FriendPermit = (Permit s a r) :-
                    (FriendOf s u) (Owns u r) (ReadPost a) (Post r) (!CoworkerOf s u)))

  (RComb FAC)
  (PComb FAC)
  (Children))