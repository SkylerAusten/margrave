#lang margrave

LOAD POLICY "/app/social1.p";
LOAD POLICY "/app/social2.p";
LOAD POLICY "/app/social3.p";
LOAD POLICY "/app/social4.p";

COMPARE SocialPolicy1 SocialPolicy2;
SHOW ONE;

COMPARE SocialPolicy1 SocialPolicy3;
SHOW ONE;

COMPARE SocialPolicy1 SocialPolicy4;
SHOW ONE;

COMPARE SocialPolicy2 SocialPolicy3;
SHOW ONE;

COMPARE SocialPolicy2 SocialPolicy4;
SHOW ONE;

COMPARE SocialPolicy3 SocialPolicy4;
SHOW ONE;

// EXPLORE conferencepolicy1:permit(s, a, r);
// SHOW ONE;