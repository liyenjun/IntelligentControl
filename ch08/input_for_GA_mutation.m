clear;clc;
popu = [ 1 1 1 1 0 1 0 1 1 0 0 1;
        1 1 1 0 1 1 1 0 0 0 1 0;
        1 0 1 1 1 1 0 0 0 0 1 0;
        0 1 0 1 1 0 1 0 0 0 0 1;
        0 1 0 1 0 0 1 0 0 0 0 1;
        0 0 1 0 0 1 0 0 1 1 1 0;
        0 0 1 0 0 0 0 0 0 1 1 0;
        0 0 0 1 0 1 0 1 1 1 1 0;]
bit_length = 4;
mutate_rate = 0.04;
new_popu = GA_mutation(popu, bit_length, mutate_rate);