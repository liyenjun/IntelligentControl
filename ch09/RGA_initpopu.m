function initpopu=RGA_initpopu(popu_size,gene_number,range)

initpopu=rand(popu_size,gene_number);

for i=1:popu_size
    initpopu(i,:)=(range(2,:)-range(1,:)).*initpopu(i,:)+range(1,:);
end