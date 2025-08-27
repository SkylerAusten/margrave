(Policy SocialPolicy4 uses SocialMediaVocab
  (Target)
  (Rules
    ;; Family members can always view
    (FamilyPermit = (Permit s a r) :-
                    (CanViewAsFamily s r) (Owns u r) (ReadPost a) (Post r))

    ;; Friends can view, unless also coworkers
    (FriendPermit = (Permit s a r) :-
                    (CanViewAsFriend s r) (Owns u r) (ReadPost a) (Post r))

    ;; Explicit coworker block — overrides friend view
    (CoworkerDeny = (Deny s a r) :-
                    (CanViewAsCoworker s r) (Owns u r) (ReadPost a) (Post r)))
  
  ;; Deny overrides ensures coworkers cannot see, 
  ;; even if friend or family rules would permit
  (RComb O Deny Permit)
  (PComb O Deny Permit)
  (Children))
