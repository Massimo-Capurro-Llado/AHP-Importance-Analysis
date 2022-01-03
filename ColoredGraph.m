function [] = ColoredGraph(G, definitive_importance)
    % This function takes the definitive importance and plots the graph
    % coloring its nodes based on their individual importance for the
    % network.
    % Parameters:   G -> The graph
    %               definitive_importance
    % Dark red assigned to the nodes of the highest importance for the network, 
    % orange to very important nodes and yellow for nodes of intermidiate importance.

    reds= find(definitive_importance(:,1)>= 0.85);
    oranges= find(definitive_importance(:,1)>= 0.7 & definitive_importance(:,1)<0.85);
    yellows= find(definitive_importance(:,1)>= 0.55 & definitive_importance(:,1)<0.7);
    
    % Plot the graph and color the nodes
    h= plot(G,Layout="force3");
    hold on
    highlight(h, reds, 'MarkerSize',20, 'NodeColor', [0.7,0.0,0.0]) 
    highlight(h, oranges, 'MarkerSize',15, 'NodeColor', [0.9100    0.4100    0.1700])
    highlight(h, yellows, 'MarkerSize',10, 'NodeColor', [1.0,0.7,0.0])
end