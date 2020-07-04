clear;clc;
figure(1);
x = -10:0.1:50;
%we have two membership functions "cold" and "hot"
y = zmf(x,[5 20]);%"cold" membership function
plot(x,y,'b','LineWidth',2)%color and width of line
hold on
y = smf(x,[25 40]);%"hot" membership function
plot(x,y,'r','LineWidth',2)%coloe and width of line
%add the title and lable
title('Primary Linguistic Values')
xlabel('X=temperature')
ylabel('Membership Grades')
%add text beside the function
text(5,0.8,'cold')
text(38,0.8,'hot')
xlim([-10 50])
ylim([-0.02 1.05])
