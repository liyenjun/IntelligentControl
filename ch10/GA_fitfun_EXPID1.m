function PI=GA_fitfun_EXPID1(chro)
global MIN_offset Kp Ki Kd t y
MIN_offset=9000;

Kp=chro(1);
Ki=chro(2);
Kd=chro(3);
sim('PID1');

I = find(t>3);              %Specs: settling time < 3 sec
z=sum(abs(100*(1-y(I))));   %Specs: steady-state error =0
if max(y)>1.2               %Specs: maximum overshoot < 20%
    z=z+1000;
end

PI=MIN_offset-z;
