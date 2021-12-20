function[eigen] = EigenVectorCentrality(A)
    % This function calculates the eigen centrality value for each node of a graph. 
    % Parameters: A -> The adjacency matrix 
    % Output: eigen -> A vector with the value for eigen centrality of each node of G

    %Calculate eigenvalues and eigenvectors of A and get the eigenvector
    %corresponding to the maximum eigenvalue
    [eigenvectors,eigenvalues]=eig(A);
    eigen = eigenvectors(:,end);

    %Normalize the result
    eigen = eigen./max(eigen);
   
end