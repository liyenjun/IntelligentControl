x = linspace(-50, 30, 50);
y = linspace(-50, 30, 50);
[X, Y] = meshgrid(x, y)'
Z = 2.*(5.*X + 50).^4 + 6.*(3.*Y + 30).^4;
mesh(X, Y, Z);

title('f(x,y)=2*(5x + 50)^4 + 6*(3y + 30)^4')
xlabel('x')
ylabel('y')
zlabel('f(x,y)')