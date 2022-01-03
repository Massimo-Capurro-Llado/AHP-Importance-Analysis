function [] = ColoredGraph(A, definitive_importance)
    % This function takes the definitive importance and plots the graph
    % coloring its nodes based on their individual importance for the
    % network.
    % Parameters:   G -> The graph
    %               definitive_importance
    % Dark red assigned to the nodes of the highest importance for the network, 
    % orange to very important nodes and yellow for nodes of intermidiate importance.

    reds= find(definitive_importance>= prctile(definitive_importance, 98));
    oranges= setdiff(find(definitive_importance>= prctile(definitive_importance, 95)),reds);
    yellows= setdiff(find(definitive_importance>= prctile(definitive_importance, 90)), union(oranges, reds));
    
    % Plot the graph and color the nodes
    G= graph(A);
    h= plot(G);
    hold on
    highlight(h, reds, 'MarkerSize',20, 'NodeColor', [0.7,0.0,0.0]) 
    highlight(h, oranges, 'MarkerSize',15, 'NodeColor', [0.9100    0.4100    0.1700])
    highlight(h, yellows, 'MarkerSize',10, 'NodeColor', [1.0,0.7,0.0])
end