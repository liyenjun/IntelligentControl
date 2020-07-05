function new_popu=Boundary_mutation(popu,range,mutate_rate)

new_popu=popu;
popu_n=size(popu,1);
gene_number=size(popu,2);

for i=1:popu_n
    p1=randi([1 popu_n]);
    L_U=randi([1 2]);
    if rand<mutate_rate
        k=randi([1 grne_number]);
        if L_U==1
            q=range(1,k);
        else
            q=range(2,k);
        end
        new_popu(p1,k)=q;
    end
end