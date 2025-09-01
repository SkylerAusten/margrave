(Policy TestPolicy1 uses TestVocab
    (Target )
    (Rules
        ; Rule to allow a user to create a post they own.
        (OwnerCanCreate = (Permit s1 s2 a r) :- (Owns s1 r) (CreatePost a) (Post r))

        ; Rule to allow a user to read a post they own.
        (OwnerCanRead = (Permit s1 s2 a r) :- (Owns s1 r) (ReadPost a) (Post r))
    )
    (RComb FAC)
    (PComb FAC)
    (Children )
)