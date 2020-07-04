clear;clc;
popu_size=8;
bit_length=12;
gene_number=1;
initpopu=GA_initpopu(popu_size,bit_length,gene_number);

popu = initpopu;
range=[0;10];
[fitness, popu_real, popu]= GA_fitpopu(popu,bit_length,range,'GA_fitfun1')