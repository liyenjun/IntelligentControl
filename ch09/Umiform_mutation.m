function new_popu=Umiform_mutation(popu,range,mutate_rate)

new_popu=popu;
popu_n=size(popu,1);
gene_number=size(popu,2);
b=rand;

for i=1:popu_n
    p1=randi([1 popu_n]);
    if rand<mutate_rate
        k=randi([1 gene_number]);
        new_popu(p1,k)=range(1,k)+b*(range(2,k)-range(1,k));
    end
end