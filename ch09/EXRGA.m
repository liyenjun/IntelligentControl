clear;clc;
popu_size=200;
gene_no=2;
range=[-1 -2; 1 2];
fitfun='RGA_fitfun';
generation_no=100;
crossover_rate=0.8;
mutate_rate=0.08;
elite=1;

global MIN_offset

[popu,fitness,upper,average,lower,BEST_popu]...
    =RGA_genetic(popu_size,gene_no,range,fitfun,...
    generation_no,crossover_rate,mutate_rate,elite);

minfitness=MIN_offset-upper;
[minimum_f,generation]=min(minfitness)
minimum_x_y=BEST_popu(generation, :)

figure(1)
tt=1:generation_no;
plot(tt,minfitness,'*:')
title('Minmum of f(x)=5+x^2+y^2')
ylabel('f(x)')
xlabel('Generation')