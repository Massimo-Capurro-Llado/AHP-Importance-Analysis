function[degree] = DegreeCentrality(A)
    % This function calculates the degree centrality value for each node of a graph. 
    % Parameters: A -> The adjacency matrix of the graph
    % Output: degree -> A column vector with the value for degree centrality of each 
    %                   node of the graph
    
    degree = transpose(sum(A'));

    %Normalize the result
    degree = degree./sum(degree);
end