clear;clc;
x = 0:0.001:1;
y=sin(pi*x)+0.5*sin(4*pi*x)+0.5*cos(10*pi*x);
plot(x,y)

x(1) = 0.8;
for i = 1:10000
    dy(i)=pi*cos(2*pi*x(i))+2*pi*cos(6*pi*x(i))-5*pi*sin(10*pi*x(i));
    if abs(dy(i))<=0.0001
        n=i
        xx=x(i)
        yy=y(i-1)
        dyy=dy(i)
        break
    else
        x(i+1)=x(i)-0.0001*dy(i);
        y(i)=sin(pi*x(i))+0.5*sin(4*pi)+0.5*cos(10*pi*x(i));
    end
end