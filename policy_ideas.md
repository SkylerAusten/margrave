# Social Media Account Control Policy
## Natural Language Context
On a social media platform, users can share posts with different groups: their friends, their workplace network, or their school alumni network.

## Vocabulary
```
(PolicyVocab SocialMediaPolicy
  (Types
    (Subject : User Friend Coworker Alumni Moderator)
    (Action : CreatePost ReadPost DeletePost)
    (Resource : Post)
  )
  (Decisions Permit Deny)
  (Predicates
    (Owns : User Post)
    (FriendOf : User User)
    (InWorkNetwork : User)
    (InAlumniNetwork : User)
    (RuleViolation : Post))
  (ReqVariables (s : Subject)
                (a : Action)
                (r : Resource))
  (OthVariables )
  (Constraints
    (disjoint-all Resource)
    (disjoint-all Action)
    (atmostone-all Action)
    (abstract Subject)
    (abstract Action)
    (abstract Resource)
    (nonempty Subject)
    (nonempty Resource)))

```

## Natural Language Policy
Users may share posts with friends but not coworkers, even if those coworkers are also friends.

## Policy 1
```
// Deny first
(Policy SocialMediaPolicy1 uses SocialMediaPolicy
  (Target )
  (Rules
    (FriendAccess = (Permit s a r) :- (FriendOf s u) (Owns u r) (ReadPost a) (!InWorkNetwork s))
    (ModeratorDelete = (Permit s a r) :- (Moderator s) (DeletePost a) (RuleViolation r))
    (CoworkerDeny = (Deny s a r) :- (InWorkNetwork s) (ReadPost a) (Owns u r))
  )
  (RComb O Deny Permit)
  (PComb FAC)
  (Children ))
```



# Three Roles + "Special Individual" (Student + TA)
## Natural Language Context
At a university, students can submit assignments, TAs can grade assignments, and professors can assign grades.

## Vocabulary
```
(PolicyVocab UniversityPolicy
  (Types
    (Subject : Student TA Professor)
    (Action : SubmitAssignment GradeAssignment AssignFinalGrade)
    (Resource : Assignment GradeRecord)
  )
  (Decisions Permit Deny)
  (Predicates
    (Owns : Student Assignment)
    (AssignedTo : TA Assignment)
    (Submitted : Student Assignment)
    (DualRole : Student TA)) ; Special "Student-TA"
  (ReqVariables (s : Subject)
                (a : Action)
                (r : Resource))
  (OthVariables )
  (Constraints
    (disjoint-all Resource)
    (disjoint-all Action)
    (atmostone-all Action)
    (abstract Subject)
    (abstract Action)
    (abstract Resource)
    (nonempty Subject)
    (nonempty Resource)))
```

## Natural Language Policy
Students may submit assignments. TAs may grade assignments. Professors may assign final grades. If a person is both a student and a TA, they may grade others’ assignments but not their own.

# Temporal Access Control (Building Access) 
## Natural Language Context
In an office building, employees, security staff, and visitors are able to enter and exit the company building.

## Vocabulary
```
(PolicyVocab BuildingAccessPolicy
  (Types
    (Subject : Employee Security Visitor)
    (Action : Enter Exit)
    (Resource : Building)
  )
  (Decisions Permit Deny)
  (Predicates
    (BusinessHours : Action)
    (GuestPass : Visitor)
    (Day : Resource) ; Encodes day/time for constraint
  )
  (ReqVariables (s : Subject)
                (a : Action)
                (r : Resource))
  (OthVariables )
  (Constraints
    (disjoint-all Resource)
    (disjoint-all Action)
    (atmostone-all Action)
    (abstract Subject)
    (abstract Action)
    (abstract Resource)
    (nonempty Subject)
    (nonempty Resource)))
```

## Natural Language Policy
Employees can enter/exit during business hours on weekdays. Security can always enter/exit. Visitors can only enter with a guest pass, and only during business hours.  All employees and visitors must exit before close of business.

# Phased Access (Job Applications)
## Natural Language Context
In a job application system there are applicants, application reviewers who are employees at the company, and a hiring manager.

## Vocabulary
```
(PolicyVocab HiringProcessPolicy
  (Types
    (Subject : Applicant Reviewer Manager)
    (Action : SubmitApplication ReadApplication ExtendOffer)
    (Resource : Application Offer)
  )
  (Decisions Permit Deny)
  (Predicates
    (BeforeDeadline : Application)
    (AfterDeadline : Application)
    (AfterReviewPhase : Application)
    (Submitted : Applicant Application)
    (Reviewed : Reviewer Application))
  (ReqVariables (s : Subject)
                (a : Action)
                (r : Resource))
  (OthVariables )
  (Constraints
    (disjoint-all Resource)
    (disjoint-all Action)
    (atmostone-all Action)
    (abstract Subject)
    (abstract Action)
    (abstract Resource)
    (nonempty Subject)
    (nonempty Resource)))
```

## Natural Language Policy
Applicants can submit applications before the deadline. Reviewers may read applications only after the deadline. Managers may extend offers only after the review phase.