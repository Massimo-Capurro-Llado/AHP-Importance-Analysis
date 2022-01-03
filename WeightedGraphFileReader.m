function[A] = WeightedGraphFileReader(file)
    %The function return the adjacency matrix of an unweighted graph text file
    
    % Read from file
    f= fopen(file, "r");

    % Read its values and create an adjacency matrix with the given values
    [archi]= fscanf(f,"%d %d %f", inf);

    % Close file
    fclose(f);

    % Create adjacency matrix discarding weight values of the edges
    ARCHI= [archi(1:3:end), archi(2:3:end)];
    nodes= max(max(ARCHI));
    A= zeros(nodes);

    for i= 1:length(ARCHI)
        from= ARCHI(i,1);
        to= ARCHI(i,2);
        A(from, to)=1;
        A(to, from)=1;
    end
end