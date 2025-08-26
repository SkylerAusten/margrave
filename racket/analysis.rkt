#lang margrave

LOAD POLICY "tests/conference1.p";
LOAD POLICY "tests/conference2.p";

EXPLORE conferencepolicy1:permit(s, a, r);
SHOW ONE;