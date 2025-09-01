#lang margrave

LOAD POLICY "/app/test1.p";
LOAD POLICY "/app/test2.p";

EXPLORE TestPolicy1:permit(s, a, r);
SHOW ONE;

EXPLORE TestPolicy2:permit(s, a, r);
SHOW ONE;

COMPARE TestPolicy1 TestPolicy2;
SHOW ONE;