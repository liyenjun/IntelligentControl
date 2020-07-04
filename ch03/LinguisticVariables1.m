clear;clc;

figure(1);
x = -10:0.1:50;
y = smf(x,[20 30]);%membership function "more or less hot"
plot(x,y,'k','LineWidth',2)%color and width of line
hold on
y = smf(x,[35 45]);%membership function "extremely hot"
plot(x,y,'b','LineWidth',2)%coloe and width of line
hold on
y = gbellmf(x,[-10 3 20]);%"membership function "not hot and not cold"
plot(x,y,'b','LineWidth',2)%coloe and width of line
hold on
y = 0.6*gbellmf(x,[-3 1 7]);%"membership function "coldt but not too cold"
plot(x,y,'g','LineWidth',2)%coloe and width of line

%add the title and lable
title('Composite Linguistic Values')
xlabel('X=temperature')
ylabel('Membership Grades')
%add text beside the function
text(30,0.9,'more or less hot','FontSize',13)
text(41,0.6,'extremely hot','FontSize',13)
text(15,0.95,'not cold and not hot','FontSize',13)
text(-5,0.4,'cold but not too cold','FontSize',13)

xlim([-10 50])
ylim([-0.02 1.05])
