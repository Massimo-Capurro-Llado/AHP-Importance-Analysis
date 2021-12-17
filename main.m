clear all 
close all
clc

%The input file must be cleaned before use
file = input('Insert path of the  file to be analyzed: ','s');

A= UnweightedGraphFileReader(file);

n= 10; %The number of important nodes

G=graph(A);
[degree] = DegreeCentrality(A,n);

[eigen]= EigenVectorCentrality(A,n);

[closeness]= ClosenessCentrality(G);

[pairwise]= PairWiseConnectivity(A);

d=plot(G, 'LineStyle','-');
highlight(d,degree,'NodeColor','r','MarkerSize', 10)

figure()
e=plot(G, 'LineStyle','-');
highlight(e,eigen,'NodeColor','g','MarkerSize', 10)

figure()
c=plot(G, 'LineStyle','-');
closeness_important = find(maxk(closeness, n));
highlight(c,closeness_important,'NodeColor','c','MarkerSize', 10)

figure()
p=plot(G, 'LineStyle','-');
pairwise_important= find(maxk(pairwise,n));
highlight(p,pairwise_important,'NodeColor','m','MarkerSize', 10)
