clear all 
close all
clc

% Read the input desired input file. 
% The input file must be cleaned before use.
fileformat= input("The Graph you want to analize is Weighted: (y/n) ", 's');

if fileformat== 'y'
    file = input('Insert path of the  file to be analyzed: ','s');
    A= WeightedGraphFileReader(file);

elseif fileformat== 'n'
    file = input('Insert path of the  file to be analyzed: ','s');
    A= UnweightedGraphFileReader(file);

else
    error('Invalid input!! It must be y or n')

end

% Calculate the node importance for every method
[degree]= DegreeCentrality(A);

[eigen]= EigenVectorCentrality(A);

[closeness]= ClosenessCentrality(A);

[pairwise]= PairWiseConnectivity(A);

% Read the AHP file and format the data into a table.  
data_file= input('Insert path of the data file from AHP to be analyzed: ','s');
ahp= readtable(data_file);

% Analyze the data with AHP 
[D_Weight, E_Weight, C_Weight, P_Weight] = AHPAnalysis(ahp);

% Calculate the definitive ranking and plot a colored graph
[definitive_importance] = DefinitiveNodeImportance(degree, D_Weight, eigen, ...
    E_Weight, closeness, C_Weight, pairwise, P_Weight);

ColoredGraph(A, definitive_importance)
