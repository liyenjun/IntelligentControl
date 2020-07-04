clc;clear;
x = 0:0.1:100;
y = gaussmf(x,[20 50]);
plot(x,y,'m+','linewidth',2);
xlabel('Generalized bell MF')
grid on
