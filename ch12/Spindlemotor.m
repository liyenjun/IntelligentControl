clear;clc;
%Numberator
num=[213800];
%Denominator
den=[1 9593 2654];
%Trandfer Function
spinmotor = tf(num, den)

%Plot the bode plot
bode(spinmotor),grid