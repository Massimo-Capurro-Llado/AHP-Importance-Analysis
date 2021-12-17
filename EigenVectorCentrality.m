function[ranking] = EigenVectorCentrality(A,numerosity)
%Numerosity è la lunghezza del vettore ranking in output

    %Calcolo autovalori ed autovettori di A sfruttando la funzione eig
    [eigenvectors,eigenvalues]=eig(A);
    eigenvalues = sum(eigenvalues');

    %Calcolo l'ID corrispondente al massimo autovalore e ne ricavo
    %l'autovettore
    id_max_eigenvalues = find(eigenvalues(1,:)==max(eigenvalues));
    max_eigenvector = eigenvectors(:,id_max_eigenvalues);

    %Positivizzo ed ordino l'autovettore
    max_eigenvector = abs(max_eigenvector);
    sorted_eigenvector = sort(max_eigenvector,"descend");

    %Riporto i nodi secondo il loro valore di EigenVector centrality
    ranking = [];
    for j=1:numerosity
        ranking = [ranking,find(max_eigenvector==sorted_eigenvector(j))];
    end
end