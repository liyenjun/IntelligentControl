clear;clc;
%Initialization
%Parameters
iterations = 80;
w = 0.5;
c1 = 2.0;
c2 = 2.0;
swarm_size = 49;

index = 1;
for a = 1:7
    for b = 1:7
        i = a*rand(1);
        j = b*rand(1);
        swarm(index, 1, 1) = i;
        swarm(index, 1, 2) = j;
        index = index + 1;
    end
end

swarm(:, 2, :) = rand;
swarm(:, 3, 1) = 0;
swarm(:, 3, 2) = 0;
swarm(:, 4, 1) = 100000000000;

%Iterations
for iter = 1 : iterations
    clf
    
    figure(1)
    plot(swarm(:, 1, 1), swarm(:, 1, 2), '+', ...
        'MarkerSize', 8, 'LineWidth', 3)
    
    axis([-20 10 -20 10]);
    title('Minimum of f(x,y)=2*(5x + 50)^4 + 6*(3y +30)^4')
    xlabel('x')
    ylabel('y')
    
    for i = 1: swarm_size
        x = swarm(i, 1, 1);
        y = swarm(i, 1, 2);
        val = 2*(5*x + 50)^4 + 6*(3*y +30)^4;
    
        if val < swarm(i, 4, 1)
            swarm(i, 3, 1) = swarm(i, 1, 1);
            swarm(i, 3, 2) = swarm(i, 1, 2);
            swarm(i, 4, 1) = val;
        end
    end
    
    [gbest_val, gbest] = min(swarm(:, 4, 1));
    minval(iter) = gbest_val;
    
    for i = 1: swarm_size
        swarm(i, 2, 1) = rand*w*swarm(i, 2, 1) + ...
            c1*rand*(swarm(i, 3, 1) - swarm(i, 1, 1)) + ...
            c2*rand*(swarm(gbest, 3, 1) - swarm(i, 1, 1));

        swarm(i, 2, 2) = w*swarm(i, 2, 2) + ...
            c1*rand*(swarm(i, 3, 2) - swarm(i, 1, 2)) + ...
            c2*rand*(swarm(gbest, 3, 2) - swarm(i, 1, 2));        
    end
    
    for i = 1:swarm_size
        swarm(i, 1, 1) = swarm(i, 1, 1) + swarm(i, 2, 1);
        swarm(i, 1, 2) = swarm(i, 1, 2) + swarm(i, 2, 2);
    end
end

figure(2)
t=1:iterations;
plot(t,minval,'*-')
title('Minimum of f(x,y)=2*(5x + 50)^4 + 6*(3y +30)^4')
xlabel('x')
ylabel('y')