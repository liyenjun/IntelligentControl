function [fitness, popu]=RGA_fitpopu(popu,fitfun)
popu_size=size(popu,1);
for I=1:popu_size
    fitness(I)=RGA_fiteach(popu(I,:),fitfun);
end

T=fitness;
[T index]=sort(T);
fitness=T;
popu=popu(index,:);