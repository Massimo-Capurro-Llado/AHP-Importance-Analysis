function[eigen] = EigenVectorCentrality(A)
    % This function calculates the eigen centrality value for each node of a graph. 
    % Parameters: A -> The adjacency matrix of the graph
    % Output: eigen -> A column vector with the value for eigen centrality of each node of 
    %                   the graph

    % Calculate eigenvalues and eigenvectors of A and get the eigenvector
    % corresponding to the maximum eigenvalue
    [eigenvectors,eigenvalues]=eig(A);
    eigen = abs(eigenvectors(:,end));

    %Normalize the result
    eigen = eigen./sum(eigen);
   
end