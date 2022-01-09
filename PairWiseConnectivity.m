function [pairwise] = PairWiseConnectivity(A)
    % This function calculates the pairwise connectivity value for each node of a graph. 
    % Parameters:   A -> The adjacency matrix of the desired graph
    % Output: pairwise -> A vector with the value for pairwise connectivity
    %                       of each node of the graph
    
    % Calculate the number of nodes and possible connections
    n= size(A, 1);
    max_conn= n*(n-1);

    pairwise= [];
    for i=1:n

        A_temp= A;
        % Remove the i-th node from the graph 
        A_temp(i,:)= 0;
        A_temp(:,i)= 0;
        
        % Calculate PWC and nPWC
        dist= distances(graph(A_temp));
        dist(find(dist==inf))= 0;
        dist= (dist>0);
        PWC= sum(sum(dist));
        nPWC= PWC/(max_conn);

        % Append to the result the i-th node pairwise value (1-nPWC)
        pairwise= [pairwise; 1-nPWC];
    end

    % Normalize the result
    pairwise = pairwise./sum(pairwise);
end