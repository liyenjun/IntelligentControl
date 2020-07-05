function PI=GA_fuzzy_fitfun(chro)

global MIN_offset k1 k2 y reference t

k1=chro(1);
k2=chro(2);

e1=chro(3);
e2=chro(4);
e3=chro(5);

de1=chro(6);
de2=chro(7);
de3=chro(8);

u1=chro(9);
u2=chro(10);
u3=chro(11);

r1=chro(12);
r2=chro(13);
r3=chro(14);
r4=chro(15);
r5=chro(16);
r6=chro(17);
r7=chro(18);
r8=chro(19);
r9=chro(20);

fuzzy_controller_parameter(e1,e2,e3,de1,de2,de3,u1,u2,u3,r1,r2,r3,r4,r5,r6,r7,r8,r9);

sim_out = sim('motor');

y = sim_out.get('y');
reference = sim_out.get('reference');
t = sim_out.get('t');
z=sum(abs((reference/400-y/400))/2);

PI=MIN_offset-z;

    

