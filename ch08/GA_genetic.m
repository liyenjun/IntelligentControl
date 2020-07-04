function [popu, popu_real, fitness, upper, average, lower, BEST_popu]...
        = GA_genetic(popu_size, bit_length, gene_no, range, fitfcn,...
                        generation_no, crossover_rate, mutate_rate, elite);
%*******************************
%INOUTS:
% (1)popu_size:   the size of population.
% (2)bit_length:  the bit length.
% (3)gene_no: the number of genes.
% (4)range:   the matrix woth min on the first row and max on the 
%             second row, such as,
%             [-3 -3 5 <=== LOWER bounds
%               4 5  8]<=== UPPER bounds
% (5)fitfcn:  fitness function (MATLAB string).
% (6)generation_no:   the size of generations.
% (7)crossover_rate: the probability of single-oint crossover rate.
% (8)mutate_rate: the probability of mutation.
% (9)elite:   keeping of the best fitness for every generation.
% OUTPUTS:
% (1)popu:    population of the last generation
% (2)popu_real:   the equivalent dicimal values of binary popu
% (3)fitness: fitness valuws of the last populations
% (4)upper:   maximum fitness of each generation
% (5)average: average fitness of each generation
% (6)lower:   minimum fitness of each generation
% (7)BEST_popu: the best population with reall number

%INITIAL POPULATION
initpopu=GA_initpopu(popu_size, bit_length, gene_no);
popu=initpopu;

%Set matrices for upper, average and ;ower
upper=zeros(generation_no,1);
average=zeros(generation_no,1);
lower=zeros(generation_no,1);
BEST_popu=zeros(generation_no,gene_no);

%MAIN LOOP FOR GA

for nn=1:generation_no;
    %valuate fitness function for each individual
    [fitness, popu_real, popu]=GA_fitpopu(popu,bit_length,range,fitfcn);
    %ill fitness function matrices
    [upper(nn),index]=max(fitness);
    average(nn)=mean(fitness);
    lower(nn)=min(fitness);
    BEST_popu(nn,1:gene_no)=popu_real(index,:);
    %Generate next population via selection, crossover and mutation
    popu=GA_newpopu(popu, fitness, bit_length, crossover_rate, mutate_rate, elite);
end