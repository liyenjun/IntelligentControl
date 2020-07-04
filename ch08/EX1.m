clear;clc;
%Find minimization of f(x)=cos(pi*x/2),0<=x<=4
%*********************************************
%Set input parameters
popu_size=70;
bit_length=40;
gene_no=1;
range=[0;4];
fitfcn='GA_fitfun_EX1';
generation_no=100;
crossover_rate=0.7;
mutate_rate=0.02;
elite=1;

%calling GA
[popu, popu_real, fitness, upper, average, lower, BEST_popu]...
        = GA_genetic(popu_size, bit_length, gene_no, range, fitfcn,...
                        generation_no, crossover_rate, mutate_rate, elite);

global MIN_offset
minfitness=MIN_offset-upper;
[minimum_f,generation]=min(minfitness)
minimum_x=BEST_popu(generation)

t=1:generation_no;
plot(t,minfitness,'*:')
title('Minimum of f(x)=cos(pi*x/2)')
xlabel('Generation')
ylabel('f(x)')