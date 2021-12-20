clear all 
close all
clc

fileformat= input("The Graph you want to analize is Weighted: (y/n) ", 's');
if fileformat== 'y'
    %The input file must be cleaned before use
    file = input('Insert path of the  file to be analyzed: ','s');

    A= WeightedGraphFileReader(file);

elseif fileformat== 'n'
    %The input file must be cleaned before use
    file = input('Insert path of the  file to be analyzed: ','s');

    A= UnweightedGraphFileReader(file);
else
    error('Invalid input!! It must be y or n')
end


G=graph(A);
[degree] = DegreeCentrality(A);

[eigen]= EigenVectorCentrality(A);

[closeness]= ClosenessCentrality(G);

[pairwise]= PairWiseConnectivity(A);
