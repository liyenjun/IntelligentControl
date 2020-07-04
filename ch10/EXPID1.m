clear;clc;
global MIN_offset Kp Ki Kd t y u

popu_size=20;
bit_length=40;
gene_no=3;
range=[0 0 0; 20 20 20];
fitfun='GA_fitfun_EXPID1';
generation_no = 30;
crossover_rate=0.8;
mutate_rate=0.02;
elite=1;

[popu, popu_real, fitness, upper, average, lower, BEST_popu]...
= GA_genetic(popu_size, bit_length, gene_no, range, fitfun,...
                        generation_no, crossover_rate, mutate_rate, elite);

minfitness=MIN_offset-upper;
[minium_f,generation]=min(minfitness)
minium_Kp_Ki_Kd=BEST_popu(generation,:);
Kp=minium_Kp_Ki_Kd(1)
Ki=minium_Kp_Ki_Kd(2)
Kd=minium_Kp_Ki_Kd(3)

figure(1)
ttt=1:generation_no;
plot(ttt,minfitness,'*-')
title('Minimum of PI=sum(abs(100*1-y(I)))')
xlabel('Generation')
ylabel('PI')

figure(2)
sim('PID1');
plot(t,y)
title('step response')
xlabel('time')
ylabel('y')

figure(3)
plot(t,u)
title('control energy')
xlabel('time')
ylabel('u')