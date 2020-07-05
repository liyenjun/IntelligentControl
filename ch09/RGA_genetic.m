function [popu,fitness,upper,average,lower,BEST_popu]...
    =RGA_genetic(popu_size,gene_no,range,fitfun,...
    generation_no,crossover_rate,mutate_rate,elite)

initpopu=RGA_initpopu(popu_size,gene_no,range);
popu=initpopu;

for nn=1:generation_no
    [fitness,popu]=RGA_fitpopu(popu,fitfun);
    [upper(nn),index]=max(fitness);
    average(nn)=mean(fitness);
    lower(nn)=min(fitness);
    BEST_popu(nn,1:gene_no)=popu(index,:);
    popu=RGA_newpopu(popu,fitness,crossover_rate,mutate_rate,elite,range);
end
        