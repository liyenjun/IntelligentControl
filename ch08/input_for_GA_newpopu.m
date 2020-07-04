clear;clc;
popu=[1 1 1 1 0 1 0 1 1 0 0 1; 
    1 1 1 0 1 1 1 0 0 0 1 0;
    1 0 1 1 1 1 0 0 0 0 1 0;
    0 1 0 1 1 0 1 0 0 0 0 1;
    0 1 0 1 0 0 1 0 0 0 0 1;
    0 0 1 0 0 1 0 0 1 1 1 0;
    0 0 0 1 0 1 0 1 1 1 1 0;
    0 0 1 0 0 0 0 0 0 1 1 0;];
fitness=[12 54 86 10 2 1.6 92 0.7];
bit_length=4;
crossover_rate=0.6;
mutate_rate=0.02;
elite=1;

new_popu = GA_newpopu(popu, fitness, bit_length, crossover_rate,mutate_rate, elite)