function PI=GA_fitfun_EXPID2(chro)
global MIN_offset Kp Ki Kd t y aa bb cc
MIN_offset=29999;

Kp=chro(1);
Ki=chro(2);
Kd=chro(3);
aa=380;
bb=25;
cc=190;
sim('PID2');

I = find(t>3);              %Specs: settling time < 3 sec
z=sum(abs(100*(1-y(I))));   %Specs: steady-state error =0
if max(y)>1.2               %Specs: maximum overshoot < 20%
    z=z+1000;
end

PI=MIN_offset-z;
%**********************************************************
aa = 400 + 20*(rand-0.5)*2;
bb = 30  +  5*(rand-0.5)*2;
cc = 200 + 10*(rand-0.5)*2;
sim('PID2');
I = find(t>3);              %Specs: settling time < 3 sec
z=sum(abs(100*(1-y(I))));   %Specs: steady-state error=0
if max(y)>1.2               %Specs: maximum overshoot < 20%
    z=z+1000;
end
%**********************************************************
aa = 400;
bb = 30;
cc = 200;
sim('PID2');
I = find(t>3);              %Specs: settling time < 3 sec
z=sum(abs(100*(1-y(I))));   %Specs: steady-state error=0
if max(y)>1.2               %Specs: maximum overshoot < 20%
    z=z+1000;
end
%**********************************************************
aa = 420;
bb = 35;
cc = 200;
sim('PID2');
I = find(t>3);              %Specs: settling time < 3 sec
z=sum(abs(100*(1-y(I))));   %Specs: steady-state error=0
if max(y)>1.2               %Specs: maximum overshoot < 20%
    z=z+1000;
end
%**********************************************************
PI=MIN_offset-z;