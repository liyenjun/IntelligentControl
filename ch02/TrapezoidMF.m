clc;clear;
x = 0:0.1:100;
y = trapmf(x,[15 45 77 88]);
plot(x,y,'--r','linewidth',2);
xlabel('Trapezoid MF')
ylim([-0.05 1.05])
grid on