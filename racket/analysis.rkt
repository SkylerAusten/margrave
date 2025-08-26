#lang margrave

LOAD POLICY "/app/conference1.p";
LOAD POLICY "/app/conference2.p";

EXPLORE conferencepolicy1:permit(s, a, r);
SHOW ONE;