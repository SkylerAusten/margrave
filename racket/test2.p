(Policy TestPolicy2 uses TestVocab
    (Target )
    (Rules
        ; A user can always read their own posts.
        (OwnerRead = (Permit s a r) :- (Owns s r) (ReadPost a) (Post r))

        ; A user can read a post if it has been shared with them.
        (SharedRead = (Permit s a r) :- (SharedWith r s) (ReadPost a) (Post r))
    )
    (RComb FAC)
    (PComb FAC)
    (Children )
)