function [closensess] = ClosenessCentrality(G)
    % This function calculates the closeness centrality value for each node of a graph. 
    % Parameters: G -> The desired graph. Must be CONNECTED 
    % Output: closeness -> A vector with the value for closeness centrality of each node of G

    D=distances(G);
    closeness=sum(D, 2);
    closeness= 1./closeness;

    %Normalize the result
    closensess= closeness./max(closeness);

end