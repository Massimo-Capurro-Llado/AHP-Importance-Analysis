function [closensess] = ClosenessCentrality(A)
    % This function calculates the closeness centrality value for each node of a graph. 
    % Parameters: A -> The Adjacency matrix of the graph.  
    % Output: closeness -> A column vector with the value for closeness centrality of each node of 
    %                       the graph

    G=graph(A);
    D=distances(G);

    % Set the infinite distances to a fixed maximum value for the graph
    D(find(D==inf))=length(D)/4;
    closeness=sum(D, 2);
    closeness= 1./closeness;

    % Normalize the result
    closensess= closeness./sum(closeness);

end