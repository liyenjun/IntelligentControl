clear;clc;
x = 0:0.01:12;
y=3*sin(0.5*x);
plot(x,y)

x(1) = 4;
for i = 1:1000
    dy(i)=1.5*cos(0.5*x(i));
    if abs(dy(i))<=0.0001
        n=i
        xx=x(i)
        yy=y(i-1)
        dyy=dy(i)
        break
    else
        x(i+1)=x(i)-0.1*dy(i);
        y(i)=3*sin(0.5*x(i));
    end
end