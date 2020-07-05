function new_popu=Adewuya_crossover(popu,crossover_rate)

new_popu=popu;
popu_n=size(popu,1);
gene_number=size(popu,2);
a=rand;

for i=1:popu_n/2
    p1=randi([1 popu_n]);
    p2=randi([1 popu_n]);
    while p1==p2
        p1=randi([1 popu_n]);
        p2=randi([1 popu_n]);
    end
    
    if rand<crossover_rate
        m=randi([1 gene_number]);
        new_popu(p1,m)=popu(p1,m)+a*(popu(p2,m)-popu(p1,m));
        new_popu(p2,m)=popu(p1,m)+a*(popu(p1,m)-popu(p2,m));
        %z=gn-m
        z=gene_number-m;
        for i=1:z
            new(p1,m+1)=popu(p2,m+i);
            new(p2,m+1)=popu(p1,m+i);
        end
    end
end