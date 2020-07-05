clear;clc;
global Kp Ki Kd t yy u
iterations = 100;
c1 = 1.5;
c2 = 2.0;
swarm_size = 64;
index = 1;

for i = 1:swarm_size
    swarm(index, 1, 1) = 15*rand;
    swarm(index, 1, 2) = 15*rand;
    swarm(index, 1, 3) = 15*rand;
    index = index +1;
end

swarm(:, 4, 1) = 10000;
swarm(:, 2, :) = rand;

for iter = 1:iterations
    for i = 1:swarm_size
        particle(1) = swarm(i, 1, 1);
        particle(2) = swarm(i, 1, 2);
        particle(3) = swarm(i, 1, 3);
        PBPI(iter, i) = PSO_fitfun_EXPID1(particle);
        
        if PBPI(iter,i) < swarm(i, 4, 1)
            swarm(i, 3, 1) = swarm(i, 1, 1);
            swarm(i, 3, 2) = swarm(i, 1, 2);
            swarm(i, 3, 3) = swarm(i, 1, 3);
            swarm(i, 4, 1) = PBPI(iter, i);
        end
    end
    
    [gbest, indexmin] = min(swarm(:, 4, 1));
    minval(iter)=gbest;
    minparticle(iter)=indexmin;
    w = 0.9-(0.9-0.4)*iter/100;
    
    for i = 1:swarm_size
        swarm(i, 2, 1) = w*swarm(i, 2, 1) +...
            c1*rand*(swarm(i, 3, 1) - swarm(i, 1, 1)) +...
            c2*rand*(swarm(indexmin, 3, 1) - swarm(i, 1, 1));
        swarm(i, 2, 2) = w*swarm(i, 2, 2) +...
            c1*rand*(swarm(i, 3, 2) - swarm(i, 1, 2)) +...
            c2*rand*(swarm(indexmin, 3, 2) - swarm(i, 1, 2));
        swarm(i, 2, 3) = w*swarm(i, 2, 3) +...
            c1*rand*(swarm(i, 3, 3) - swarm(i, 1, 3)) +...
            c2*rand*(swarm(indexmin, 3, 3) - swarm(i, 1, 3));        
    end
    
    for i = 1:swarm_size
        swarm(i, 1, 1) = swarm(i, 1, 1) + swarm(i, 2, 1);
        swarm(i, 1, 2) = swarm(i, 1, 2) + swarm(i, 2, 2);
        swarm(i, 1, 3) = swarm(i, 1, 3) + swarm(i, 2, 3);
        
        for k = 1:3
            if swarm(i,1,k)<0
                swarm(i, 1, k) = 0;
            end
            if swarm(i,1,k)>15
                swarm(i, 1, k) = 15;
            end
        end
    end
    
    figure(1)
    plot3(swarm(:, 1, 1), swarm(:, 1, 2), swarm(:, 1, 3),...
        '*','MarkerSize',10)
    axis([0 15 0 15 0 15]);
    xlabel('Kp')
    ylabel('Ki')
    zlabel('Kd')
    drawnow
end

figure(2)

ttt=1:iterations;

plot(ttt,minval,'*-')

title('Minimum of PI=sum(abs(200*(1-y(I)))')
xlabel('iterations')
ylabel('gbest')

Kp=swarm(i, 3, 1)
Ki=swarm(i, 3, 2)
Kd=swarm(i, 3, 3)

figure(3)
sim('PIDPSO');
plot(t,yy)
title('step response')
xlabel('time')
ylabel('yy(t)')

figure(4)
plot(t,u)
title('control energy')
xlabel('time')
ylabel('u')
    
    