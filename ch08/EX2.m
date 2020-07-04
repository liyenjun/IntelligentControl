clear;clc;
popu_size=70;
bit_length=50;
gene_no=2;
range=[-6 -2; 6 2];
fitfun='GA_fitfun_EX2';
generation_no=150;
crossover_rate=0.7;
mutate_rate=0.02;
elite=1;

%calling GA
[popu, popu_real, fitness, upper, average, lower, BEST_popu]...
= GA_genetic(popu_size, bit_length, gene_no, range, fitfun,...
                        generation_no, crossover_rate, mutate_rate, elite);

[max1mum_f,generation]=max(upper)
maximum_x_y=BEST_popu(generation)

t=1:generation_no;
plot(t,upper,'*-')
title('Minimum of f(x,y)=33-(x^2+y^2)')
xlabel('Generation')
ylabel('f(x,y)')