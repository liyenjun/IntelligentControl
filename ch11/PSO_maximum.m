clear;clc;
%Initialization
%Parameters
iterations = 100;
w = 1.0;
c1 = 2.0;
c2 = 2.0;
swarm_size = 25;

index = 1;
for i = 1:5
    for j = 1:5
        swarm(index, 1, 1) = i;
        swarm(index, 1, 2) = j;
        index = index + 1;
    end
end

swarm(:, 2, :) = rand;
swarm(:, 3, 1) = 0;
swarm(:, 3, 2) = 0;
swarm(:, 4, 1) = -1000;

%Iterations
for iter = 1 : iterations
    clf
    
    figure(1)
    plot(swarm(:, 1, 1), swarm(:, 1, 2), 'x', ...
        'MarkerSize', 10, 'LineWidth', 2)
    
    axis([-10 10 -10 10]);
    title('Maximum of f(x,y)=-(x-10)^2-(y-20)^2')
    xlabel('x')
    ylabel('y')
    
    for i = 1: swarm_size
        x = swarm(i, 1, 1);
        y = swarm(i, 1, 2);
        val = -(x-10)^2 - (y-20)^2;
        
        if val > swarm(i, 4, 1)
            swarm(i, 3, 1) = swarm(i, 1, 1);
            swarm(i, 3, 2) = swarm(i, 1, 2);
            swarm(i, 4, 1) = val;
        end
    end
    
    [gbest_val, gbest] = max(swarm(:, 4, 1));
    maxval(iter) = gbest_val;
    
    for i = 1: swarm_size
        swarm(i, 2, 1) = rand*w*swarm(i, 2, 1) + ...
            c1*rand*(swarm(i, 3, 1) - swarm(i, 1, 1)) + ...
            c2*rand*(swarm(gbest, 3, 1) - swarm(i, 1, 1));
        
        swarm(i, 2, 2) = rand*w*swarm(i, 2, 2) + ...
            c1*rand*(swarm(i, 3, 2) - swarm(i, 1, 2)) + ... %check
            c2*rand*(swarm(gbest, 3, 2) - swarm(i, 1, 2));        
    end
    
    for i = 1:swarm_size
        swarm(i, 1, 1) = swarm(i, 1, 1) + swarm(i, 2, 1);
        swarm(i, 1, 2) = swarm(i, 1, 2) + swarm(i, 2, 2);
    end
end

figure(2)
t=1:iterations;
plot(t,maxval,'*-')
title('Maximum of f(x,y)=-(x-10)^2-(y-20)^2')
xlabel('iterations')
ylabel('swarm best')
