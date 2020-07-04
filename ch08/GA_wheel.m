function new_popu=GA_wheel(fitness,popu)
    %Make sure the fitness values are positive
    Y=min(fitness);
    if Y<0
        fitness=fitness-Y;
    end
    %Calculate the number of population
    popu_n=length(fitness);
    %Calculate the average fitness values
    fit_sum=sum(fitness);
    fit_mean=fit_sum/popu_n;
    %The number of parent population for reproduction
    popu_select=fitness/fit_mean;
    %Let the best parent population be selected twice
    if popu_select(1)<2
        popu_select=popu_select.^2;
    end
    
    popu_select=round(popu_select);
    %If the population size is not enough, a chrommosome will be
    %compensated
    Y=sum(popu_select);
    while(Y<popu_n)
        I=find(popu_select==0);
        popu_select(I(1))=popu_select(I(1))+1;
        Y=sum(popu_select);
    end
    %Obtain the new offspring
    K=1;
    for I=1:popu_n
        %The population size is enough
        if popu_select(I)>0
            %Reproduce the better parent
            for J=1:popu_select(I)
        new_popu(K,:)=popu(I,:); K=K+1;
        if K>popu_n,
            break;
        end;end;end
        if K>popu_n,
            break;
        end;end