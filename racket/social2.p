(Policy SocialPolicy2 uses SocialMediaVocab
  (Target)
  (Rules
    (FamilyRule = (Permit s a r) :-
                  (FamilyOf s u) (Owns u r) (ReadPost a) (Post r))

    (FriendRule = (Permit s a r) :-
                  (FriendOf s u) (Owns u r) (ReadPost a) (Post r))

    (CoworkerRule = (Deny s a r) :-
                    (CoworkerOf s u) (Owns u r) (ReadPost a) (Post r)))
  (RComb O Deny Permit)
  (PComb O Deny Permit)
  (Children))
