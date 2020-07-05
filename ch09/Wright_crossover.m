function new_popu=Wright_crossover(popu,crossover_rate)

new_popu=popu;
popu_n=size(popu,1);
gene_number=size(popu,2);

for i=1:popu_n/3
    p1=randi([1 popu_n]);
    p2=randi([1 popu_n]);
    p3=randi([1 popu_n]);
    while p1==p2 || p1==p3 || p2==p3
        p1=randi([1 popu_n]);
        p2=randi([1 popu_n]);
        p3=randi([1 popu_n]);
    end
    
    if rand<crossover_rate
        for j=1:gene_number
            new_popu(p1,j)=0.5*popu(p1,j)+0.5*(popu(p2,j)-popu(p1,j));
            new_popu(p2,j)=1.5*popu(p1,j)-0.5*(popu(p1,j)-popu(p2,j));
            new_popu(p3,j)=-0.5*popu(p1,j)+1.5*(popu(p1,j)-popu(p2,j));
        end
    end
end