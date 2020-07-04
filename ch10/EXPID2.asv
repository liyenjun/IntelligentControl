clear;clc;
global MIN_offset Kp Ki Kd t y aa bb cc

popu_size=30;
bit_length=40;
gene_no=3;
range=[0 0 0; 30 30 30];
fitfun='GA_fitfun_EXPID2';
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
aa=380;
bb=25;
cc=190;
sim('PID2');
subplot(2,2,1)
plot(t,y)
title('aa=380, bb=25, cc=190')
xlabel('time')
ylabel('y')
aa = 400 + 20*(rand-0.5)*2;
bb = 30  +  5*(rand-0.5)*2;
cc = 200 + 10*(rand-0.5)*2;
sim('PID2');
subplot(2,2,2)
plot(t,y)
title('random')
xlabel('time')
ylabel('y')
aa=400;
bb=30;
cc=200;
sim('PID2');
subplot(2,2,3)
plot(t,y)
title('aa=400, bb=30, cc=200')
xlabel('time')
ylabel('y')
aa = 420;
bb = 35;
cc = 210;
sim('PID2');
subplot(2,2,4)
plot(t,y)
title('aa=420, bb=35, cc=210')
xlabel('time')
ylabel('y')

figure(3)
aa = 380;
bb = 25;
cc = 190;
subplot(2,2,1)
plot(t,u)
title('aa=380, bb=25, cc=190')
xlabel('time')
ylabel('u')
figure(3)
aa = 400 + 20*(rand-0.5)*2;
bb = 30  +  5*(rand-0.5)*2;
cc = 200 + 10*(rand-0.5)*2;
subplot(2,2,2)
plot(t,u)
title('random')
xlabel('time')
ylabel('u')
figure(3)
aa = 400;
bb = 30;
cc = 200;
subplot(2,2,3)
plot(t,u)
title('aa=400, bb=30, cc=200')
xlabel('time')
ylabel('u')
figure(3)
aa = 420;
bb = 35;
cc = 210;
subplot(2,2,4)
plot(t,u)
title('aa=420, bb=35, cc=210')
xlabel('time')
ylabel('u')