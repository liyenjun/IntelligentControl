clear;clc;
A1 = [0 -1 0; 1 0 0; 0 0 0];
A2 = [0 0 0; 0 0 0.01; 0 0 0];
A3 = [0 1 0; -1 0 0; 0 0 0];
A4 = [0 -1 0; 1 0 1; 0 0 0];
A5 = [0 0 0; 0 0 1; 0 0 0];
A6 = [0 10 0; -1 0 1; 0 0 0];

B1 = [-1 0; 0 0; 0 -1];
B2 = [-1 0; 0 0; 0 -1];
B3 = [-1 0; 0 0; 0 -1];
B4 = [-1 0; 0 0; 0 -1];
B5 = [-1 0; 0 0; 0 -1];
B6 = [-1 0; 0 0; 0 -1];

%i=1
lmiterm([-1 1 1 X],-A1,1,'S');
lmiterm([-1 1 1 M1],B1,1,'S');
%i=2
lmiterm([-2 1 1 X],-A2,1,'S');
lmiterm([-2 1 1 M2],B2,1,'S');
%i=3
lmiterm([-3 1 1 X],-A3,1,'S');
lmiterm([-3 1 1 M1],B3,1,'S');
%i=4
lmiterm([-4 1 1 X],-A4,1,'S');
lmiterm([-4 1 1 M1],B4,1,'S');
%i=5
lmiterm([-5 1 1 X],-A5,1,'S');
lmiterm([-5 1 1 M1],B5,1,'S');
%i=6
lmiterm([-6 1 1 X],-A6,1,'S');
lmiterm([-6 1 1 M1],B6,1,'S');

%i=1,j=2
lmiterm([-9 1 1 X],-1,A1','S');%i
lmiterm([-9 1 1 X],-1,A2','S');%j
lmiterm([-9 1 1 M2],B1,1','S');%j i
lmiterm([-9 1 1 M1],B2,1','S');%i j
%i=1,j=3
lmiterm([-10 1 1 X],-1,A1','S');%i
lmiterm([-10 1 1 X],-1,A3','S');%j
lmiterm([-10 1 1 M3],B1,1','S');%j i
lmiterm([-10 1 1 M1],B3,1','S');%i j
%i=1,j=4
lmiterm([-11 1 1 X],-1,A1','S');%i
lmiterm([-11 1 1 X],-1,A4','S');%j
lmiterm([-11 1 1 M4],B1,1','S');%j i
lmiterm([-11 1 1 M1],B4,1','S');%i j
%i=1,j=5
lmiterm([-12 1 1 X],-1,A1','S');%i
lmiterm([-12 1 1 X],-1,A5','S');%j
lmiterm([-12 1 1 M2],B1,1','S');%j i
lmiterm([-12 1 1 M1],B5,1','S');%i j
%i=1,j=6
lmiterm([-13 1 1 X],-1,A1','S');%i
lmiterm([-13 1 1 X],-1,A6','S');%j
lmiterm([-13 1 1 M2],B1,1','S');%j i
lmiterm([-13 1 1 M1],B6,1','S');%i j

X=dec2mat(lmi,xfeas,X);
M1=dec2mat(lmi,xfeas,M1);
M2=dec2mat(lmi,xfeas,M2);
M3=dec2mat(lmi,xfeas,M3);
M4=dec2mat(lmi,xfeas,M4);
M5=dec2mat(lmi,xfeas,M5);
M6=dec2mat(lmi,xfeas,M6);

P=inv(X)
eig(P)

F1=M1*P
F2=M2*P
F3=M3*P
F4=M4*P
F5=M5*P
F6=M6*P

figure(1);
plot(t,x(:,1),'b')
legend('LMI stable')
xlabel('ex(m)':ylabel('time(sec)');
hold on;
