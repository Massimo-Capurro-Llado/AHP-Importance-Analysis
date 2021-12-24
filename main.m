clear all 
close all
clc

fileformat= input("The Graph you want to analize is Weighted: (y/n) ", 's');
if fileformat== 'y'
    file = input('Insert path of the  file to be analyzed: ','s');

    %The input file must be cleaned before use
    A= WeightedGraphFileReader(file);

elseif fileformat== 'n'
    %The input file must be cleaned before use
    file = input('Insert path of the  file to be analyzed: ','s');

    A= UnweightedGraphFileReader(file);
else
    error('Invalid input!! It must be y or n')
end


G=graph(A);
[degree]= DegreeCentrality(A);

[eigen]= EigenVectorCentrality(A);

[closeness]= ClosenessCentrality(G);

[pairwise]= PairWiseConnectivity(A);

% Read the file and format the data into a table.  
data_file= input('Insert path of the data file from AHP to be analyzed: ','s');
ahp= readtable(data_file);

[D_Weight, E_Weight, C_Weight, P_Weight] = AHPAnalysis(ahp);

[definitive_importance] = DefinitiveNodeImportance(degree, D_Weight, eigen, ...
    E_Weight, closeness, C_Weight, pairwise, P_Weight);

ColoredGraph(G, definitive_importance)
