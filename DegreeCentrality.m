function[degree] = DegreeCentrality(A)
    % This function calculates the degree centrality value for each node of a graph. 
    % Parameters: A -> The adjacency matrix.
    % Output: degree -> A column vector with the value for degree centrality of each node of G
    
    degree = transpose(sum(A'));

    %Normalize the result
    degree = degree./max(degree);
end