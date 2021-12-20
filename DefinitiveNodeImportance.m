function[definitive_importance] = DefinitiveNodeImportance(degree,D_Weight,eigen,E_Weight,closeness,C_Weight,pairwise,P_Weight)
    % This function calculates the definitive importance rank for each node 
    % Parameters:
    % degree,D_Weight,eigen,E_Weight,closeness,C_Weight,pairwise,P_Weight
    % -> The importance vector of each measure and its weight
    % Output: ranking -> A matrix of dimensions n x 2 (n = number of nodes)
    % in which the first column contains the definitive importance value
    % and the second column the respective node
    ranking = degree.*D_Weight + eigen.*E_Weight + closeness.*C_Weight + pairwise.*P_Weight;
    for i=1:length(ranking)
        ranking(i,2)=i;
    definitive_importance = sortrows(ranking,1,"ascend");
    end
end