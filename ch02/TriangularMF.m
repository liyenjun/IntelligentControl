clc;clear;
x = 0:0.1:100;
y = trimf(x,[15 70 85]);
plot(x,y,'g','linewidth',2);
xlabel('Triangular MF')
ylim([-0.05 1.05])
grid on