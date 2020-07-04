%not work
clear;clc;
A1 = [0 1 0; 9.8 0 1;0 -10 -10];
A2 = [0 1 0; 0 0 1;0 -10 -10];
B1 = [0; 0; 10];
B2 = [0; 0; 20];
C1 = [1 0 0];
C2 = C1;

a=0.5;

setlmis([])
X = lmivar(1,[3 1]);
M1 = lmivar(2,[1 3]);
M2 = lmivar(2,[1 3]);

%%%%%%%%%%%%%%%%%%%%%% stability
%-X*A'(i)-A(i)*X+B(i)*M+M*B(i)=2aX>0

%i=1
lmiterm([-1 1 1 X],-1,A1','s');%-X*A1'-A1*X
lmiterm([-1 1 1 M1],B1,1,'s');%B1*M1+M1'*B1'
lmiterm([-1 1 1 X],-2*a,1);%-2aX

%i=2
lmiterm([-2 1 1 X],-1,A2','s');%-X*A2-A2'*X
lmiterm([-1 1 1 M2],B2,1,'s');%B2M2+M2'*B2'
lmiterm([-1 1 1 X],-2*a,1);%-2aX

%-X*A(i)'-A(i)*X-X*A(j)*X+M(j)'*B(i)'+B(i)*M(j)+M(i)'*B(j)'+B(j)*M(i)-4aX>0
%(i<j)

%i=1,j=2
lmiterm([-3 1 1 X],-1,A1','s');%-X*A1'-A1*X
lmiterm([-3 1 1 X],-1,A2','s');%-X*A2'-A2*X
lmiterm([-3 1 1 M2],B1,1,'s');%B1*M2+M2'*B1'
lmiterm([-3 1 1 M1],B2,1','s');%B2*M1+M1'*B2'
lmiterm([-3 1 1 X],-4*a,1);%-4aX
lmiterm([-4 1 1 X],1,1);%X>0

X=dec2mat(lmi_3_8_3,xfeas,X);
M1=dec2mat(lmi_3_8_3,xfeas,M1);
M2=dec2mat(lmi_3_8_3,xfeas,M2);
P=inv(X)
eig(P)
F1=M1*inv(X)
F2=M2*inv(X)