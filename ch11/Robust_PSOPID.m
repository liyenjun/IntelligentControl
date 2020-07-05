clear;clc;
global Kp Ki Kd t yy aa bb cc u
%Parameters
iterations = 50;
w_max=0.9;
w_min=0.4;

c1_max = 2;
c1_min = 1.5;

c2_max = 2;
c2_min = 1.5;

swarm_size = 30;

for i = 1:swarm_size
    swarm(i, 1, 1) = rand()*30;
    swarm(i, 1, 2) = rand()*30;
    swarm(i, 1, 3) = rand()*30;
end

swarm(:, 4, 1) = 100000;
swarm(:, 3, :) = 0;
swarm(:, 2, :) = rand;

for iter = 1:iterations
    
    %Plotting the swarm
    figure(1)    
    plot3(swarm(:, 1, 1), swarm(:, 1, 2), swarm(:, 1, 3),...
        'b*','Markersiz',8)
    xlabel('Kp')
    ylabel('Ki')
    zlabel('Kd')
    axis([0, 30, 0, 30, 0, 30]);
    drawnow
    
    for i = 1:swarm_size
        PI_real(1)=swarm(i, 1, 1);
        PI_real(2)=swarm(i, 1, 2);
        PI_real(3)=swarm(i, 1, 3);
        PI(iter,i)=Robust_PSOPID_PI(PI_real);
        
        if PI(iter,i) < swarm(i, 4, 1)            
            swarm(i, 3, 1) = swarm(i, 1, 1);
            swarm(i, 3, 2) = swarm(i, 1, 2);
            swarm(i, 3, 3) = swarm(i, 1, 3);
            swarm(i, 4, 1) = PI(iter,i);
        end
    end
        
    [gbest, gbest_pos] = min(swarm(:, 4, 1));
    
    gbest_PI_iteration(iter)=gbest;
    %---updating velocity vectors
    for i = 1:swarm_size
        w=w_max-((w_max-w_min)*iter)/iter;
        c1 = c1_max-((c1_max-c1_min)*iter)/iter;
        c2 = c2_max-((c2_max-c2_min)*iter)/iter;
        
        swarm(i,2,1)=w*swarm(i,2,1) + ...
            c1*rand*(swarm(i, 3, 1) - swarm(i, 1, 1)) + ...
            c2*rand*(swarm(gbest_pos, 3, 1) - swarm(i, 1, 1));
        swarm(i,2,2)=w*swarm(i,2,2) + ...
            c1*rand*(swarm(i, 3, 2) - swarm(i, 1, 2)) + ...
            c2*rand*(swarm(gbest_pos, 3, 2) - swarm(i, 1, 2));
        swarm(i,2,3)=w*swarm(i,2,3) + ...
            c1*rand*(swarm(i, 3, 3) - swarm(i, 1, 3)) + ...
            c2*rand*(swarm(gbest_pos, 3, 3) - swarm(i, 1, 3));        
        
        swarm(i, 1, 1) =swarm(i, 1, 1) + swarm(i, 2, 1);
        swarm(i, 1, 2) =swarm(i, 1, 2) + swarm(i, 2, 2);
        swarm(i, 1, 3) =swarm(i, 1, 3) + swarm(i, 2, 3);
        
        for swarm_dim = 1:3
            if swarm(i, 1, swarm_dim)<0
                swarm(i, 1, swarm_dim)=0;
            end
            if swarm(i, 1, swarm_dim)>30
                swarm(i, 1, swarm_dim)=30;
            end
        end
    end
end
        
Kp = swarm(gbest_pos, 3, 1);
Ki = swarm(gbest_pos, 3, 2);
Kd = swarm(gbest_pos, 3, 3);

figure(2)
aa=6;
bb=3;
cc=4;
sim('Robust_PID');
subplot(2,2,1)
plot(t,yy)
title('aa=6, bb=3, cc=4')
xlabel('time')
ylabel('y')


aa=8+2*(rand-0.5)*2;
bb=5+2*(rand-0.5)*2;
cc=6+2*(rand-0.5)*2;
sim('Robust_PID');
subplot(2,2,2)
plot(t,yy)
title('random')
xlabel('time')
ylabel('y')

aa=8;
bb=5;
cc=6;
sim('Robust_PID');
subplot(2,2,3)
plot(t,yy)
title('aa=8, bb=5, cc=6')
xlabel('time')
ylabel('y')

aa=10;
bb=7;
cc=8;
sim('Robust_PID');
subplot(2,2,4)
plot(t,yy)
title('aa=10, bb=7, cc=8')
xlabel('time')
ylabel('y')

figure(3)
aa=6;
bb=3;
cc=4;
sim('Robust_PID');
subplot(2,2,1)
plot(t,u)
title('aa=6, bb=3, cc=4')
xlabel('time')
ylabel('u')

aa=8+2*(rand-0.5)*2;
bb=5+2*(rand-0.5)*2;
cc=6+2*(rand-0.5)*2;
sim('Robust_PID');
subplot(2,2,2)
plot(t,u)
title('random')
xlabel('time')
ylabel('u')

aa=8;
bb=5;
cc=6;
sim('Robust_PID');
subplot(2,2,3)
plot(t,u)
title('aa=8, bb=5, cc=6')
xlabel('time')
ylabel('u')

aa=10;
bb=7;
cc=8;
sim('Robust_PID');
subplot(2,2,4)
plot(t,u)
title('aa=10, bb=7, cc=8')
xlabel('time')
ylabel('u')

figure(4)
ttt=1:iterations;
plot(ttt, gbest_PI_iteration,'*-')
title('Minimum of PI=sum(abs100*(1-y(I)))')
xlabel('iterationss')
ylabel('PI')
