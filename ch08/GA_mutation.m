function new_popu = GA_mutation(popu, bit_length, mutate_rate)

new_popu = popu;
popu_n = size(popu, 1);
gene_number = size(popu, 2)/bit_length;

mask = rand(popu_n, gene_number*bit_length) < 2*rand*mutate_rate;
new_popu = xor(new_popu, mask)
end