function PI = Robust_PSOPID_PI(PID)
global Kp Ki Kd t yy aa bb cc

Kp=PID(1);
Ki=PID(2);
Kd=PID(3);

aa=6;
bb=3;
cc=4;
sim('Robust_PID');
I=find(t>3);
z=sum(abs(100*(1-yy(I)))); %check
if max(yy)>1.30
    z=z+1000;
end

aa=8+2*(rand-0.5)*2;
bb=5+2*(rand-0.5)*2;
cc=6+2*(rand-0.5)*2;
sim('Robust_PID');
I=find(t>3);
z=z+sum(abs(100*(1-yy(I)))); %check
if max(yy)>1.30
    z=z+1000;
end

aa=8;
bb=5;
cc=6;
sim('Robust_PID');
I=find(t>3);
z=z+20*sum(abs(100*(1-yy(I)))); %check
if max(yy)>1.30
    z=z+1000;
end

aa=10;
bb=7;
cc=8;
sim('Robust_PID');
I=find(t>3);
z=z+sum(abs(100*(1-yy(I)))); %check
if max(yy)>1.30
    z=z+1000;
end
PI=z;