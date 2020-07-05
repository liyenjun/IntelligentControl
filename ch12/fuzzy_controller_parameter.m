function fuzzy_controller_parameter(e1,e2,e3,de1,de2,de3,u1,u2,u3,...
    r1,r2,r3,r4,r5,r6,r7,r8,r9)

r1=int8(r1);
r2=int8(r2);
r3=int8(r3);
r4=int8(r4);
r5=int8(r5);
r6=int8(r6);
r7=int8(r7);
r8=int8(r8);
r9=int8(r9);

if e2<e1
    e2=e1;
end
if e2>e3
    e2=e3;
end
if de2<de1
    de2=de1;
end
if de2>de3
    de2=de3;
end
if u2<u1
    u2=u1;
end
if u2>u3
    u2=u3;
end

%fuzzy
fuzzy_controller=newfis('controller');

fuzzy_controller.input(1).name='Error';
fuzzy_controller.input(1).range=[-20 20];
fuzzy_controller.input(1).mf(1).name='N';
fuzzy_controller.input(1).mf(1).type='trapmf';
fuzzy_controller.input(1).mf(1).params=[-10000 -9000 -10 e2];

fuzzy_controller.input(1).mf(2).name='Z';
fuzzy_controller.input(1).mf(2).type='trimf';
fuzzy_controller.input(1).mf(2).params=[e1 0 e3];
fuzzy_controller.input(1).mf(3).name='P';
fuzzy_controller.input(1).mf(3).type='trapmf';
fuzzy_controller.input(1).mf(3).params=[e2 10 9000 10000];


fuzzy_controller.input(2).name='ErrorDot';
fuzzy_controller.input(2).range=[-0.15 0.15];
fuzzy_controller.input(2).mf(1).name='N';
fuzzy_controller.input(2).mf(1).type='trapmf';
fuzzy_controller.input(2).mf(1).params=[-10000 -9000 -0.1 de2];

fuzzy_controller.input(2).mf(2).name='Z';
fuzzy_controller.input(2).mf(2).type='trimf';
fuzzy_controller.input(2).mf(2).params=[de1 0 de3];
fuzzy_controller.input(2).mf(3).name='P';
fuzzy_controller.input(2).mf(3).type='trapmf';
fuzzy_controller.input(2).mf(3).params=[de2 0.1 9000 10000];

fuzzy_controller.output(1).name='Output';
fuzzy_controller.output(1).range=[-30 30];
fuzzy_controller.output(1).mf(1).name='N';
fuzzy_controller.output(1).mf(1).type='trapmf';
fuzzy_controller.output(1).mf(1).params=[-10000 -9000 -25 u2];

fuzzy_controller.output(1).mf(2).name='Z';
fuzzy_controller.output(1).mf(2).type='trimf';
fuzzy_controller.output(1).mf(2).params=[u1 0 u3];
fuzzy_controller.output(1).mf(3).name='P';
fuzzy_controller.output(1).mf(3).type='trapmf';
fuzzy_controller.output(1).mf(3).params=[u2 25 9000 10000];

fuzzy_controller.rule(1).antecedent=[1 1];
fuzzy_controller.rule(1).consequent=[r1];
fuzzy_controller.rule(1).weight=1;
fuzzy_controller.rule(1).connection=1;

fuzzy_controller.rule(2).antecedent=[1 2];
fuzzy_controller.rule(2).consequent=[r2];
fuzzy_controller.rule(2).weight=1;
fuzzy_controller.rule(2).connection=1;
fuzzy_controller.rule(3).antecedent=[1 3];
fuzzy_controller.rule(3).consequent=[r3];
fuzzy_controller.rule(3).weight=1;
fuzzy_controller.rule(3).connection=1;

fuzzy_controller.rule(4).antecedent=[2 1];
fuzzy_controller.rule(4).consequent=[r4];
fuzzy_controller.rule(4).weight=1;
fuzzy_controller.rule(4).connection=1;
fuzzy_controller.rule(5).antecedent=[2 2];
fuzzy_controller.rule(5).consequent=[r5];
fuzzy_controller.rule(5).weight=1;
fuzzy_controller.rule(5).connection=1;

fuzzy_controller.rule(6).antecedent=[2 3];
fuzzy_controller.rule(6).consequent=[r6];
fuzzy_controller.rule(6).weight=1;
fuzzy_controller.rule(6).connection=1;
fuzzy_controller.rule(7).antecedent=[3 1];
fuzzy_controller.rule(7).consequent=[r7];
fuzzy_controller.rule(7).weight=1;
fuzzy_controller.rule(7).connection=1;

fuzzy_controller.rule(8).antecedent=[3 2];
fuzzy_controller.rule(8).consequent=[r8];
fuzzy_controller.rule(8).weight=1;
fuzzy_controller.rule(8).connection=1;
fuzzy_controller.rule(9).antecedent=[3 3];
fuzzy_controller.rule(9).consequent=[r9];
fuzzy_controller.rule(9).weight=1;
fuzzy_controller.rule(9).connection=1;

clc
assignin('base','fuzzy_controller',fuzzy_controller)