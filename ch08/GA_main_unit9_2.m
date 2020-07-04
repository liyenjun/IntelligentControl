clear;clc;
popu=[0 0 0 1 0 0 1 0; 1 0 0 1 1 1 0 0];
bit_length=4;
range=[0 0;10 10];
[fitness,popu_real,popu]=GA_fitpopu(popu,bit_length,range,'GA_fitfun')