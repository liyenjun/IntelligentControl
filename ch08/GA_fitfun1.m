function PI=GA_fitfun1(chro)
% global MIN_offset
% MIN_offset=100; %Disable the code
    x=chro;
    %Define the fitness function
    z=x*x;
    PI=z;
end