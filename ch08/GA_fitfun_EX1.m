%Define the fitness function: z=cos(pi*x/2)
function PI=GA_fitfun_EX1(chro)

global MIN_offset
MIN_offset=1;

x=chro;
z=cos(pi*x/2);
PI=MIN_offset-z;