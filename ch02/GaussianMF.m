clc;clear;
x = 0:0.1:100;
y = gaussmf(x,[20 50]);
plot(x,y,'b*','linewidth',0.1);
xlabel('Gaussian MF')
grid on