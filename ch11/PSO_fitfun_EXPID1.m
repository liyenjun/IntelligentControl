function PI=PSO_fitfun_EXPID1(particle)
global Kp Ki Kd t yy zz

Kp=particle(1);
Ki=particle(2);
Kd=particle(3);

sim('PIDPSO');

I = t>3;
zz = sum(abs(200*(1-yy(I))));

if max(yy)>1.2
    zz=zz+1000;
end

PI=zz;
