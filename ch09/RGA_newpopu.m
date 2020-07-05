function new_popu=RGA_newpopu(popu,fitness,...
    crossover_rate,mutate_rate,elite,range)
new_popu=popu;
popu_n=size(popu,1);
gene_number=size(popu,2);

if elite==1
    tmp_fitness=fitness;
    [max1,index1]=max(tmp_fitness);
    tmp_fitness(index1)=min(tmp_fitness);
    [max2,index2]=max(tmp_fitness);
end

fitness_rate=fitness/sum(fitness);
fitness_rate_cum=cumsum(fitness_rate);

for i = 1:popu_n/2
    tmp = find(fitness_rate_cum > rand);
    parent1 = popu(tmp(1), :);
    tmp = find(fitness_rate_cum > rand);
    parent2 = popu(tmp(1), :);
    if rand < crossover_rate
        for J=1:gene_number
            new_popu(i*2-1,J)=parent1(J)+1.5*rand*(parent2(J)-parent1(J));
            new_popu(i*2,J)=parent2(J)+1.5*rand*(parent1(J)-parent2(J));
        end
    end
end

for i=1:popu_n
    for j=1:gene_number
        if rand <= mutate_rate
            new_popu(i,j)=range(1,j)+rand*(range(2,j)-range(1,j));
        end
    end
end

if elite==1
    new_popu([1:2], :)=popu([index1 index2], :);
end