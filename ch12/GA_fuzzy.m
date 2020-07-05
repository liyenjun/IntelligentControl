clc;clear;%warning off;

global MIN_offset k1 k2 y reference t
MIN_offset=10^10;

popu_size=10;
bit_length=40;
gene_no=20;
generation_no=30;
crossover_rate=0.7;
mutate_rate=0.04;
elite=1;
fitfun='GA_fuzzy_fitfun';
range=[0 0 -10 -10  0 -0.1 -0.1   0 -25 -25  0 1 1 1 1 1 1 1 1 1;
       5 5   0  10 10    0  0.1 0.1   0  25 25 3 3 3 3 3 3 3 3 3];

 [popu, popu_real, fitness, upper, average, lower, BEST_popu]...
        = GA_genetic(popu_size, bit_length, gene_no, range, fitfun,...
                        generation_no, crossover_rate, mutate_rate, elite);

minfitness=MIN_offset-upper;
[minium_f,generation]=min(minfitness);
minium_chro=BEST_popu(generation,:);

k1=minium_chro(1)
k2=minium_chro(2)

e1=minium_chro(3)
e2=minium_chro(4)
e3=minium_chro(5)

de1=minium_chro(6)
de2=minium_chro(7)
de3=minium_chro(8)

u1=minium_chro(9)
u2=minium_chro(10)
u3=minium_chro(11)

r1=round(minium_chro(12))
r2=round(minium_chro(13))
r3=round(minium_chro(14))
r4=round(minium_chro(15))
r5=round(minium_chro(16))
r6=round(minium_chro(17))
r7=round(minium_chro(18))
r8=round(minium_chro(19))
r9=round(minium_chro(20))

fuzzy_controller_parameter(e1,e2,e3,de1,de2,de3,u1,u2,u3,...
    r1,r2,r3,r4,r5,r6,r7,r8,r9);
mfedit(fuzzy_controller)

figure(1)
ttt=1:generation_no;
plot(ttt,minfitness,'*-')
title('Minimum of PI=sum(abs((reference/400-y/400))/2','Fontsize',9)
xlabel('generation')
ylabel('PI')

figure(2)
sim_out=sim('motor');
y=sim_out.get('y');
reference=sim_out.get('reference');
t=sim_out.get('t');
plot(t,y,t,reference)
axis([0 20 0 6000])