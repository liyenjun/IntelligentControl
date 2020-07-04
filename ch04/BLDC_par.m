clear;clc;
R = 2;
L =0.5;
Km = 0.1;
Kb = 0.2;
J = 0.02;
Kf = Km;

A = [-R/L -Kb/L; Km/J -Kf/J];
B = [1/L; 0];
C = [0 1];
D = [0];