function new_popu=Arithmetic_Crossover(popu,crossover_rate)

new_popu=popu;
popu_n=size(popu,1);
gene_number=size(popu,2);
a=rand*1.5;

for i=1:popu_n/2
    p1=randi([1 popu_n]);
    p2=randi([1 popu_n]);
    while p1==p2
        p1=randi([1 popu_n]);
        p2=randi([1 popu_n]);
    end
    
    if rand<crossover_rate
        for j=1:gene_number
            new_popu(p1,j)=popu(p1,j)+a*(popu(p2,j)-popu(p1,j));
            new_popu(p2,j)=popu(p1,j)+a*(popu(p1,j)-popu(p2,j));
        end
    end
end