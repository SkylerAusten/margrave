#lang margrave

LOAD POLICY "conference1.p";
LOAD POLICY "conference2.p";

EXPLORE conferencepolicy1:permit(s, a, r);
SHOW ONE;