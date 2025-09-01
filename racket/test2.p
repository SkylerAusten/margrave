(Policy TestPolicy2 uses TestVocab
    (Target )
    (Rules
        ; A user can always read their own posts.
        (OwnerRead = (Permit s1 s2 a r) :- (Owns s1 r) (ReadPost a) (Post r))

        ; A user can read a post if it has been shared with them.
        (SharedRead = (Permit s1 s2 a r) :- (SharedWith r s2) (ReadPost a) (Post r))
    )
    (RComb FAC)
    (PComb FAC)
    (Children )
)